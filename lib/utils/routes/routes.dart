
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/view/album_view.dart';
import 'package:clean_code/view/comments_view.dart';
import 'package:clean_code/view/home_view.dart';
import 'package:clean_code/view/login_view.dart';
import 'package:clean_code/view/photo_view.dart';
import 'package:clean_code/view/product_details_view.dart';
import 'package:clean_code/view/product_view.dart';
import 'package:clean_code/view/signup_view.dart';
import 'package:clean_code/view/splash_view.dart';
import 'package:clean_code/view/todos_view.dart';
import 'package:clean_code/view/userlist_view.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splash:
      return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=>const SignUpView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) =>const HomeView());
      case RoutesName.userList:
        return MaterialPageRoute(builder: (BuildContext context) => const UsersView());
      case RoutesName.album:
        return MaterialPageRoute(builder: (BuildContext context)=> const AlbumView());
      case RoutesName.comments:
        return MaterialPageRoute(builder: (BuildContext context)=>const CommentView());
      case RoutesName.photos:
        return MaterialPageRoute(builder: (BuildContext context) => const PhotoView());
      case RoutesName.todos:
        return MaterialPageRoute(builder: (BuildContext context)=> const TodosView());
      case RoutesName.products:
        return MaterialPageRoute(builder: (BuildContext context)=> const ProductView());
      case RoutesName.productDetails:
        final arguments = settings.arguments as ProductArguments;
        return MaterialPageRoute(builder: (BuildContext context){
          return ProductDetails(
              id: arguments.id,
              title: arguments.title,
              price: arguments.price,
              description: arguments.description,
              category: arguments.category,
              image: arguments.image,
              rating: arguments.rating
          );
        });
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