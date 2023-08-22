

import 'package:flutter/material.dart';
import 'package:flutter_calendar/model.dart';
import 'package:flutter_calendar/widget.dart';


class ConesPage extends StatelessWidget {
  const ConesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mystyle1 = const TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
    var mystyle2 = TextStyle(
        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal.shade700);
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const HomePage(),
              //   ),
              //   (route) => false,
              // );
            },
          ),
          title: const Text(
            "Cones",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade200,
                  Colors.green
                ], // Add your desired gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
          ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: screenWidth > 600 ? 0.7 : 0.8,
          ),
          itemCount: homes.length > 5 ? 5 : homes.length,
          itemBuilder: (context, index) {
            var home = homes[index];
            return InkWell(
              onTap: () {
                //yaha se routing krwa kr mein detailpage me jarha hu simple
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Pizzacard(
                    text: home.title, 
                    img: home.image, 
                    price: home.price, 
                    description: home.desc,
                  ),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      spreadRadius: 2,
                      blurRadius: 25,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          'images/piz.png',
                          height: screenWidth * 0.35,
                          width: screenWidth * 0.40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          alignment: Alignment.centerLeft,
                         
                            child: Text(
                              home.title,
                              style: mystyle1,
                              overflow: TextOverflow.clip,
                            ),
                          
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'oo',
                            style: mystyle2,
                          ),
                          InkWell(
                            onTap: () {
                           
                            },
                            child: const SizedBox(width: 10),
                          ),
                          // RatingBar.builder(
                          //     initialRating: 5,
                          //     itemSize: 12,
                          //     minRating: 5,
                          //     direction: Axis.horizontal,
                          //     itemCount: 5,
                          //     itemBuilder: (context, index) => const Icon(
                          //           Icons.star,
                          //           color: Colors.red,
                          //         ),
                          //     onRatingUpdate: (rating) {}),
                        ],
                      )
                    ],
                  ),
              
              ),
            );
          },
        ),
      ),
    );
  }
}