import 'package:flutter/material.dart';

import '../constant/constant.dart';
class CustomFormField extends StatelessWidget {

  final String title ;
  final String hint;
   var functionchange;
   var validate;

   CustomFormField({
     required this.title,
     required this.hint,
     this.functionchange,
     this.validate
   });
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
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextFormField(
              validator:validate,

              onChanged:functionchange ,

              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,

                filled: true,
                fillColor: thirdColor,

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
