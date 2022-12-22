import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/dishes.dart';

import '../widgets/app_bar.dart';
import '../widgets/hero_header.dart';
import '../widgets/categories.dart';

class HomePageView extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MealsAppBar('Home'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroHeader(),
            Dishes(
              title: 'Super Delicious',
              category: 'Miscellaneous',
            ),
            Categories(),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Color(0xFFFFD8CA),
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Deliciousness\nto your inbox',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Enjoy weekly hand picked recipes\nand recommendations',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: TextField(
                      controller: _textEditingController,
                      style: const TextStyle(fontSize: 14),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('JOIN'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF642F),
                      ),
                    ),
                  ),
                  const Text(
                    'By joining our newsletter you agree to our Terms and Conditions',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
