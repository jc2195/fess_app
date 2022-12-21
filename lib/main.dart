import 'package:fess/models/global_model.dart';
import 'package:fess/services/initialise.dart';
import 'package:fess/views/screens/institution_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'views/screens/background_screen.dart';
import 'views/screens/down_screen.dart';
import 'views/screens/loading_screen.dart';
import 'package:fess/views/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Phoenix(
      child: StateBuffer(),
    ),
  );
}

class StateBuffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget{
  final Future _initialisation = Initialise().startup();

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalModel(),
      child: FutureBuilder(
        future: _initialisation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              home: DownScreen(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data['autoLogin']) {
              return ChangeNotifierProvider(
                  create: (context) => GlobalModel(
                      university: snapshot.data['userData']['university'],
                      college: snapshot.data['userData']['college'],
                  ),
                  child:  MaterialApp(
                    home: HomeScreen(),
                  ),
              );
            } else {
              return MaterialApp(
                home: BackgroundScreen(),
              );
            }
          }

          return MaterialApp(
            home: LoadingScreen(),
          );
        },
      ),
    );
  }
}