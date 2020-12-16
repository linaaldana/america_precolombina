import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/info_provider.dart';

class EstructuraMayaPage extends StatefulWidget {
  @override
  _EstructuraMayaPageState createState() => _EstructuraMayaPageState();
}

class _EstructuraMayaPageState extends State<EstructuraMayaPage> {
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
                      image: AssetImage("assets/images/fondo_maya_4.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data[4]['estructura_social'][0]['imagen']}.png')),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['descripcion'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
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
                      image: AssetImage("assets/images/fondo_maya_4.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][0]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data[4]['estructura_social'][0]['grupos_sociales'][0]['imagen']}.jpg')),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][0]['descripcion'],
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
                      image: AssetImage("assets/images/fondo_maya_4.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][1]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data[4]['estructura_social'][0]['grupos_sociales'][1]['imagen']}.jpg')),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][1]['descripcion'],
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
                      image: AssetImage("assets/images/fondo_maya_4.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][2]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data[4]['estructura_social'][0]['grupos_sociales'][2]['imagen']}.jpg')),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][2]['descripcion'],
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
                      image: AssetImage("assets/images/fondo_maya_4.png"),
                      fit: BoxFit.cover,
                    )),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][3]['nombre'],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data[4]['estructura_social'][0]['grupos_sociales'][3]['imagen']}.jpg')),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          snapshot.data[4]['estructura_social'][0]
                              ['grupos_sociales'][3]['descripcion'],
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
                ],
              );
            }));
  }
}
