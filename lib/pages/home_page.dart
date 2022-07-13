import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: (CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  itemCount: CatalogModel.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    Item item = CatalogModel.items[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GridTile(
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                          ),
                          child: Image.network(item.image),
                          footer: Container(
                            child: Text(
                              "\$" + item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ));
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: const MyDrawer(),
    );
  }
}
