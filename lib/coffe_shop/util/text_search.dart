import 'package:flutter/material.dart';

class TextSearch extends StatelessWidget {
  const TextSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(decoration: InputDecoration(
      hintText: 'Find your coffee ...',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade600)
      ),
      prefixIcon: Icon(Icons.search)
    ),


    );
  }
}
