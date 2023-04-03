import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 100),
      height: 30,
      alignment: Alignment.center,
      child: TextField(
        onChanged: (value) {
          debugPrint(value);
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          hintText: "Altura",
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
