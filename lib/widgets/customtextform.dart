import 'package:flutter/material.dart';

import 'customtext.dart';

class CustomTextForm extends StatelessWidget {
  final String text;
  final String hint;
  final Function onsave;
  final Function validator;

  const CustomTextForm({ this.text,
    this.hint, this.onsave, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: [
          CustomText(text: text,fontsize: 15,color: Colors.grey.shade900,
          ),
          SizedBox(height: 5,),
          TextFormField(
            onSaved: onsave,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText:hint,
              hintStyle: TextStyle(
                  color: Colors.grey
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
