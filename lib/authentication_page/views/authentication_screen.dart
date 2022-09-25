import 'package:flutter/material.dart';
import 'package:project_shopcart/authentication_page/views/login_view.dart';
import 'package:project_shopcart/authentication_page/views/register_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              width: double.infinity,
              height: size.height * .25,
              image: const AssetImage('assets/10410228_17983.jpg'),
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 143, 142, 142),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
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
                      Expanded(
                        child: TabBarView(
                          children: [const LoginView(), RegisterView()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
