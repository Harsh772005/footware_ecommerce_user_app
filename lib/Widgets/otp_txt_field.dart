import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';

class OtpTextField extends StatelessWidget {
  OtpFieldControllerV2 otpController;

  final bool isOtpVisible;
  final Function (String?) onCompleted;

  OtpTextField({super.key,required this.otpController, required this.isOtpVisible, required this.onCompleted});


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isOtpVisible,
      child: OTPTextFieldV2(
        controller: otpController,
        length: 4,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 15,
        style: TextStyle(fontSize: 17),
        onChanged: (pin) {
          print("Changed: " + pin);
        },
        onCompleted: (pin) {
          onCompleted(pin);
        },
      ),
    );
  }
}
