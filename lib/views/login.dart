import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/my_bottom_nav.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              // Logo
              Image.asset(
                'assets/images/nubb_logo.png',
                width: 120,
                height: 120,
              ),
              // Logo
              const Text(
                'Login',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              // Sign in as a admin
              const Text(
                'Sign in as a admin',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              // name textfield
              const CustomTextField(
                label: 'Name',
                hint: 'Enter your name',
                keyboardType: TextInputType.name,
                isPassword: false,
                obsureText: false,
              ),
              const SizedBox(height: 10),
              // password textfield
              const CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obsureText: true,
              ),
              // forget password
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              // button
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      color: Colors.black,
                      onPressed: () {
                        Get.offAll(
                          const MyBottomNav(),
                        );
                      },
                      text: 'Login',
                    ),
                  )
                ],
              ),

              const Spacer(),
              // Don't have an Account yet? Contact Dev
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Don't have an account yet?",
                    style: TextStyle(color: Colors.grey[600])),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
