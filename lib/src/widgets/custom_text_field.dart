import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.description,
    required this.isPassword,
    required this.isEmail,
    required this.controller,
  });
  final String text;
  final String description;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  RxBool isFocused = false.obs;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    isFocused.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: constraints.maxHeight * 0.15,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          TextField(
            obscureText: widget.isPassword,
            controller: widget.controller,
            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(70, 118, 110, 110),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(192, 118, 245, 1),
                  width: 3.4,
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
            focusNode: _focusNode,
          ),
          Obx(
            () {
              if (isFocused.isTrue && widget.description.isNotEmpty) {
                return Text(
                  widget.description,
                  style: const TextStyle(color: Colors.white),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      );
    });
  }
}
