import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/app.dart';
import 'package:nlw_payflow_flutter/modules/splash/splash_page.dart';
import 'package:nlw_payflow_flutter/modules/login/login_page.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({ Key? key }) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyBdGILQWUfe4IqsIlJULJA11C7wI2MyEhQ",
      appId: "1:296955853532:android:c7210dc8026207ddb29219",
      messagingSenderId: "XXX",
      projectId: "nlwpayflowflutter",
    ));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {

          if (snapshot.hasError) {

            print(snapshot.error);

            return const Material(
              child: Center(
                child: Text(
                  "Não foi possível inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );

          }
          
          else if (snapshot.connectionState == ConnectionState.done) {

            return const AppWidget();

          }
          
          else {

            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          }
          
        });
  }
}