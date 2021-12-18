import 'dart:convert' show json;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/recent_contest_page.dart';

import 'components/heading_show_all.dart';
import 'components/profile_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((s) {
      setState(() {
        list = json.decode(s);
        print(list);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/detail.json")
        .then((s) {
      setState(() {
        info = json.decode(s);
        print(info);
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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: const Color(0xFFc5e5f3),
        child: Column(
          children: [
            //james smith
            Container(
              width: width,
              height: 90,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFebf8fd),
              ),
              child: ProfileInfo(),
            ),
            const SizedBox(
              height: 10,
            ),
            //popular contest
            HeadlineShowAll(headlineTitle: "Popular Contest",showAllFunction:(){ Get.to(()=>RecentContest());}),
            const SizedBox(
              height: 10,
            ),
            //list
            SizedBox(
              height: 170,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.88),
                  itemCount: info.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/detail/',
                          arguments: {
                            'title': info[i]['title'].toString(),
                            'name': info[i]['name'].toString(),
                            'text': info[i]['text'].toString(),
                            'img': info[i]['img'].toString(),
                            'time': info[i]['time'].toString(),
                            'prize': info[i]['prize'].toString(),
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        height: 170,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: i.isEven
                                ? const Color(0xFF69c5df)
                                : const Color(0xFF9294cc)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  info[i]["title"],
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Expanded(child: Container())
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: width,
                              child: AutoSizeText(
                                info[i]["text"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFb8eefc),
                                ),
                                maxLines: 3,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1.0,
                            ),
                            Row(children: [
                              for (int i = 0; i < 4; i++)
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(info[i]["img"]),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                            ]),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            //recent contests
            HeadlineShowAll(headlineTitle: "Recent Contests",showAllFunction:(){ Get.to(()=>RecentContest());}),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (_, i) {
                          return Container(
                            width: width,
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFebf8fd),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(list[i]['img']),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[i]['status'],
                                        style: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 10,
                                            decoration: TextDecoration.none),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: AutoSizeText(
                                          list[i]['text'],
                                          minFontSize: 15,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Color(0xFF3b3f42),
                                              fontSize: 18,
                                              decoration: TextDecoration.none),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Text(
                                      list[i]['time'],
                                      style: const TextStyle(
                                          fontSize: 10,
                                          decoration: TextDecoration.none,
                                          color: Color(0xFFb2b8bb)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}
