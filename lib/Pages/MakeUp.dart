import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kamran/API_Services/ProductTile.dart';
import 'package:kamran/API_Services/ProductsController.dart';
import 'package:kamran/MainScreens/Drwer.dart';

import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class MakeUP extends StatefulWidget {
  const MakeUP({Key key}) : super(key: key);

  @override
  _MakeUPState createState() => _MakeUPState();
}

class _MakeUPState extends State<MakeUP> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Khareedo Online',
          style: TextStyle(
              fontSize: 20, fontFamily: "Alice", fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 35,
        centerTitle: true,
      ),
      drawer: Drwer(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productlist.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productlist[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
