import 'package:beepo/services/database.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mongo_dart/mongo_dart.dart';

class AccountProvider extends ChangeNotifier {
  String? username;
  String? displayName;
  String? ethAddress;
  Db? db;

  Future<String> initDB() async {
    try {
      db = await Db.create(
          'mongodb+srv://admin:admin1234@cluster0.x31efel.mongodb.net/?retryWrites=true&w=majority');
      await db!.open();
      return "DB init";
    } catch (e) {
      return (e.toString());
    }
  }

  Future<String> initAccountState() async {
    var username_ = await Hive.box('beepo2.0').get('username');
    var displayName_ = await Hive.box('beepo2.0').get('displayName');
    var ethAddress_ = await Hive.box('beepo2.0').get('ethAddress');
    try {
      username = username_;
      displayName = displayName_;
      ethAddress = ethAddress_;
      return "";
    } catch (e) {
      return (e.toString());
    }
  }

  Future<Map> getUser() async {
    try {
      Map data = await dbGetUser(db!, username!);
      print(data);
      return {'success': "done"};
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return ({'error': e.toString()});
      }
    }
    return ({'error': 'Not done'});
  }

  Future<String> createUser(base64Image, db, displayName, ethAddress,
      btcAddress, encrypteData) async {
    try {
      await dbCreateUser(
          base64Image, db, displayName, ethAddress, btcAddress, encrypteData);

      return "done";
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return (e.toString());
      }
    }
    return ('Not done');
  }

  Future<Map> updateUser(base64Image, db, displayName, bio, newUsername) async {
    try {
      var data = await dbUpdateUser(
          base64Image, db, displayName, bio, newUsername, ethAddress);
      await initAccountState();
      if (data['error'] == null) {
        return {'success': data};
      } else {
        return {'error': data["error"]};
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return ({'error': e.toString()});
      }
    }
    return ({'error': 'Not done'});
  }
}
