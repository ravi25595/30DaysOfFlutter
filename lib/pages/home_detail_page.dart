import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ),
            ).p16(),
            Expanded(
                child: VxArc(
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              height: 30,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections."
                        .text
                        .xl
                        .textStyle(context.captionStyle)
                        .make()
                        .p16(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.red800.xl4.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(const StadiumBorder()),
              ),
              child: "Add to Cart".text.xl.make(),
            ).h(50)
          ],
        ).p16(),
      ),
    );
  }
}
