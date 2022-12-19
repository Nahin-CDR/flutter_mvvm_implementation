
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/view/home_view.dart';
import 'package:clean_code/view/login_view.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView( ));
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) =>const HomeView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No routes defined"),
            ),
          );
        }
      );
    }
  }
}