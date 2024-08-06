import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef validation = String? Function(String?)? ;
class CustomFormField extends StatelessWidget {
   CustomFormField({super.key,this.isObscure = false,required this.title, required this.hintText,required this.keyboardType,required this.maxLength,required this.controller,required this.validator });
    String title;
    String hintText;
   TextInputType keyboardType;
   bool isObscure ;
   int maxLength ;
   validation validator ;
   TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: 12.h,),
        TextFormField(
          controller: controller,
         maxLength: maxLength,
          keyboardType:keyboardType ,
          obscureText: isObscure ,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black.withOpacity(.7)),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r) ),
            errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r) ),
            border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r) ),
          ),
        )
      ],
    );
  }
}
