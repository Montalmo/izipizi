import 'package:flutter/material.dart';
import 'package:izipizi/APIs/apis.dart';

import '../screens/main_screen.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  static const routeName = 'add-device-screen';

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController idCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Додати пристрій'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: idCardController,
                decoration: const InputDecoration(
                    labelText: 'ID картки', hintText: 'xxxxxx'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Code картки', hintText: 'xxxx'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    APIs.addMyDevice(idCardController.text);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context)
                        .pushReplacementNamed(MainScreen.routeName);
                  },
                  child: const Text('Додати'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
