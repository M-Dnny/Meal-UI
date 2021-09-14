import 'package:burger/components/burger_list.dart';
import 'package:burger/components/categories.dart';
import 'package:burger/components/constant.dart';
import 'package:burger/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HumburgerTopBar extends StatefulWidget {
  @override
  _HumburgerTopBarState createState() => _HumburgerTopBarState();
}

class _HumburgerTopBarState extends State<HumburgerTopBar> {
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: light
          ? Color.fromRGBO(240, 240, 240, 1)
          : Color.fromRGBO(35, 35, 35, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            title: Text('Bloody Meal'),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_rounded,
                ),
              )
            ],
          ),
          Header(),
          Categories(),
          BloodList(row: 1),
          BloodList(row: 2),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(IconlyBold.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
        child: Container(
          color: headerColor1.withOpacity(0.3),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyBold.notification,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyBold.bookmark,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
