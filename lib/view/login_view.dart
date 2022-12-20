import 'package:clean_code/resources/color.dart';
import 'package:clean_code/resources/components/round_button.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:clean_code/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    /// after working done it will be erased and release ram
    /// its a good practice
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height *1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const[
             Text("Login Screen",style: TextStyle(color:AppColors.primaryColor),)
          ],
        ),
      ),
      body: SafeArea(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("eve.holt@reqres.in\npassword: cityslicka",style: TextStyle(color: Colors.grey),),
            TextFormField(
              focusNode: emailFocusNode,
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode,passwordFocusNode);
              },
              controller: _emailController,
              decoration:const InputDecoration(
                hintText: "type mail",
                labelText: "email",
                prefixIcon: Icon(Icons.alternate_email),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder:(context,value,child){
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "type password",
                      labelText: "password",
                      suffixIcon: InkWell(
                        onTap: (){
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value?Icons.visibility_off:Icons.visibility),
                      ),
                      prefixIcon:const Icon(Icons.lock),
                    ),
                  );
                }
            ),
            SizedBox(
              height: height*.085,
              child: RoundButton(
                  title: "Login",
                  onPress:(){
                    if(_emailController.text.isEmpty){
                      Utils.flushBarErrorMessage("please enter email", context);
                    }else if(_passwordController.text.isEmpty){
                      Utils.flushBarErrorMessage("please enter password", context);
                    }else if(_passwordController.text.length<6){
                      Utils.flushBarErrorMessage("please enter 6 digit password", context);
                    }else{

                      Map<dynamic,dynamic> data = {
                        'email' : _emailController.text,
                         'password' : _passwordController.text
                      };
                      authViewModel.loginApi(data,context);
                      //Utils.toastMessage("Everything is OK now");
                    }
                  } ,
                  loading: false
              ),
            )
          ],
        ),
      )
    );
  }
}
