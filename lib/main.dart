import 'package:clean_code/model/album_model.dart';
import 'package:clean_code/utils/routes/routes.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/view_model/album_view_model.dart';
import 'package:clean_code/view_model/auth_view_model.dart';
import 'package:clean_code/view_model/comment_view_model.dart';
import 'package:clean_code/view_model/photo_view_model.dart';
import 'package:clean_code/view_model/user_view_model.dart';
import 'package:clean_code/view_model/userlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> AuthViewModel()),
          ChangeNotifierProvider(create: (_)=> UserViewModel()),
          ChangeNotifierProvider(create: (_)=>UserListViewModel()),
          ChangeNotifierProvider(create: (_)=>AlbumViewViewModel()),
          ChangeNotifierProvider(create: (_)=>CommentViewViewModel()),
          ChangeNotifierProvider(create: (_) => PhotoViewViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter clean Coding',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.home,
          onGenerateRoute: Routes.generateRoute,
        ),
    );
  }
}
