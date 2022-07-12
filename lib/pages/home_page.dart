import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "codepur";
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummyList[index],);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
