// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amc_canteen/screens/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food.dart';
import 'account.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Fooddetail> fooddetail = [
      Fooddetail(
          id: 't1',
          image: "assets/samosa.png",
          title: 'Samosa',
          price: 15,
          detail: 'with green & red chutney'),
      Fooddetail(
          id: 't2',
          image: "assets/tea.png",
          title: 'Tea/Coffee',
          price: 10,
          detail: 'kesar milk ,black coffee'),
      Fooddetail(
          id: 't3',
          image: "assets/idli.png",
          title: 'Idli',
          price: 30,
          detail: 'with sambhar & chutney'),
      Fooddetail(
          id: 't4',
          image: "assets/dosa.png",
          title: 'Dosa',
          price: 40,
          detail: 'with sambhar & chutney'),
      Fooddetail(
          id: 't5',
          image: "assets/cholebhature.png",
          title: 'Chole Bhature',
          price: 60,
          detail: 'and chole'),
      Fooddetail(
          id: 't6',
          image: "assets/gobiparatha.png",
          title: 'Gobi Paratha',
          price: 40,
          detail: 'and aloo sabji'),
      Fooddetail(
          id: 't7',
          image: "assets/pavbhaji.png",
          title: 'Pav Bhaji',
          price: 90,
          detail: 'with green & red chutney'),
    ];

    return Scaffold(
      drawer: Drawer(
        elevation: 10,
        child: Container(
          child: Row(children: [
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Accountpage()),
                );
              },
            ),
          ]),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("AMC CANTEEN"),
        elevation: 20,
        actions: [
          Container(
            margin: EdgeInsets.all(12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search_sharp),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Accountpage()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.orange),
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cartpage()),
            );
          },
        ),
      ),
      body: ListView.separated(
        itemCount: fooddetail.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        fooddetail[index].image,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fooddetail[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fooddetail[index].detail,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Rs. " + fooddetail[index].price.toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
