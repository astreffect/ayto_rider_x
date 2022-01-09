import 'package:flutter/material.dart';
import 'package:ayto_rider_x/brand_colors.dart';

class MyEditText extends StatelessWidget {
  const MyEditText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: BrandColors.editText,
        height: 55,
        width: 300,
        child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your phone number"
                ),
              )
            ]
        ));
  }}
