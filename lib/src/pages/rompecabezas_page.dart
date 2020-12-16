import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:america_precolombina/src/pages/pieza_rompecabezas.dart';

class RompecabezasPage extends StatefulWidget {
  @override
  RompecabezasPageState createState() => RompecabezasPageState();
}

class RompecabezasPageState extends State<RompecabezasPage> {
  // ignore: unused_field
  Image _image;
  Size imageSize;
  List<Widget> pieces = [];
  List<String> imagenes = [
    "templo_de_los_guerreros.jpg",
    "popol_vuh.jpg",
    "templo_de_las_inscripciones.jpg"
  ];
  int index = 0;
  final int rows = 3;
  final int cols = 3;
  double width;
  double height;

  // when the pan of a piece starts, we need to bring it to the front of the stack
  void bringToTop(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.add(widget);
    });
  }

// when a piece reaches its final position, it will be sent to the back of the stack to not get in the way of other, still movable, pieces
  void sendToBack(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.insert(0, widget);

      bool completado = false;
      this.pieces.forEach((element) {
        PiezaRompecabezas p = element;
        if (!p.isMovable) {
          completado = true;
        } else {
          completado = false;
        }
      });

      if (completado) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Felicitaciones!!'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Resolviste el rompezabezas exitosamente.'),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancelar')),
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Ok')),
                ],
              );
            });

        if (index == imagenes.length) {
          index = 0;
        }
        getImage();
      }
    });
  }

// we need to find out the image size, to be used in the PuzzlePiece widget
  Future<Size> getImageSize(Image image) async {
    final Completer<Size> completer = Completer<Size>();

    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener(
      (ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      },
    ));

    imageSize = await completer.future;

    return imageSize;
  }

// here we will split the image into small pieces using the rows and columns defined above;
  void splitImage(Image image) async {
    Size imageSize = await getImageSize(image);

    for (int x = 0; x < rows; x++) {
      for (int y = 0; y < cols; y++) {
        setState(() {
          pieces.add(PiezaRompecabezas(
            key: GlobalKey(),
            image: image,
            imageSize: imageSize,
            row: x,
            col: y,
            maxRow: rows,
            maxCol: cols,
            bringToTop: this.bringToTop,
            sendToBack: this.sendToBack,
            isMovable: true,
          ));
        });
      }
    }
    setState(() {
      width = imageSize.width.toDouble();
      height = imageSize.height.toDouble();
    });
  }

  Future getImage() async {
    var image = Image(image: AssetImage('assets/images/${imagenes[index]}'));
    index++;

    if (image != null) {
      setState(() {
        _image = image;
        pieces.clear();
      });

      splitImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reto Lúdico'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
              color: Colors.black,
              child: new Center(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(), color: Colors.grey[800]),
                      height: (imageSize == null)
                          ? 0
                          : (height * MediaQuery.of(context).size.height) /
                              width,
                      width: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: pieces,
                        overflow: Overflow.visible,
                      ))))),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          if (index == imagenes.length) {
            index = 0;
          }
          getImage();
        },
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }
}
