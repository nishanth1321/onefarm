import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_pro/colors.dart';
import 'package:main_pro/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_pro/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  void Signin(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailcontroller.text, password: _passwordcontroller.text)
        .catchError((onError) {
      print(onError);
    }).then((authUser) {
      if (authUser.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      bgimage,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      height: height * 0.42,
                      width: width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.4, 0.75],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.white])),
                      //color: Colors.white.withOpacity(0.3),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              appName,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              slogan,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: const Text(
                      "  $Loginstring",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primarycolor.withOpacity(0.4),
                            Colors.transparent
                          ],
                        ),
                        border: const Border(
                            left: BorderSide(color: primarycolor, width: 5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (email) {
                      if (email != null && email.isEmpty) {
                        return "Please Enter Email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email!)) {
                        return "Its not an valid Email";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(Icons.email, color: primarycolor),
                        labelText: "Email Address",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 18)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (password) {
                      if (password != null && password.isEmpty) {
                        return "Please Enter Password";
                      } else if (password!.length < 8) {
                        return "Password is weak";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(Icons.password, color: primarycolor),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 18)),
                  ),
                ),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    forgettext,
                    style: TextStyle(color: primarycolor),
                  ),
                )),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primarycolor),
                    onPressed: () {
                      formkey.currentState?.save();

                      Signin(context);
                    },
                    child: const Text(
                      "Login To Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have an account?",
                      style: TextStyle(color: primarycolor),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Create account",
                            style: TextStyle(color: primarycolor)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
