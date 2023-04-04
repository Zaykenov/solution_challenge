import 'package:flutter/material.dart';
import 'package:solution_challenge/presentation_UI/screens/drugsearch_page.dart';
import 'package:solution_challenge/presentation_UI/screens/pillSchedule.dart';
import 'package:solution_challenge/presentation_UI/widgets/appBarWidget.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:solution_challenge/presentation_UI/widgets/buttonWidget.dart';
import 'package:solution_challenge/presentation_UI/widgets/infoTextFieldWidget.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Информация',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    'Имя и адрес',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: const [
                      Expanded(child: TextFieldWidget(labelText: 'Имя')),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: TextFieldWidget(labelText: 'Фамилия')),
                    ],
                  ),
                  const TextFieldWidget(labelText: 'Адрес'),
                  Row(
                    children: const [
                      Expanded(child: TextFieldWidget(labelText: 'Индекс')),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFieldWidget(labelText: 'Город'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: TextFieldWidget(labelText: 'Область')),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Медицинские данные',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const TextFieldWidget(
                    labelText: 'Группа крови',
                  ),
                  Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: TextFieldWidget(
                          labelText: 'Тип',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFieldWidget(
                          labelText: 'Тип 2',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const Text(
                    'Категории',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const TextFieldWidget(
                    labelText: 'Группа крови',
                  ),
                  Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: TextFieldWidget(
                          labelText: 'Группа крови',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFieldWidget(
                          labelText: 'Группа крови',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
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
                    builder: (context) => DrugSearchPage(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text('Войти'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
