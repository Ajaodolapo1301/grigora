import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:grigora/provider/restaurantState.dart';
import 'package:grigora/screens/homePage.dart';
import 'package:provider/provider.dart';

import 'Utils/sizeConfig.dart';

void main() {
  runApp(  DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
          providers: [

            ChangeNotifierProvider(create: (_) => RestaurantState()),

          ],
          child: MyApp(

          ))));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.blue,
                // This makes the visual density adapt to the platform that you run
                // the app on. For desktop platforms, the controls will be smaller and
                // closer together (more dense) than on mobile platforms.
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(),
            );
          },
        );
      },
    );
  }
}


