import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final dynamic id;
  final dynamic title;
  final dynamic price;
  final dynamic description;
  final dynamic category;
  final dynamic image;
  final dynamic rating;
  const ProductDetails({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        leading: const BackButton(
            color: Colors.black54
        ),
        backgroundColor: Colors.white,
        title: const Text("Product Details",style: TextStyle(color: Colors.black54)),
      ),
        body: ListView(
          children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("$id : $title",style:const TextStyle(color: Colors.blueGrey,fontSize: 15)),
          ),
          Container(
            margin:const EdgeInsets.all(20),
            child: Image.network(image.toString()),
          ),
          Container(
            padding:const EdgeInsets.all(10),
            child: Text("Price : ${price.toString()} usd",style:const TextStyle(color: Colors.deepOrange,fontSize: 15)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text("Description",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  fontSize: 20
                )
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 10),
            child: Text(description.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  letterSpacing: .5,
                  height: 1.5,
                  fontSize: 18
              )
            ),
          )
        ],
      )
    );
  }
}
