import 'package:flutter/material.dart';
import 'package:flutter_components/pages/alert_page.dart';
import 'package:flutter_components/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Mis package
void main()=>runApp(Myapp());
class Myapp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Componentes APP',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'), // English
            const Locale('es','ES'), // Español
          ],
          //home:new HomePage(),
          initialRoute: '/',
          routes: getAplicationRoutes(),
          onGenerateRoute:(RouteSettings settings){
            print('ruta llamada: $settings.name');
            return MaterialPageRoute(
              builder: (BuildContext context)=> AlertPage()
            );
          },
        );
      }
    }
