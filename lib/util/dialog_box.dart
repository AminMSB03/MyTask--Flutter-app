import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final time;
  VoidCallback onSave;
  VoidCallback onCancel;
  VoidCallback chooseTime;

  DialogBox({
    super.key,
    required this.controller,
    required this.time,
    required this.onSave,
    required this.onCancel,
    required this.chooseTime,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            // ColorChooser(),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // save button
                MyButton(
                  text: "choose time",
                  onPressed: chooseTime,
                  color: Color.fromARGB(255, 0, 0, 0),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                ),
                const SizedBox(width: 8),
                MyButton(
                    text: "Save",
                    onPressed: onSave,
                    color: Color.fromARGB(255, 255, 255, 255),
                    textColor: Color.fromARGB(255, 0, 0, 0)),

                // cancel button
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorChooser extends StatelessWidget {
  final ValueChanged<Color>? onColorSelected;

  const ColorChooser({super.key, this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildColorButton(Color.fromARGB(255, 243, 25, 10), context,1),
        SizedBox(width: 10),
        _buildColorButton(Color.fromARGB(255, 244, 91, 88), context,2),
        SizedBox(width: 10),
        _buildColorButton(Color.fromARGB(255, 255, 205, 210), context,3),
      ],
    );
  }

  Widget _buildColorButton(Color color, BuildContext context,int choosed) {
    return GestureDetector(
      onTap: () {
        print(choosed);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
