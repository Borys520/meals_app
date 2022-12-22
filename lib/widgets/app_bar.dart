import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MealsAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  MealsAppBar(this.title) : preferredSize = const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset('assets/images/brand4.svg'),
      ),
      leadingWidth: 110,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_photo.png'),
          ),
        )
      ],
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
