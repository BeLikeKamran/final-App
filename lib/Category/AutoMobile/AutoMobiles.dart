import 'package:flutter/material.dart';

class AutoMobiles extends StatefulWidget {
  const AutoMobiles({
    Key key,
  }) : super(key: key);

  @override
  State<AutoMobiles> createState() => _AutoMobilesState();
}

class _AutoMobilesState extends State<AutoMobiles> {
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
                    "https://cache4.pakwheels.com/ad_pictures/5834/Slide_toyota-corolla-gli-vvti-2017-58346943.jpg",
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
              "Slide_toyota-corolla",
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
