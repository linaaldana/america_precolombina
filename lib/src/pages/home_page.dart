import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _estiloTextoTitulo = new TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]);
  final _estiloTexto = new TextStyle(fontSize: 18, color: Colors.grey[700]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Bienvenido a América Precolombina!',
              style: _estiloTextoTitulo,
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 50.0,
            ),
            Text(
              'Diviértete aprendiendo sobre las culturas que existian antes de la llegada de Cristóbal Colón a América',
              style: _estiloTexto,
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text(
              'Escoge la cultura sobre la cual deseas aprender:',
              style: _estiloTexto,
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'cultura_maya'),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 8.0,
                  child: Image(
                      image: AssetImage('assets/images/bannerCulturaMaya.png')),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            Divider(),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 8.0,
              child: Image(
                  image: AssetImage('assets/images/bannerCulturaInca.png')),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Divider(),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 8.0,
              child: Image(
                  image: AssetImage('assets/images/bannerCulturaAzteca.png')),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
