import 'package:flutter/material.dart';
import 'package:infinite_list/screen/di_data_pass/screen_two.dart';

import '../../api/provider/person_data.dart';
import '../../injection_container.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  void initState() {
    final model = sl<PersonData>();
    print(model.getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Calling Build in Screen One');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenTwo(),
                  ),
                );
              },
              child: const Text('Go to 2nd screen'),
            ),
          ),
        ],
      ),
    );
  }
}
