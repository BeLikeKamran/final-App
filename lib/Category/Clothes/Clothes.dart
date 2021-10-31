import 'package:flutter/material.dart';

class Clothes extends StatefulWidget {
  const Clothes({
    Key key,
  }) : super(key: key);

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
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
                    "https://static-01.daraz.pk/p/09d8a47b2f1f52ceb7689f65af7a1d37.jpg",
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
              "Baby Boy clothes",
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
