import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/detail_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  List imgList = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/img.json")
        .then((s) {
      setState(() {
        imgList = json.decode(s);
        print(imgList);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    final DetailsController Fav = Get.put(DetailsController());
    return Scaffold(
      body: Container(
        color: const Color(0xFFc5e5f3),
        child: Stack(
          children: [
            Positioned(
                top: 50,
                left: 10,
                child: IconButton(
                  onPressed: () => Get.toNamed('/'),
                  color: Colors.black ,
                  icon: Icon(Icons.home_outlined,size: 30,color: Colors.white,),
                )),
            Positioned(
              top: 100,
              left: 0,
              height: 90,
              width: width,
              child: Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                       CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(Get.arguments['img']),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['name'],
                            style: const TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Top Level",
                            style: TextStyle(
                                color: Color(0xFFfdebb2),
                                fontSize: 12,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 70,
                        height: 120,
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
                ),
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: const Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: 220,
              left: 0,
              width: width,
              height: 200,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFfcfffe),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 1,
                          offset: const Offset(0, 10),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Column(
                    children: [
                      Container(
                          child: Row(
                        children: [
                           Text(
                            Get.arguments['title'],
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container())
                        ],
                      )),
                      SizedBox(height: 15),
                      Container(
                        width: width,
                        child:  AutoSizeText(
                          Get.arguments['text'],
                          maxFontSize: 15,
                          maxLines: 3,
                          style:
                              TextStyle(color: Color(0xFFb8b8b8)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.watch_later,
                                  color: Color(0xFF69c5df)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    Get.arguments['name'] ,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  AutoSizeText(
                                    Get.arguments['time'],
                                    style: const TextStyle(
                                        fontSize: 15, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.monetization_on,
                                  color: Color(0xFFfb8483)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    Get.arguments['prize'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Prize",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.star, color: Color(0xFFfbc33e)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  AutoSizeText(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  AutoSizeText(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 440,
              left: 25,
              height: 50,
              child: Container(
                child: RichText(
                    text: const TextSpan(
                        text: "Total Participants ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                        children: [
                      TextSpan(
                          text: "(11)",
                          style: TextStyle(color: Color(0xFFfbc33e)))
                    ])),
              ),
            ),
            //images
            Stack(children: [
              for (int i = 0; i < imgList.length; i++)
                Positioned(
                  top: 480,
                  left: (20 + i * 35).toDouble(),
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image:  DecorationImage(
                            image: AssetImage(imgList[i]['img']),
                            fit: BoxFit.cover)),
                  ),
                )
            ]),
            //favourite
            Positioned(
                top: 600,
                left: 25,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:()=> Fav.favCounter(),
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFfbc33e)),
                          child: const Icon(Icons.favorite_border,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Add to favorite",
                      style: TextStyle(color: Color(0xFFfbc33e), fontSize: 18),
                    )
                  ],
                ))
            //))
          ],
        ),
      ),
    );
  }
}
