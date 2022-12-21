import 'package:clean_code/resources/color.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;


  const RoundButton({
    Key? key,
    required this.loading,
    required this.title,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin:const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height:40,
        width: 200,
        child: Center(
          child: loading == true?const CircularProgressIndicator(
            color: Colors.white,
            backgroundColor: Colors.white,
            strokeWidth: 2,
          )
              :Text(
            title,
            style:const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
