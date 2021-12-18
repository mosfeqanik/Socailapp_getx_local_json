import 'package:flutter/material.dart';

class HeadlineShowAll extends StatelessWidget {
  final String headlineTitle;
  final Function showAllFunction;
  HeadlineShowAll({required this.headlineTitle,required this.showAllFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        children: [
           Text(
            headlineTitle,
            style: const TextStyle(
                color: Color(0xFF1f2326),
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
          Expanded(child: Container()),
          const Text(
            "Show all",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: ()=>showAllFunction,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange,
              ),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
