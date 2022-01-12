// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ayto_rider_x/LoginPages/otp_Page.dart';
import 'package:ayto_rider_x/Utilites/edit_text.dart';
import 'package:ayto_rider_x/brand_colors.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final  mycontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final button = SizedBox(
        width: 100,
        height: 35,
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>OtpPage(mycontroller.text)
                )
            );

          },

          child: Text("Proceed"),
          style: ElevatedButton.styleFrom(
              primary: BrandColors.button,
              onPrimary: Colors.black


          ),
        ));


    final countryCode = Container(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("+91",style:  TextStyle(
            color: Colors.white,
            // fontSize: 28,
            fontWeight: FontWeight.w600,

          ),),
        )

    );


    final phonenumber = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      //initialValue: '',
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600
        ),
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),

      ),

    );


    return Material(
        child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            // shrinkWrap: false,
            child: Column(

                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                  const Center(
                    child: Text("Welcome",style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold,
                        color: BrandColors.enterphonenumber
                    ),),
                  ),
                  const SizedBox(
                    width: 350,
                    height: 50,
                  ),
                  Image.asset("assets/images/login1.png", fit: BoxFit.cover,height: 250,),
                  const SizedBox(
                    width: 500,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
                      child: Text("Enter your phone number",
                        style: TextStyle(
                            color:  BrandColors.enterphonenumber,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: BrandColors.editText,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        countryCode,
                        Flexible(child: phonenumber),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 50,
                  ),
                  button,
                  SizedBox(
                    height: 50,
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: RichText(
                          text: const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text:"Sign Up",
                                    style: TextStyle(
                                        color: BrandColors.signup,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ]

                          ),
                        ),
                      ),
                    ),
                  )
                ]


            )
        )

    );
  }
}

