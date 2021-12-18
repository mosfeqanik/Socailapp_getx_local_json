import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String username;
  final String imgurl;
   ProfileInfo({ this.username="James Smith",this.imgurl="img/background.jpg"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imgurl),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                        color: Color(0xFF3b3f42),
                        fontSize: 18,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Top Level",
                    style: TextStyle(
                        color: Color(0xFFfdebb2),
                        fontSize: 12,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFf3fafc)),
            child: const Center(
              child: Icon(
                Icons.notifications,
                color: Color(0xFF69c5df),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
