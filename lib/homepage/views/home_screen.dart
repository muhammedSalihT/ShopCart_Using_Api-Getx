import 'package:flutter/material.dart';
import 'package:project_shopcart/homepage/controllers/main_category_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 12, 21, 25),
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          title: const Text("ShopCart"),
          actions: [
            IconButton(
              icon: const Icon(Icons.record_voice_over_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: DefaultTabController(
          length:context.read<MainCategoryProvider>(),
          child: Column(
            children: [
              LimitedBox(
                maxHeight: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          color: Colors.orange,
                          height: 50,
                          width: 80,
                          child: const Text(
                            "Men",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
