import 'package:america_precolombina/src/pages/home_page.dart';
import 'package:america_precolombina/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'America Precolombina',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        });
      },
      theme: ThemeData(
        // Define el Brightness y Colores por defecto
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        accentColor: Colors.amber[800],
        fontFamily: 'Montserrat',
      ),
    );
  }
}
