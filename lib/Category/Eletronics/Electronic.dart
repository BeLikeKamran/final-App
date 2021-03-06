import 'package:flutter/material.dart';

class Electronic extends StatefulWidget {
  const Electronic({
    Key key,
  }) : super(key: key);

  @override
  State<Electronic> createState() => _ElectronicState();
}

class _ElectronicState extends State<Electronic> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    "https://adnjxlogdq.cloudimg.io/v7/https://www.ishopping.pk/media/catalog/product/cache/1/image/1200x/9df78eab33525d08d6e5fb8d27136e95/a/p/apollo_32_hd_smart_led_tv.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Apollo 32 HD Smart LED ",
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    4.5.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text('\$${70.8}',
                style: TextStyle(
                  fontSize: 32,
                )),
          ],
        ),
      ),
    );
  }
}
