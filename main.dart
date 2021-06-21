import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/home.dart';
import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  FirebaseAnalytics analytics = FirebaseAnalytics();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    initializeFireStore() ;
    return MaterialApp(
      title: 'SGSNAU App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SGSNAU'),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }

  void initializeFireStore() async {

    try {
      firestore
          .collection('setup').doc('s8gPp5WXBiBQTvBVVgUs').get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          Map<String, dynamic> map = documentSnapshot.data() ;
          map.forEach((key, value) {
            switch(key){
              case 'baseUrl':
                baseUrl = value.toString();
                break ;
              case 'android':
                androidVersions = value.toString().split(',') ;
                break ;
              case 'ios':
                iosVersions = value.toString().split(',') ;
                break ;
            }
          });
          debugPrint(baseUrl);
        } else {
          debugPrint('Document does not exist on the database');
        }
      });

    }catch(e){
      debugPrint(e.toString());
    }
  }
}

