import 'package:flutter/material.dart';
import 'package:orange_project/view/bill_view.dart';

import '../constant/constant.dart';
import 'home_view.dart';
class LayoutView extends StatefulWidget {
  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
   int index=0;

List<Widget>screens=[
  HomeScreen(),
  BillView(title: 'bill'),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:screens[index],
      bottomNavigationBar:BottomNavigationBar(
        onTap: (value){

          setState(() {
            index=value;
          });
        },
        currentIndex: index,
        backgroundColor: thirdColor,
        unselectedItemColor: hintFormColor,
        selectedItemColor: secondColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home_filled),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.credit_card),
              label: 'card'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.history_outlined),
              label: 'History'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person),
              label: 'profile'
          ),
        ],
      ) ,
    );
  }
}
