import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_calendar/style_manager.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カレンダー"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
          child: Column(
            children: [
              Container(
                child: TextField(),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.orange, width: 3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
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
