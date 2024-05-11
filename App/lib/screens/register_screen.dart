
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resurate/screens/login_screen.dart';
import '../../helper/helper_function.dart';
import '../../widgets/widgets.dart';
import '../services/auth_services.dart';
import 'home_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final formkey = GlobalKey<FormState>();
class _RegisterPageState extends State<RegisterPage> {
  AuthService authService = AuthService();
  bool _isLoading = false;
  String email = "";
  String password="";
  String fullname="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: _isLoading? Center(child:
      CircularProgressIndicator(color: Theme.of(context).primaryColor,)): SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 80
            ),
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    const Text("Resurate",style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Create your account now chat and explore!",style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),),

                    Image.asset('assets/images/images.png'),


                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Full Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onChanged: (val){
                        setState(() {
                          fullname = val;

                        });
                      },



                      validator: (val) {

                        if(val!.isNotEmpty){
                          return null;
                        }else{
                          return "Name can't be empty";
                        }

                      },

                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onChanged: (val){
                        setState(() {
                          email = val;
                          print(email);
                        });
                      },


                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                            ? null
                            : "Please enter a valid email";
                      },

                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      validator: (val) {

                        if(val!.length < 6){
                          return "Password must be at least 6 character";
                        }else{
                          return null;
                        }
                      },

                      onChanged: (val){
                        setState(() {
                          password = val;
                          print(password);
                        });

                      },

                    ),
                    const SizedBox(height: 10,),

                    SizedBox(height: 30,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                        onPressed: () {
                          register();
                        },
                        child: const Text("Register",
                          style: TextStyle(color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Text.rich(
                        TextSpan(
                            text: "Already have an account!",
                            children: <TextSpan>[
                              TextSpan(
                                  text: " Login now",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      nextScreenReplace(context, const LoginPage());
                                    }),
                            ],

                            style: const TextStyle(color: Colors.black, fontSize: 14)
                        )
                    ),

                  ]
              ),
            ),
          )
      ),
    );

  }
  register() async{
    if(formkey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.registerUserWithEmailandPassword(fullname, email, password).then((value) async {
        if(value = true){

          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullname);
          nextScreenReplace(context, const HomePage());

        }else{
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = true;
          });
        }
      });
    }
  }
}