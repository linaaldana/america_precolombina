import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/menu_provider.dart';

class CulturaMayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: nested());
  }
}

Widget _lista() {
  return FutureBuilder(
    future: menuProvider.cargarData(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      return _listaItems(snapshot.data, context);
    },
  );
}

ListView _listaItems(List<dynamic> data, BuildContext context) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) => Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, data[index]['ruta']),
          child: Card(
            elevation: 5.0,
            shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 70.0,
                        height: 70.0,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/${data[index]['icon']}.png'),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['texto'],
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          Container(
                              child: Text(
                            data[index]['subtitulo'],
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            textScaleFactor: 0.81,
                          )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    ),
  );
}

nested() {
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          expandedHeight: 300.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text(
              "Cultura Maya",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            background: Image.asset(
              "assets/images/maya.png",
              fit: BoxFit.cover,
            ),
          ),
        )
      ];
    },
    body: _lista(),
  );
}
