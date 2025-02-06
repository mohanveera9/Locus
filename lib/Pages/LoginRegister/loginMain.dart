import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/mainScreen.dart';
import 'package:locus/Pages/LoginRegister/login.dart';
import 'package:locus/Pages/LoginRegister/register/registerMain.dart';
import 'package:locus/widgets/customContainer.dart';
import 'package:locus/widgets/otherOptions.dart';

class Loginmain extends StatefulWidget {
  @override
  State<Loginmain> createState() => _LoginmainState();
}

class _LoginmainState extends State<Loginmain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset('assets/img/locus1.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 9,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'Electrolize',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Customcontainer(
                  widget: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  text: 'Continue with UID',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => Login(),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (builder) => Mainscreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Customcontainer(
                    widget: Image.asset(
                      'assets/img/google.png',
                      height: 30,
                      width: 30,
                    ),
                    text: 'Continue with Google',
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Customcontainer(
                  widget: Image.asset(
                    'assets/img/facebook.png',
                    height: 40,
                    width: 40,
                  ),
                  text: 'Continue with Facebook',
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Otheroptions(
                  text1: 'Do not have an account? ',
                  text2: 'Register',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => Registermain(),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 9,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
