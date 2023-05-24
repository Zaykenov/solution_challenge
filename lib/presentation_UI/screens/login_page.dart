import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/profile_page.dart';
import 'package:solution_challenge/presentation_UI/screens/registration_page.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _auth = FirebaseAuth.instance;

  late String _email;

  late String _password;
  @override
  void initState() {
    email.text = '';
    password.text = '';
    super.initState();
  }

  bool _isLoadingSignIn = false;
  bool _isLoadingSendReset = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Sign in',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Authorize',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  hintText: 'Your email address',
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
                autofocus: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  hintText: 'Your password',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
              const SizedBox(
                height: 230,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(mainColor),
                        textStyle: MaterialStatePropertyAll(
                            TextStyle(color: Colors.white)),
                        elevation: MaterialStatePropertyAll(1),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoadingSignIn = true;
                        });
                        try {
                          final userCredential =
                              await _auth.signInWithEmailAndPassword(
                            email: _email,
                            password: _password,
                          );
                          if (userCredential.user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        } finally {
                          setState(() {
                            _isLoadingSignIn = false;
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: _isLoadingSignIn
                            ? Container(
                                width: 16,
                                height: 16,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ),
                              )
                            : const Text('Sign in'),
                      ),
                    ),
                    ElevatedButton(
                      // title: 'Войти',
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(mainColor),
                        textStyle: MaterialStatePropertyAll(
                            TextStyle(color: Colors.white)),
                        elevation: MaterialStatePropertyAll(1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text('Sign up'),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(Colors.grey),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        elevation: MaterialStatePropertyAll(0),
                        side: MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoadingSendReset = true;
                        });
                        try {
                          await _auth.sendPasswordResetEmail(email: _email);
                        } catch (e) {
                          print(e);
                        } finally {
                          setState(() {
                            _isLoadingSendReset = false;
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: _isLoadingSendReset
                            ? Container(
                                width: 16,
                                height: 16,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ),
                              )
                            : const Text(
                                'Forgot my Password',
                                style: TextStyle(color: Colors.black),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
