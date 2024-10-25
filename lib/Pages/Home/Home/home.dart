import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Home/profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Padding(
            padding: EdgeInsets.only(left: 10.0,),
            child: Image.asset(
              'assets/img/locusw.png',
              width: 170,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => Profile(),
                    ),
                  );
                },
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(),
    );
  }
}
