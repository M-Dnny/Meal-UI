import 'package:burger/components/constant.dart';
import 'package:burger/pages/blood_page.dart';
import 'package:flutter/material.dart';

class BloodList extends StatefulWidget {
  final int row;
  BloodList({required this.row});
  @override
  _BloodListState createState() => _BloodListState();
}

class _BloodListState extends State<BloodList> {
  Widget amt = Text(
    "\$ 50",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget amt1 = Text(
    "\$ 100",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget bloodImage = Container(
    height: 160,
    child: Image.asset(
      'assets/images/blood_bag.png',
    ),
  );
  Widget drinkImage = Container(
    height: 160,
    child: Image.asset('assets/images/bourbon.png'),
  );
  @override
  Widget build(BuildContext context) {
    int items = 10;

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 350 : 250,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: items,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 20, right: index == 0 ? 10 : 10),
                    height: 250,
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator
                        Navigator.of(context).pushNamed(
                          BloodPage.tag,
                          arguments: reverse ? blood_bag : bour_bon,
                        );
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              reverse ? blood_bag : bour_bon,
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  reverse ? amt : amt1,
                                  Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          topLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(10),
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: reverse ? 50 : 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          BloodPage.tag,
                          arguments: reverse ? blood_bag : bour_bon,
                        );
                      },
                      child: reverse ? bloodImage : drinkImage,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
