import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (_) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  icon: Icons.email_outlined,
                  controller: emailController,
                ),
                CustomTextField(
                  icon: Icons.lock_outline,
                  controller: passController,
                  isSecret: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    _.login();
                  },
                  child: const Text('data'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.icon,
    this.isSecret = false,
    required this.controller,
  });

  final bool isSecret;
  final IconData icon;
  final TextEditingController controller;

  bool? isObscure;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isObscure ?? widget.isSecret,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (widget.isObscure == !widget.isSecret) {
                          widget.isObscure = widget.isSecret;
                        } else {
                          widget.isObscure = !widget.isSecret;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye_sharp),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
