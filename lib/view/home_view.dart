import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () {
          userPreference.remove().then((value) => 
          Navigator.pushNamed(context, RoutesName.login));
        },
        child:const Text("logout", style: TextStyle(color: Colors.red,fontSize: 30)),
      ),
    ));
  }
}

