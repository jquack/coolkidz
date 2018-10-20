import 'package:flutter/material.dart';

Widget editRow({BuildContext context, String text, Function validator}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(text),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: (() => edit(context)),
        )
      ],
    ),
  );
}

edit(BuildContext context){print("edit!");}