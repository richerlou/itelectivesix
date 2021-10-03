import 'package:flutter/material.dart';
import 'package:itelectivesix/constants.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          elevation: 5.0,
          child: Row(
            children: <Widget>[
              const SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.home, color: gradPurple, size: 56),
                      Text("Housy",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Welcome Back, Please login to your account.",
                    style: TextStyle(fontSize: 25, color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .30,
                      child: Wrap(direction: Axis.horizontal, children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: buttonContainerNumber(
                                context,
                                "Login with Facebook",
                                fbBlue,
                                Colors.white,
                                MediaQuery.of(context).size.width * .15,
                                0,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              flex: 1,
                              child: buttonContainerNumber(
                                context,
                                "Login with Xing",
                                xingGreen,
                                Colors.white,
                                MediaQuery.of(context).size.width * .15,
                                0,
                              ),
                            ),
                          ],
                        ),
                      ])),
                  const SizedBox(height: 15),
                  Text(
                    "- OR -",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .30,
                      child: const TextField(
                          obscureText: false,
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Username"))),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .30,
                      child: const TextField(
                          obscureText: true,
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"))),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: gradPurple,
                            value: checkBoxValue,
                            onChanged: (bool? value) {
                              setState(() {
                                checkBoxValue = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          const Text("Remember Me",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                                text: "Forgot Password ",
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/home-screen');
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [gradPurple, gradPink, gradYellow],
                              )),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                          width: MediaQuery.of(context).size.width * .15,
                          margin: const EdgeInsets.all(0),
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )),
                          width: MediaQuery.of(context).size.width * .15,
                          margin: const EdgeInsets.all(0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "By signing up you agree to Housy's ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Terms and Conditions ",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()),
                    const TextSpan(
                        text: "& ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Privacy Policy ",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()),
                  ])),
                ],
              ),
              const SizedBox(width: 30),
              Flexible(
                flex: 3,
                child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [gradYellow, gradPink, gradPurple],
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container buttonContainerNumber(BuildContext context, String value,
    Color bgColor, Color txtColored, double boxSizer, double padNum) {
  return Container(
    height: 55,
    width: boxSizer,
    margin: EdgeInsets.all(padNum),
    child: TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all(bgColor),
      ),
      child: Text(
        value,
        style: TextStyle(color: txtColored),
      ),
    ),
  );
}
