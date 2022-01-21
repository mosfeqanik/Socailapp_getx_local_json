import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  _RecentContestState createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {
  List info = [];

  _readData() async {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List App',style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xFFc5e5f3),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () => Get.back()
        ),
      ),
      backgroundColor: Color(0xFFc5e5f3),
      body: Container(
        margin: EdgeInsets.only(top: 15,left: 10,bottom: 10),
        child:SingleChildScrollView(
          child: Column(
            children: [
              for(int i=0;i<info.length;i++)
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 200,
                  child: GestureDetector(
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 20,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                  ),
                ),

            ],
          ),
        )
      ),
    );
  }
}
