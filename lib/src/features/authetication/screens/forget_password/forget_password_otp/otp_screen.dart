// ignore_for_file: prefer_const_constructors

import 'package:bookstore/src/features/authetication/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            Text(
              tOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '$tOtpMessage example@students.usu.ac.id',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.black.withOpacity(0.1),
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                },
                child: Text(tNext),
              ),
            )
          ],
        ),
      ),
    );
  }
}
