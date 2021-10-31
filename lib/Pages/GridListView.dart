import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:kamran/Category/AutoMobile/AutoMobiles.dart';
import 'package:kamran/Category/Clothes/Clothes.dart';
import 'package:kamran/Category/Eletronics/Electronic.dart';
import 'package:kamran/Category/Groceries/GroceriesModel.dart';
import 'package:kamran/Category/MakeUP/MakeUp.dart';
import 'package:kamran/Category/Mobile/MobileModel.dart';

class GridListView extends StatefulWidget {
  const GridListView({
    Key key,
  }) : super(key: key);

  @override
  _GridListViewState createState() => _GridListViewState();
}

class _GridListViewState extends State<GridListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                  animationDuration: Duration(seconds: 5),
                  dotSize: 5,
                  dotSpacing: 10,
                  dotBgColor: Colors.transparent,
                  autoplayDuration: Duration(seconds: 10),
                  images: [
                    NetworkImage(
                        'https://dailytimes.com.pk/assets/uploads/2019/11/Picture-Release-3-copy-e1573594921489-1280x720.jpg'),
                    NetworkImage(
                        'https://blog.daraz.pk/wp-content/uploads/2019/06/daraz-mobile-week.png'),
                    NetworkImage(
                        "https://www.mobilesjin.com/wp-content/uploads/2021/06/oppo-mega-deals.jpg"),
                    NetworkImage(
                        "https://i.ytimg.com/vi/qtrhZWuvtjw/maxresdefault.jpg")
                  ]),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                "https://www.desicomments.com/wp-content/uploads/Welcome-Picture.-P8817dc04.jpg",
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text("Categories"),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => Electronic()));
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: CircleAvatar(
                            radius: 27, child: Icon(Icons.devices_other)),
                      ),
                      Text("Electronic")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => AutoMobiles()));
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: CircleAvatar(
                          radius: 27,
                          child: Icon(Icons.directions_car),
                        ),
                      ),
                      Text("AutoMobile")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => Mobiles()));
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: CircleAvatar(
                              radius: 27, child: Icon(Icons.smartphone))),
                      Text("Mobile")
                    ],
                  ),
                ]),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => Groceries()));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: CircleAvatar(
                        radius: 27,
                        child: Icon(Icons.shop),
                      ),
                    ),
                    Text("Groceries")
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (builder) => MakeUP()));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: CircleAvatar(
                        radius: 27,
                        child: Icon(Icons.face),
                      ),
                    ),
                    Text("Makeup")
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (builder) => Clothes()));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: CircleAvatar(
                        radius: 27,
                        child: Icon(Icons.checkroom),
                      ),
                    ),
                    Text("Clothes")
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
