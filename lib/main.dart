import 'package:emapach/src/bloc/provider.dart';
import 'package:emapach/src/pages/home.dart';
import 'package:emapach/src/utils/preferencias_usuario.dart';
import 'package:flutter/material.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new Preferences();

  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Emapach',
        initialRoute: '/',
        theme: ThemeData(
       
       
          primarySwatch: Colors.blue,
          
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        routes: {
           '/': (BuildContext context) => HomePage(),
        },
        
      ),
    );
  }
}

