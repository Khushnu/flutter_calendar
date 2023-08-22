import 'package:flutter/material.dart';

class Pizzacard extends StatelessWidget {
  const Pizzacard({super.key, required this.text, required this.img, required this.description, required this.price});
  final String text; 
  final String img; 
  final String description; 
  final String price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      flexibleSpace: Container(),
      ),
      body:  Stack(
        alignment: Alignment.center,
          children: [
            Container(
            height: 90, 
            width: 350,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), 
              color: const Color.fromARGB(255, 251, 229, 39),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(text.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                     Text(description.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                      Text('\$$price', style:  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 310, horizontal: 7),
             child: Align(
              alignment: Alignment.topRight,
               child: Container(
                  height: 140, 
                  width: 120, 
                  decoration:  BoxDecoration(
                   color: const Color.fromARGB(255, 251, 229, 39),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Image.asset(img),
                ),
             ),
           ),
          ]
        ),

    );
  }
}