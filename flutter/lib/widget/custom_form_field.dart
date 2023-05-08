import 'package:flutter/material.dart';

import '../constant/constant.dart';
class CustomFormField extends StatelessWidget {

  final String title ;
  final String hint;
   var controller;
   var saved;




   CustomFormField({required this.title,required this.hint,this.controller,this.saved});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title,style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: thirdColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFormField(
              controller: controller,
              onSaved:saved,

              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: hintFormColor,)

              ),
              cursorColor: primaryColor,
              // onChanged: (value){
              //   email=value;
              // },
            ),
          ),
        ),
      ],
    );
  }
}
