import 'package:flutter/material.dart';
import 'package:testfirebasapp/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNu = TextEditingController();
  final _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Form(
        key: _formkey,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'phone number',
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: phoneNu,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // SignUpController.instance
                  //     .phoneAuthentication(phoneNu.text.trim());
                },
                child: Text("login")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
                child: Text("PhoneAuthScreen"))
          ],
        )),
      ),
    );
  }
}
