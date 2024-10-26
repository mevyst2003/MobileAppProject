import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminAssetlist.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/Borrower/RequestBorrowCar.dart';
import 'package:mobileappproject/home.dart';

void main() {
  runApp(const MaterialApp(
    home: Adminassetlist(),
    debugShowCheckedModeBanner: false, //ปิดแบนเนอร์ debug mode ด้านขวาบน,
  ));
}
