import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefix: const Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: "search Products...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffix: IconButton(
                          icon: const Icon(Icons.voice_chat),
                          onPressed: () {},
                        )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
