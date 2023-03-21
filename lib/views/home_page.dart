import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:emergency_service_app/Widgets/geolocatar.dart';

import 'package:emergency_service_app/constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/splash_screen_image.jpg',
                    height: 300,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 450,
                    decoration: BoxDecoration(
                        color: colrs.main,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 280,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              final location =
                                  await Geolocator.getCurrentPosition();
                              await Map.openMap(
                                  location.latitude, location.longitude);
                            },
                            child: Text(
                              'Fire Brigade Service',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: colrs.main),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 280,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              final location =
                                  await Geolocator.getCurrentPosition();
                              await Map.openMap2(
                                  location.latitude, location.longitude);
                            },
                            child: Text(
                              'Ambulance Service',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: colrs.main),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 280,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              final location =
                                  await Geolocator.getCurrentPosition();
                              await Map.openMap3(
                                  location.latitude, location.longitude);
                            },
                            child: Text(
                              'Police Station',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: colrs.main),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
