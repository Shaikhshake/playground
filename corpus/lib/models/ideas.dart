import 'package:flutter/material.dart';

class Ideas {
  String name;
  DateTime dateCreated = DateTime.now();
  String description;
  AssetImage logo;

  Ideas(
      {this.name = "Unknown",
      this.description = "Description",
      this.logo = const AssetImage("assets/images/window_logo.png")});

}
