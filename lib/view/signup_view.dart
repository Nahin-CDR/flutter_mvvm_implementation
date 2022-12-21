import 'package:clean_code/resources/color.dart';
import 'package:clean_code/resources/components/round_button.dart';
import 'package:clean_code/utils/routes/routes_name.dart';
import 'package:clean_code/utils/utils.dart';
import 'package:clean_code/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

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
              Text("SignUp",
                style: TextStyle(color:AppColors.primaryColor),)
            ],
          ),
        ),
        body: SafeArea(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("eve.holt@reqres.in\npassword: pistol",style: TextStyle(color: Colors.grey),),
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
                    loading:authViewModel.signUpLoading,
                    title: "SignUp",
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
                        authViewModel.signUpApi(data,context);
                        //Utils.toastMessage("Everything is OK now");
                      }
                    } ,

                ),
              ),
              SizedBox(
                  height: height*.085
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child:const Text("Already have an account? Login",
                    style: TextStyle(
                        color: AppColors.primaryColor
                    )
                ),
              )

            ],
          ),
        )
    );
  }
}
