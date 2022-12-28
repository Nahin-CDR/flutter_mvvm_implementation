import 'package:clean_code/resources/color.dart';
import 'package:clean_code/view/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    splashService.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Center(
            child: Text("Splash Screen",
                style: TextStyle(
                    color:AppColors.primaryColor,
                    fontSize: 30
                )
            ),
          ),
          Container(
            margin:const EdgeInsets.only(top: 30),
            child:const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          )
        ],
      )
    );
  }
}
