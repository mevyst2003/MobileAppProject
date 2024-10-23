import 'package:flutter/material.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/home.dart';
import 'package:mobileappproject/login.dart';
import 'package:mobileappproject/register.dart';

void main() {
  runApp(const MaterialApp(
    home: Cartypelist1(),
    debugShowCheckedModeBanner: false, //ปิดแบนเนอร์ debug mode ด้านขวาบน,
  ));
}
