import 'package:america_precolombina/src/pages/cultura_maya_page.dart';
import 'package:america_precolombina/src/pages/estructura_maya_page.dart';
import 'package:america_precolombina/src/pages/home_page.dart';
import 'package:america_precolombina/src/pages/mitologia_maya_page.dart';
import 'package:america_precolombina/src/pages/rompecabezas_page.dart';
import 'package:america_precolombina/src/pages/ubicacion_maya_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) {
      return HomePage();
    },
    'cultura_maya': (BuildContext context) {
      return CulturaMayaPage();
    },
    'ubicacion_maya': (BuildContext context) {
      return UbicacionMayaPage();
    },
    'estructura_social_maya': (BuildContext context) {
      return EstructuraMayaPage();
    },
    'mitologia_maya': (BuildContext context) {
      return MitologiaMayaPage();
    },
    'reto_maya': (BuildContext context) {
      return RompecabezasPage();
    },
  };
}
