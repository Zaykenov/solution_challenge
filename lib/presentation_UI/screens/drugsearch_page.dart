import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/colors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

TextEditingController search = TextEditingController();

class DrugSearchPage extends StatefulWidget {
  const DrugSearchPage({Key? key}) : super(key: key);

  @override
  State<DrugSearchPage> createState() => _DrugSearchPageState();
}

class _DrugSearchPageState extends State<DrugSearchPage> {
  bool _isListening = false;
  final stt.SpeechToText _speech = stt.SpeechToText();
  static List<String> searchHistory = [];
  List<String> displayList = List.from(searchHistory);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: search,
            onChanged: (value) {
              setState(() {
                search.text = value;
                search.selection = TextSelection.fromPosition(
                    TextPosition(offset: search.text.length));
                selectSearchElement(value);
              });
            },
            onSubmitted: (value) {
              searchHistory.add(value);
              search.clear();
            },
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Какое лекарство вы ищете?',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _listen,
            icon: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
              size: 25,
              color: mainColor,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                const Expanded(
                  flex: 2,
                  child: Text(
                    'История поиска',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    setState(() {
                      searchHistory.clear();
                    });
                  },
                  child: const Text(
                    'ОЧИСТИТЬ',
                    style: TextStyle(fontSize: 14, color: mainColor),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: ListTile(
                            title: Text(displayList[index]),
                            trailing: const Icon(
                              Icons.call_made_sharp,
                              color: mainColor,
                            ),
                          ),
                        ),
                      )))
        ],
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        debugLogging: true,
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            search.text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void selectSearchElement(String val) {
    setState(() {
      displayList = searchHistory
          .where((element) => element.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }
}
