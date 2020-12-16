import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:america_precolombina/src/providers/info_provider.dart';

class UbicacionMayaPage extends StatefulWidget {
  @override
  _UbicacionMayaPageState createState() => _UbicacionMayaPageState();
}

class _UbicacionMayaPageState extends State<UbicacionMayaPage> {
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
              backgroundColor: Colors.amber,
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
              backgroundColor: Colors.amber,
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
                      image: AssetImage("assets/images/fondo_maya.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          snapshot.data[0]['ubicacion'][0]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data[0]['ubicacion'][0]['imagen']}.png')),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[0]['ubicacion'][0]['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/fondo_maya_2.png"),
                        fit: BoxFit.cover,
                      )),
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 35.0,
                          ),
                          Text(
                            snapshot.data[1]['organizacion'][0]['nombre'],
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            snapshot.data[1]['organizacion'][0]['descripcion'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ],
                      )),
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/fondo_maya_3.png"),
                        fit: BoxFit.cover,
                      )),
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            snapshot.data[2]['gobernante_destacado'][0]
                                ['nombre'],
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          Text(
                            snapshot.data[2]['gobernante_destacado'][0]
                                ['descripcion'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ],
                      )),
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/fondo_maya.png"),
                        fit: BoxFit.cover,
                      )),
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            'Construcciones Destacadas',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 550.0,
                            ),
                            items: snapshot.data[3]['construcciones_destacadas']
                                .map<Widget>((dynamic d) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Card(
                                      elevation: 5,
                                      shape: (RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0))),
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Center(
                                              child: Column(children: <Widget>[
                                            Text(
                                              d['nombre'],
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/images/${d['imagen']}.jpg')),
                                            SizedBox(
                                              height: 30.0,
                                            ),
                                            Text(
                                              d['descripcion'],
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(fontSize: 14.0),
                                            )
                                          ]))));
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ))
                ],
              );
            }));
  }
}
