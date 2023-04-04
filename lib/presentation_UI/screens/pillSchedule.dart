import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/colors/colors.dart';
import 'package:solution_challenge/presentation_UI/screens/NavigationPage.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';
import 'package:solution_challenge/presentation_UI/widgets/buttonWidget.dart';

class PillSchedulePage extends StatelessWidget {
  const PillSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'График приема',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: mainColor,
                          radius: 20,
                          child: Icon(Icons.check),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                        child: const Divider(
                          color: Colors.grey,
                          height: 30,
                        )),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFF1DDE7D),
                          radius: 20,
                          child: Text(
                            '2',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                        child: const Divider(
                          color: Colors.grey,
                          height: 30,
                        )),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFFCBDEFA),
                          radius: 20,
                          child: Text(
                            '3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    children: const [
                      CircleAvatar(
                        child: Icon(Icons.check),
                        backgroundColor: mainColor,
                        radius: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: const Divider(
                      color: Colors.grey,
                      height: 30,
                    ),
                  ),
                  child: Text(
                    'Таблетки',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                Expanded(
                  child: Text(
                    'График',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Text(
                    'Просмотр',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'График приема',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Эпинифрин, Карвалол',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: '25 августа',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          suffixIcon: Icon(Icons.date_range),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Дата окончания',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          suffixIcon: Icon(Icons.date_range),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  ButtonWidget(
                      title: 'Далее',
                      backgroundColor: mainColor,
                      textColor: Colors.white)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: Text('medication')),
                Expanded(child: Text('schedule')),
                Expanded(child: Text('views')),
              ],
            ),
            Expanded(flex: 3, child: SizedBox()),
            ElevatedButton(
              // title: 'Войти',
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(mainColor),
                textStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                elevation: MaterialStatePropertyAll(1),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationPage(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text('Войти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
