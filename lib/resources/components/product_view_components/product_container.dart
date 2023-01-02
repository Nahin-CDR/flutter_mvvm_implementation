import 'package:flutter/material.dart';

Widget productContainer({required dynamic imgUrl})=>Container(
  padding:const EdgeInsets.all(10),
  margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
  decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.blueAccent.withOpacity(.1),
          spreadRadius: 4,
          blurRadius: 2,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(10)
  ),
  child: Center(
    child: Image.network(imgUrl.toString()),
  ),
);