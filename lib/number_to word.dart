import 'package:flutter/material.dart';

import 'package:number_to_words_english/number_to_words_english.dart';

void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number to Words Converter',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  TextEditingController _numberController = TextEditingController();
   String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number to Words Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              onChanged: (content) {
                amountConvert();
                // setState(() {
                //   int inputValue = int.tryParse(_numberController.text) ?? 0;
                //   _result = NumberToWordsEnglish.convert(inputValue);
                // });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // setState(() {
                //   int inputValue = int.tryParse(_numberController.text) ?? 0;
                //   _result = NumberToWordsEnglish.convert(inputValue);
                // });
              },
              child: const Text('Convert to Words'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
  void amountConvert() {
    setState(() {
        int inputValue = int.tryParse(_numberController.text) ?? 0;
        _result = NumberToWordsEnglish.convert(inputValue);
      });
  }
}
