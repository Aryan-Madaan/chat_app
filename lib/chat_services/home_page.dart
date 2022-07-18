import 'dart:math';

import 'package:chat_app/Constants/constant.dart';
import 'package:chat_app/chat_services/read_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  final DataObject object = DataObject();
  ValueKey<int> changeKey = const ValueKey(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: MyAppBar().appBar1,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    key: changeKey,
                    future: object.readData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Iterable<String> dataIterable = snapshot.data!.keys;
                        List dataList = dataIterable.toList();
                        dataList.sort((b, a) => a.compareTo(b));
                        Map<String, dynamic> dataMap = snapshot.data!;
                        return ListView.builder(
                            reverse: true,
                            itemCount: dataList.length,
                            itemExtent: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 50.0, top: 10, bottom: 10),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Container(
                                    color: Colors.blue,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                dataMap[dataList[index]]
                                                    ["user"],
                                              ),
                                              Text(
                                                dataList[index],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            dataMap[dataList[index]]["text"],
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.image),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.45,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.white70,
                                hintText: "Type Your Message Here"),
                            autocorrect: true,
                            textCapitalization: TextCapitalization.sentences,
                            enableSuggestions: true,
                            controller: _controller,
                            minLines: 1,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    highlightColor: Colors.black,
                    color: Colors.green,
                    onPressed: () async {
                      if (_controller.text.trim() != "") {
                        Map<String, dynamic> myjson = {
                          dateFormat.format(DateTime.now()): {
                            "user": "me",
                            "text": _controller.text.trim(),
                          },
                        };
                        await object.writeData(myjson);
                      }
                      setState(() {
                        if (_controller.text.trim() != "") {
                          _controller.clear();
                          changeKey = ValueKey(Random().nextInt(100));
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                    ),
                    iconSize: 30,
                  )
                ],
              )
            ]),
          )),
    );
  }
}
