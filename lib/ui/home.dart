import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onpecas_mobile/api/partsApi.dart';
import 'package:onpecas_mobile/constrants.dart';
import 'package:onpecas_mobile/model/parts/parts.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListHome(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("FECHOU :d");
  }
}

class ListHome extends StatelessWidget {
  final PartsApi partsApi = new PartsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Part>>(
      future: partsApi.fetchParts(BASE_URL),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? PartsList(
                part: snapshot.data,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class PartsList extends StatelessWidget {
  final List<Part> part;

  const PartsList({Key key, this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: part.length,
        itemBuilder: (context, index) {
          return Item(
            name: part[index].name.toString(),
            price: part[index].price.toStringAsFixed(2).toString(),
            brand: part[index].brand.toString(),
            model: part[index].model.toString(),
            url: part[index].url.toString(),
          );
        },
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String name;
  final String price;
  final String brand;
  final String model;
  final String url;

  const Item({Key key, this.name, this.price, this.brand, this.model, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            url,
            height: 200,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            //color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 17),
                        children: [
                      TextSpan(
                        text: name,
                      ),
                      TextSpan(
                          text: " " + model,
                          style: TextStyle(fontWeight: FontWeight.w400)),
                    ])),
                Text(
                  brand,
                  style: TextStyle(
                      color: blueOnpecas, fontWeight: FontWeight.bold),
                ),
                Text(
                  "R\$ " + price.replaceAll(".", ","),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ButtonBarTheme(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('DETAILS'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                IconButton(
                    splashColor: Colors.lightBlue[100],
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      Icons.add,
                      color: Colors.green[300],
                    ),
                    onPressed: () {}),
              ],
            ),
            data: ButtonBarThemeData(mainAxisSize: MainAxisSize.max),
          )
        ],
      ),
      color: Colors.white,
    );
  }
}
