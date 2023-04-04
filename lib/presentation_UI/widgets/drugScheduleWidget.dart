import 'package:flutter/material.dart';

class DrugScheduleWidget extends StatefulWidget {
  const DrugScheduleWidget({Key? key}) : super(key: key);

  @override
  State<DrugScheduleWidget> createState() => _DrugScheduleWidgetState();
}

class _DrugScheduleWidgetState extends State<DrugScheduleWidget> {
  bool drug1 = false;
  bool drug2 = false;

  bool drug3 = false;

  bool drug4 = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            width: 1,
            color: Colors.blue //                   <--- border width here
            ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width / 2,
      height: height * 0.25,
      child: Stack(
        children: [
          const Positioned(
            top: 5,
            right: 5,
            left: 5,
            child: Icon(
              size: 20,
              Icons.medication_liquid_outlined,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListView(
              children: [
                ListTile(
                  focusColor: Colors.red,
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.all(5),
                  leading: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: drug1,
                    onChanged: (bool? value) {
                      setState(() {
                        drug1 = value!;
                      });
                    },
                  ),
                  title: const Center(
                    child: Text(
                      'Melaxen',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailing: Text('22:00'),
                ),
                ListTile(
                  focusColor: Colors.red,
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.all(5),
                  leading: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: drug2,
                    onChanged: (bool? value) {
                      setState(() {
                        drug2 = value!;
                      });
                    },
                  ),
                  title: const Center(
                    child: Text(
                      'Melaxen',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailing: Text('22:00'),
                ),
                ListTile(
                  focusColor: Colors.red,
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.all(5),
                  leading: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: drug3,
                    onChanged: (bool? value) {
                      setState(() {
                        drug3 = value!;
                      });
                    },
                  ),
                  title: const Center(
                    child: Text(
                      'Melaxen',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailing: Text('22:00'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
