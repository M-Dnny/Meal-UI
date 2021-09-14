import 'package:burger/components/blood_mini_list.dart';
import 'package:burger/components/constant.dart';
import 'package:flutter/material.dart';

class BloodPage extends StatefulWidget {
  static const tag = 'blood_page';
  @override
  _BloodPageState createState() => _BloodPageState();
}

class _BloodPageState extends State<BloodPage> {
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
  Widget amt = Text(
    "\$ 50",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget amt1 = Text(
    "\$ 100",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );

  int number = 0;
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    Text nameArguments = ModalRoute.of(context)!.settings.arguments as Text;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 15,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 13,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameArguments,
                Text(
                  'When hunger craves this is the best thing',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    nameArguments == blood_bag ? bloodImage : drinkImage,
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: amt,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star_rate_rounded, color: Colors.white),
                            Icon(Icons.star_rate_rounded, color: Colors.white),
                            Icon(Icons.star_rate_rounded, color: Colors.white),
                            Icon(Icons.star_rate_rounded, color: Colors.white),
                            Icon(Icons.star_rate_rounded, color: Colors.white),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: headerColor1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        )),
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
            child: Container(
              width: size.width,
              color: light
                  ? Color.fromRGBO(240, 240, 240, 1)
                  : Color.fromRGBO(20, 20, 20, 1),
              height: size.height / 1.6,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      top: 30,
                      right: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  BloodMiniList(),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    number = number - 1;
                                  });
                                },
                              ),
                              Text(number.toString()),
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    number = number + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
