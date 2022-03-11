
import 'package:flutter/material.dart';

const TextFormFieldDecoration =InputDecoration(
    //hintText: 'Enter Your Email Here...',
    //prefixIcon: Icon(Icons.email,),
    hintStyle: TextStyle(color: Colors.blueGrey,
        fontSize: 10.0),
    filled: true,
    fillColor: Colors.white70,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Colors.grey, width: 2),),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: Colors.black, width: 2),),
);