import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/drugsearch_page.dart';
import 'package:solution_challenge/presentation_UI/screens/information_page.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/widgets/buttonWidget.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Вход',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Авторизуйтесь',
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
                autofocus: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  hintText: 'Your password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 230,
              ),
              Center(
                child: Column(
                  children: <Widget>[
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
                            builder: (context) => InformationPage(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text('Войти'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      // title: 'Войти',
                      style: const ButtonStyle(
                        // splashFactory: Splash,
                        overlayColor: MaterialStatePropertyAll(Colors.grey),

                        backgroundColor: MaterialStatePropertyAll(Colors.white),

                        elevation: MaterialStatePropertyAll(0),
                        side: MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      onPressed: () {
                        print('asd');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          'Забыли пароль',
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
