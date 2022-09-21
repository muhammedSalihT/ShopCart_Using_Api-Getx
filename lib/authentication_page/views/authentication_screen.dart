import 'package:flutter/material.dart';
import 'package:project_shopcart/authentication_page/views/login_view.dart';
import 'package:project_shopcart/authentication_page/views/register_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  width: double.infinity,
                  height: size.height * .25,
                  image: const AssetImage('assets/10410228_17983.jpg'),
                  fit: BoxFit.fill,
                )
              ],
            ),
            Positioned(
              top: size.height * .23,
              left: 10,
              right: 10,
              child: Container(
                height: size.height * .73,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 223, 220, 220),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0x552B2B2B),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.white,
                          tabs: const [
                            Tab(
                              text: "Exisiting",
                            ),
                            Tab(
                              text: "New",
                            )
                          ],
                        ),
                      ),
                    const  Expanded(
                        child: TabBarView(
                          physics:  BouncingScrollPhysics(),
                          children: [
                            LoginView(),
                            RegisterView()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





