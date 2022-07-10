import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white70,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset("assets/images/secure_login.svg",
                fit: BoxFit.contain),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton?25 : 8),
                    child: InkWell(
                      onTap: () async {
                        setState((){
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton?50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton?Icon(Icons.done, color: Colors.white): Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                  //     child: Text("Login")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
