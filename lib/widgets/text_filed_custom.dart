// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:conasi/resource/colors.dart';

class TextFiledUserName extends StatefulWidget {
  const TextFiledUserName(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  @override
  State<TextFiledUserName> createState() => _TextFiledUserNameState();
}

class _TextFiledUserNameState extends State<TextFiledUserName> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        fontSize: 15,
        color: colorText,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintText,
          prefixIcon: const Icon(
            Icons.person,
            color: colorText,
            size: 20,
          ),
          suffixIcon: widget.controller.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () => {widget.controller.clear()},
                  icon: const Icon(
                    Icons.clear_outlined,
                    color: colorText,
                    size: 20,
                  ),
                ),

          ///fillColor, filled thay đổi màu background textfield
          fillColor: colorTrain_30,
          filled: true,
          hintStyle: const TextStyle(fontSize: 15, color: colorHint),
          border: OutlineInputBorder(

              /// thay đổi border
              borderSide: const BorderSide(color: colorWhite),
              borderRadius: BorderRadius.circular(10))),
      maxLines: 1,
    );
  }
}

class TextFiledPassword extends StatefulWidget {
  const TextFiledPassword(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  @override
  State<TextFiledPassword> createState() => _TextFiledPasswordState();
}

class _TextFiledPasswordState extends State<TextFiledPassword> {
  bool enableIsPassword = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,

      /// thay đổi kiểu của password
      obscureText: enableIsPassword,
      style: const TextStyle(
        fontSize: 15,
        color: colorText,
      ),
      decoration: InputDecoration(

          /// canh giua center text khi set chieu cao
          contentPadding: EdgeInsets.zero,

          ///labelText: text,
          hintText: widget.hintText,

          /// thêm icon trước
          prefixIcon: const Icon(
            Icons.lock,
            color: colorText,
            size: 20,
          ),
          suffixIcon: widget.controller.text.isEmpty
              ? null
              : IconButton(
                  icon: enableIsPassword
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: colorText,
                          size: 20,
                        )
                      : const Icon(
                          Icons.remove_red_eye,
                          color: colorText,
                          size: 20,
                        ),
                  onPressed: () =>
                      setState(() => {enableIsPassword = !enableIsPassword})),

          ///fillColor, filled thay đổi màu background textfield
          fillColor: colorTrain_30,
          filled: true,
          hintStyle: const TextStyle(fontSize: 15, color: colorHint),
          border: OutlineInputBorder(

              /// thay đổi border
              borderSide: const BorderSide(color: colorWhite),
              borderRadius: BorderRadius.circular(10))),
      maxLines: 1,
    );
  }
}

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    Key? key,
    required this.onChanged,
    required this.title,
  }) : super(key: key);
  final Function(String) onChanged;
  final String title;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      onChanged: (newString) {
        widget.onChanged(newString);
      },
      keyboardType: TextInputType.emailAddress,

      /// thay đổi kiểu của password
      //  obscureText: enableIsPassword,
      style: const TextStyle(
        fontSize: 15,
        color: colorText,
      ),
      decoration: InputDecoration(

          /// canh giua center text khi set chieu cao
          contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          labelText: widget.title,
          //  hintText: widget.hintText,

          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () => {controller.clear()},
                  icon: const Icon(
                    Icons.clear_outlined,
                    color: colorText,
                    size: 20,
                  ),
                ),

          ///fillColor, filled thay đổi màu background textfield
          fillColor: colorTrain_30,
          filled: true,
          hintStyle: const TextStyle(fontSize: 15, color: colorHint),
          border: OutlineInputBorder(

              /// thay đổi border
              borderSide: const BorderSide(color: colorWhite),
              borderRadius: BorderRadius.circular(10))),
      maxLines: 1,
    );
  }
}
