import 'package:flutter/material.dart';

class BloodMiniList extends StatefulWidget {
  @override
  _BloodMiniListState createState() => _BloodMiniListState();
}

class _BloodMiniListState extends State<BloodMiniList> {
  Widget bloodImage = Container(
    height: 100,
    child: Image.asset(
      'assets/images/blood_bag.png',
    ),
  );
  Widget drinkImage = Container(
    height: 100,
    child: Image.asset('assets/images/bourbon.png'),
  );
  int items = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: items,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool reverse = index.isEven;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(
                        left: 20, right: index == items ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      reverse ? 'Blood Bag' : 'Bourbon',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: reverse ? 10 : 10,
                left: reverse ? 45 : 40,
                child: GestureDetector(
                  onTap: () {},
                  child: reverse ? bloodImage : drinkImage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
