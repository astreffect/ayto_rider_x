// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:ayto_rider_x/brand_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpPage extends StatefulWidget {
  const OtpPage(this.phones);

  final String phones;
  //OtpPage(this.phones);


  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final button = SizedBox(
      width: 100,
      height: 35,
      child: ElevatedButton(
        onPressed: (){

          print("done");

          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context)=>OtpPage(mycontroller.text)
          //     )
          // );

        },

        child: Text("SUBMIT"),
        style: ElevatedButton.styleFrom(
            primary: BrandColors.button,
            onPrimary: Colors.black


        ),
      ));

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: BrandColors.button,
    borderRadius: BorderRadius.circular(5.0),
  );
  @override
  Widget build(BuildContext context) {


    return Material(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
            width: 50,
          ),
          const Text("Verification Page",
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold,
                  color: BrandColors.enterphonenumber
              )),
          const SizedBox(
            width: 350,
            height: 50,
          ),
          Image.asset("assets/images/login1.png",
            fit: BoxFit.cover,
            height: 250,),
          const Center(
            child: Text("Enter the OTP",
              style: TextStyle(
                  fontSize: 20,
                  color: BrandColors.enterphonenumber
              ),),
          ),
          // Container(
          //     child: Center(
          //     child: Text('verify +91 ${widget.phones}')
          //     )
          // ),
          //Otp box
          const SizedBox(
            height: 10,
            width: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: BrandColors.editText,
                  borderRadius: BorderRadius.circular(10.0 )
              ),
              child: Padding(
                  padding:const EdgeInsets.all(20.0),
                  child: PinPut(
                    eachFieldWidth: 45.0,
                    eachFieldHeight: 45.0,
                    withCursor: true,
                    fieldsCount: 5,
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    eachFieldMargin: EdgeInsets.symmetric(horizontal: 10),
                    //onSubmit: (String pin) => _showSnackBar(pin),
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.scale,
                    textStyle:
                    const TextStyle(color: Colors.black, fontSize: 20.0, height: 1),
                  )
              ),
            ),
          ),
          const SizedBox(
            width: 350,
            height: 50,
          ),
          button,


        ],
      ),
    );
  }
}
void loginWithPhone() async {
  auth.verifyPhoneNumber(
    phoneNumber: phoneController.text,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential).then((value){
        print("You are logged in successfully");
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e.message);
    },
    codeSent: (String verificationId, int? resendToken) {
      otpVisibility = true;
      verificationID = verificationId;
      setState(() {});
    },
    codeAutoRetrievalTimeout: (String verificationId) {

    },
  );
}

void verifyOTP() async {

  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);

  await auth.signInWithCredential(credential).then((value){
    print("You are logged in successfully");
    Fluttertoast.showToast(
        msg: "You are logged in successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  });
}
}
