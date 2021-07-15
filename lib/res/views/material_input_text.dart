import 'package:e_shop_flutter/base/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialInputText extends StatefulWidget {
  final String hintText;
  final ValueException? error;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final double? fontSize;
  final FontWeight? textFontWeight;
  final FontWeight? hintFontWeight;

  MaterialInputText(this.hintText,
      {this.error,
      this.controller,
      this.inputType,
      this.onChanged,
      this.fontSize,
      this.textFontWeight,
      this.hintFontWeight})
      : super();

  @override
  _MaterialInputTextState createState() => _MaterialInputTextState();
}

class _MaterialInputTextState extends State<MaterialInputText> {
  @override
  Widget build(BuildContext context) => TextFormField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        onChanged: widget.onChanged,
        style: GoogleFonts.roboto(
            fontSize: widget.fontSize ?? 18,
            fontWeight: widget.textFontWeight ?? FontWeight.normal),
        decoration: InputDecoration(
            errorText: widget.error?.message,
            hintStyle: GoogleFonts.roboto(
                fontSize: widget.fontSize ?? 18,
                fontWeight: widget.hintFontWeight ?? FontWeight.bold),
            hintText: widget.hintText),
      );
}
