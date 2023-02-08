import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool isObsecure;

  const CustomInput({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.isObsecure = false,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 213, 0, 0),
            ),
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: focusNode.hasFocus ? Colors.redAccent[700] : Colors.black,
          ),
        ),
        obscureText: widget.isObsecure,
      ),
    );
  }
}
