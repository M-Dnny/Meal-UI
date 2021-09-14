import 'package:burger/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    int items = 10;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 100,
        child: ListView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                    height: 90,
                    width: 90,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSelectedItem = index;
                        });
                      },
                      child: Card(
                        color: index == currentSelectedItem
                            ? light
                                ? headerColor1
                                : headerColor1
                            : light
                                ? Colors.white
                                : Theme.of(context).cardColor,
                        child: Icon(
                          Icons.local_drink_rounded,
                          color: index == currentSelectedItem
                              ? Colors.white
                              : light
                                  ? Colors.black.withOpacity(0.7)
                                  : Colors.white,
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 90,
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                  child: Row(
                    children: [
                      Spacer(),
                      Text('Blood'),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
