import 'dart:io';

import 'package:beepo/components/beepo_filled_button.dart';
import 'package:beepo/constants/constants.dart';
import 'package:beepo/screens/Auth/pin_code.dart';
import 'package:beepo/utils/functions.dart';
import 'package:beepo/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController displayName = TextEditingController();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          //size: 30.0,
          onPressed: () {},
        ),
        foregroundColor: Colors.black,
        title: const Text(
          "Create your account",
          style: TextStyle(
            color: Color(0xb20e014c),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 131,
                  height: 131,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffc4c4c4),
                  ),
                  child: selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            selectedImage!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ))
                      : const Icon(
                          Icons.person_outlined,
                          size: 117,
                          color: Color(0x66000000),
                        ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      ImageUtil()
                          .pickProfileImage(context: context)
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            selectedImage = value;
                          });
                        }
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Display name",
                style: TextStyle(
                  color: Color(0x4c0e014c),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              controller: displayName,
            ),
            const Spacer(),
            BeepoFilledButtons(
              text: 'Next',
              color: Color(0xffFF9C34),
              onPressed: () async {
                if (displayName.text.trim().isEmpty) {
                  showToast('Please enter a display name');
                  return;
                }
                if (selectedImage == null) {
                  showToast('Please sekect a display image');
                  return;
                } else {
                  Get.to(
                    () => PinCode(
                      image: selectedImage,
                      name: displayName.text.trim(),
                      isSignedUp: false,
                    ),
                  );
                }
              },
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
