import 'package:flutter/material.dart';

import '../controller/constantes.dart';


class IconCard extends StatelessWidget {

  IconCard({this.icon, required this.genero});
  
  final IconData? icon;
  final String genero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 95.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genero,
          style: kDescricaoStyle,
        ),
      ],
    );
  }
}