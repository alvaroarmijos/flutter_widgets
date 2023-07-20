import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrickyLoginPage extends StatefulWidget {
  const TrickyLoginPage({super.key});

  @override
  State<TrickyLoginPage> createState() => _TrickyLoginPageState();
}

class _TrickyLoginPageState extends State<TrickyLoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  final _angleUserNotifier = ValueNotifier<double>(0);
  final _anglePasswordNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    _userController.addListener(() {
      if (_userController.text.isEmpty) {
        _angleUserNotifier.value = 0;
      } else {
        _angleUserNotifier.value -= 0.1;
      }
    });

    _passwordController.addListener(() {
      if (_passwordController.text.isEmpty) {
        _anglePasswordNotifier.value = 0;
      } else {
        _anglePasswordNotifier.value -= 0.1;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                    "https://web-strapi.mrmilu.com/uploads/flutter_logo_470e9f7491.png"),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: CupertinoButton(
                      child: const Text("Login"), onPressed: () {}),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 280),
                child: ValueListenableBuilder(
                  valueListenable: _angleUserNotifier,
                  builder: (context, value, _) {
                    return Transform.rotate(
                      angle: value,
                      alignment: Alignment.bottomRight,
                      child: CustomTextFormField(
                        controller: _userController,
                        hinText: "username",
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: ValueListenableBuilder(
                    valueListenable: _anglePasswordNotifier,
                    builder: (context, value, _) {
                      return Transform.rotate(
                        angle: value,
                        alignment: Alignment.topLeft,
                        child: CustomTextFormField(
                          controller: _passwordController,
                          hinText: "password",
                          obscureText: true,
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, this.controller, this.obscureText = false, this.hinText});

  final TextEditingController? controller;
  final bool obscureText;
  final String? hinText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hinText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
