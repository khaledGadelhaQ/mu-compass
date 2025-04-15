import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFeild extends StatefulWidget {
  final String? hintText;
  final bool? obscurText;
  final Widget? SuffixIcon;
  final TextInputType? keyboardinputType;
  final List<TextInputFormatter>? foramat;
  final TextEditingController? controller;

  const TextFormFeild(
      {super.key,
      required this.hintText,
      required this.obscurText,
      this.SuffixIcon,
      this.keyboardinputType,
      this.foramat,
      this.controller});

  @override
  State<TextFormFeild> createState() => _TextfeildState();
}

class _TextfeildState extends State<TextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: widget.controller,
        inputFormatters: widget.foramat,
        keyboardType: widget.keyboardinputType,
        style: const TextStyle(color: Colors.white),
        obscureText: widget.obscurText!,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          contentPadding: const EdgeInsets.all(15),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(17))),
          suffixIcon: widget.SuffixIcon,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(17))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(17))),
        ),
      ),
    );
  }
}
