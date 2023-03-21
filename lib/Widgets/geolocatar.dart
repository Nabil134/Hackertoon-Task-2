import 'package:url_launcher/url_launcher.dart';

class Map {
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/firebrigade nearby';
    // ignore: deprecated_member_use
    if (await canLaunch(googleUrl)) {
      // ignore: deprecated_member_use
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openMap2(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/ambulance nearby';
    // ignore: deprecated_member_use
    if (await canLaunch(googleUrl)) {
      // ignore: deprecated_member_use
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openMap3(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/police nearby';
    // ignore: deprecated_member_use
    if (await canLaunch(googleUrl)) {
      // ignore: deprecated_member_use
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
