import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxmob_assignment/Screens/HomeScreen/CustomerListScreen.dart';
import 'package:maxmob_assignment/Widgets/CustomSnack/CustomSnack.dart';
import '../../Widgets/Navigate/Navigate.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final LoginBloc _loginBloc = LoginBloc();

  getdata() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => LoginBloc(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/login.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 80),
              child: const Text(
                "Welcome\nBack",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Form(
                  key: _key,
                  child: Column(children: [
                    TextFormField(
                      showCursor: true,
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      validator: (input) =>
                          input!.isValidEmail() ? null : "Check your email",
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      showCursor: true,
                      autofocus: false,
                      controller: passwordController,
                      obscureText: true,
                      validator: (input) => input!.isNotEmpty
                          ? null
                          : "This filed can not be empty",
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          bloc: LoginBloc(),
                          builder: (context, state) {
                            return CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xff4c505b),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    if (state is LoginInitial) {
                                      //  BlocProvider.of(context).read<SubjectBloc>()(LogInbuttonPressed(
                                      //       username: emailController!.text,
                                      //       password: passwordController!.text));
                                      // }
                                      BlocProvider.of<LoginBloc>(context).add(
                                     
                                          LogInbuttonPressed(
                                              username: emailController!.text,
                                              password:
                                                  passwordController!.text));
                                    }
                                   if (state is LoginLoaded) {
                                        Navigate.pushTo(
                                            context, CustomerListScreen());

                                        CustmSnack.SuccessSnackbar(
                                            context, "Login Successful");
                                            
                                      } 
                                       if (state is LoginFailure) {
                                        CustmSnack.FailureSnackbar(
                                            context, "Login failed");
                                      }else{
                                          CustmSnack.FailureSnackbar(
                                            context, "Login failed");
                                      }
                                    
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
