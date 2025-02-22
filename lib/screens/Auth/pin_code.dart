// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:beepo/components/bottom_nav.dart';
import 'package:beepo/providers/account_provider.dart';
import 'package:beepo/providers/auth_provider.dart';
import 'package:beepo/providers/wallet_provider.dart';
import 'package:beepo/providers/xmtp.dart';
import 'package:beepo/screens/Auth/verify_code.dart';
import 'package:beepo/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../Utils/styles.dart';
import '../../components/beepo_filled_button.dart';

class PinCode extends StatefulWidget {
  final File? image;
  final String? name;
  final bool isSignedUp;
  const PinCode({
    Key? key,
    this.image,
    this.name,
    this.isSignedUp = true,
  }) : super(key: key);

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  TextEditingController otp = TextEditingController();
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
        title: Text(
          "Secure your account",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.isSignedUp
                  ? "Enter pin to access your account"
                  : "Create a PIN to protect your\ndata and transactions",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/pin_img.png',
              height: 127,
              width: 127,
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: Get.size.width * 0.6,
              child: PinCodeTextField(
                appContext: context,
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 30,
                  fieldWidth: 30,
                  activeColor: primaryColor,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                  borderWidth: 3,
                  fieldOuterPadding: EdgeInsets.zero,
                  activeFillColor: Colors.white,
                  selectedColor: primaryColor,
                  selectedFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: otp,
                onChanged: (val) {},
              ),
            ),
            const Spacer(),
            BeepoFilledButtons(
              text: 'Continue',
              onPressed: () async {
                if (otp.text.length == 4) {
                  if (widget.isSignedUp == false) {
                    if (widget.image != null) {
                      Get.to(
                        () => VerifyCode(
                          name: widget.name!,
                          image: widget.image!,
                          pin: otp.text,
                        ),
                      );
                    }
                  } else {
                    String response = await login(otp.text);
                    if (response.contains("Incorrect Pin Entered")) {
                      showToast("Incorrect Pin Entered");
                      return;
                    }

                    final walletProvider =
                        Provider.of<WalletProvider>(context, listen: false);
                    final accountProvider =
                        Provider.of<AccountProvider>(context, listen: false);
                    final xmtpProvider =
                        Provider.of<XMTPProvider>(context, listen: false);

                    await walletProvider.initWalletState(response);
                    await xmtpProvider.initClientFromKey();
                    await accountProvider.initAccountState();

                    Get.to(
                      () => const BottomNavHome(),
                    );
                  }
                } else {
                  showToast('Please enter a valid PIN');
                }
              },
            ),
            SizedBox(
              height: 38.h,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
