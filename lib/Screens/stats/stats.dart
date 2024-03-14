
import 'package:expensetracker/Screens/stats/Chart.dart';

import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Transaction",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height:20),
            Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)

              ),
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child:Padding(
                padding: const EdgeInsets.fromLTRB(12,20,12,12),
                child: MyChart(),
              )

            )

          ],
        ),
      ),
    );
  }
}
