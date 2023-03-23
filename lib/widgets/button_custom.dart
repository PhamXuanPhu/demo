import 'package:conasi/resource/colors.dart';
import 'package:flutter/material.dart';

enum StyleButtonCustom { blue, white }

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {Key? key,
      required this.text,
      required this.voidCallback,
      this.style = StyleButtonCustom.blue})
      : super(key: key);
  final String text;
  final VoidCallback voidCallback;
  final StyleButtonCustom? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: voidCallback,
      style: ElevatedButton.styleFrom(
        primary: style == StyleButtonCustom.blue ? colorBtn : colorWhite,
        minimumSize: const Size.fromHeight(40),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: colorBtn),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text,
          style: TextStyle(
            color: style == StyleButtonCustom.blue ? colorWhite : colorBtn,
            fontSize: 15,
          )),
    );
  }
}

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation(
      {Key? key, required this.label, required this.voidCallback})
      : super(key: key);
  final String label;
  final VoidCallback voidCallback;

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: isSelected ? 200 : 180,
      height: isSelected ? 40 : 35,
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () async {
          setState(() => isSelected = false);
          await Future.delayed(const Duration(milliseconds: 150));
          setState(() => isSelected = true);
          widget.voidCallback();
        },
        style: ElevatedButton.styleFrom(
          primary: colorBtn,
          minimumSize: const Size.fromHeight(40),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: colorBtn),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(widget.label,
            style: const TextStyle(
              color: colorWhite,
              fontSize: 15,
            )),
      ),
    );
  }
}
