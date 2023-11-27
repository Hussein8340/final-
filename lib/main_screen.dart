//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:police/Model/item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Item> itemList = [
    Item(
        name: "DOG",
        price: 5.7,
        image:
            "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvaXMxNzk0My1pbWFnZS1qb2I2MjFfMS5wbmc.pn"),
    Item(
        name: "Orange",
        price: 1.2,
        image:
            "https://w7.pngwing.com/pngs/187/615/png-transparent-orange-fruit-orange-tangerine-orange-natural-foods-food-citrus-thumbnail.png"),
    Item(
        name: "Apple",
        price: 0.35,
        image:
            "https://w7.pngwing.com/pngs/973/255/png-transparent-red-apple-apple-fruit-apple-natural-foods-food-grocery-store-thumbnail.png"),
    Item(
        name: "Strawberry",
        price: 2.0,
        image:
            "https://w7.pngwing.com/pngs/102/28/png-transparent-strawberry-juice-fruit-smoothie-strawberry-fruit-natural-foods-frutti-di-bosco-food-thumbnail.png"),
    Item(
        name: "Pineapple",
        price: 3.1,
        image:
            "https://w7.pngwing.com/pngs/9/79/png-transparent-juice-smoothie-pineapple-fruit-canning-pineapple-fruit-pineapple-orange-pineapple-fruit-natural-foods-food-orange-thumbnail.png"),
    Item(
        name: "watermelon",
        price: 6.0,
        image:
            "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("shopping App"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return title(
                      context: context,
                      item: itemList[index],
                    );
                  }),
            ),
            Container(
              height: 100,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  children: [
                    footer(title: "# Of Item in Cart", value: "0"),
                    Expanded(child: Container()),
                    footer(title: "total Price", value: "0"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget footer({required String title, required String value}) {
    return Column(
      children: [
        Text(title),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Widget title({required BuildContext context, required Item item}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 66,
        color: Colors.grey[200],
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(item.image, width: 50, height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Column(
                      children: [
                        Text(item.name),
                        Text("${item.price} JD"),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () {
                        if (item.qty == 0) {
                          return;
                        }
                        item.qty = item.qty - 1;
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove)),
                  Text(item.qty.toString()),
                  IconButton(
                      onPressed: () {
                        item.qty = item.qty + 1;
                        setState(() {});
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
