import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/info_provider.dart';

class MitologiaMayaPage extends StatefulWidget {
  @override
  _MitologiaMayaPageState createState() => _MitologiaMayaPageState();
}

class _MitologiaMayaPageState extends State<MitologiaMayaPage> {
  PageController pageController = PageController(initialPage: 0);
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                pageController.animateToPage(--_current,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutCirc);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                pageController.animateToPage(++_current,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn);
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: FutureBuilder(
            future: infoProvider.cargarData('cultura_maya'),
            initialData: [],
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              return PageView(
                controller: pageController,
                onPageChanged: (index) {
                  _current = index;
                },
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_6.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['dioses'][0]['imagen']}.png')),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][0]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['dioses'][0]['dioses'][0]['imagen']}.jpg')),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][0]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][1]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['dioses'][0]['dioses'][1]['imagen']}.png')),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][1]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][2]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['dioses'][0]['dioses'][2]['imagen']}.jpg')),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][2]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][3]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['dioses'][0]['dioses'][3]['imagen']}.png')),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][3]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][4]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['dioses'][0]['dioses'][4]['imagen']}.jpg')),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['dioses'][0]
                              ['dioses'][4]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['mito'][0]['nombre'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          height: 150.0,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data[5]['mitologia'][0]['mito'][0]['imagen']}.jpg')),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['mito'][0]
                              ['descripcion_1'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/fondo_maya_5.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          snapshot.data[5]['mitologia'][0]['mito'][0]
                              ['descripcion_2'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
