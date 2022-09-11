import 'package:flutter/material.dart';
import 'package:summer_calendar/firestore_config.dart';
import 'package:summer_calendar/style_manager.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputScreen> {
  @override
  Widget build(BuildContext context) {
    void onTapEventAdd() async{
      final ddd = await FirestoreConfig();

      await ddd.setData(collection: CollectionName.Event, payload: {"test":"test1"});

      //await FirestoreConfig().setData(collection: CollectionName.Event, payload: {"test":"test1"});
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("カレンダー"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.orange, width: 3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "予定を追加"),
                  onChanged: (value) => print(value),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("A");
                  onTapEventAdd();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: Text(
                    "追加",
                    style: TextStyleManager.s24blackTextStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
