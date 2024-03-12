
import 'dart:math';

import 'package:expensetracker/data/data.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                        height:40,
                      width:40,
                    decoration:BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow[700]

                    )
                    ),
                    Icon(Icons.person,
                    color: Theme.of(context).colorScheme.outline,
                    ),
                  ],
                ),
                SizedBox(width:10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("welcome!",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.outline

                    ),
                    ),
                    Text("john Doe",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground

                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:160.0),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.settings)
                  ),
                )
              ],
            ),
            SizedBox(height:20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/2 ,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.tertiary,


                      ],
                      transform: const GradientRotation(pi / 4)
                  ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey.shade400,
                    offset: Offset(5,5)
                  )
                ]


              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Balance",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600

                  ),

                  ),
                  SizedBox(height: 12,),
                  Text("\$ 45000.00",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width:20,
                              height: 20,
                                decoration: BoxDecoration(
                                  color:Colors.white30,
                                  shape: BoxShape.circle,

                                ),
                              child: Center(child: Icon(Icons.arrow_downward,size: 12,)),
                            ),
                            SizedBox(width:10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("income",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400

                                  ),
                                ),
                                Text("\$ 2000.00",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600

                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width:20,
                              height: 20,
                              decoration: BoxDecoration(
                                color:Colors.white30,
                                shape: BoxShape.circle,

                              ),
                              child: Center(child: Icon(Icons.arrow_downward,size: 12,)),
                            ),
                            SizedBox(width:10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expanses",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400

                                  ),
                                ),
                                Text("\$ 800.00",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600

                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transactions",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold

                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Text("View All",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.w300

                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: Transactiondata.length,
                  itemBuilder: (context, int i){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width:50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color:Transactiondata[i]["color"],
                                      shape: BoxShape.circle,

                                    ),
                                  ),
                                  Transactiondata[i]["icon"]
                                ],
                              ),
                              SizedBox(width: 10,),
                              Text(Transactiondata[i]['name'],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.onBackground,
                                    fontWeight: FontWeight.w500

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:140.0),
                                child: Column(
                                  children: [
                                    Text(Transactiondata[i]["total amount"],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context).colorScheme.onBackground,
                                          fontWeight: FontWeight.w400

                                      ),
                                    ),
                                    Text(Transactiondata[i]["date"],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context).colorScheme.outline,
                                          fontWeight: FontWeight.w400

                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }

              ),
            )
          ],
        ),
      ),
    );
  }
}
