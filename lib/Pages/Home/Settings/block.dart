import 'dart:ui';
import 'package:app/widgets/blockedProfile_Container.dart';
import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final BlockedProfiles = [
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
    {'img': 'assets/img/mohan.jpg', 'text1': 'Johny', 'text2': '@Johny123'},
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          'Blocked Profiles',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Icon(
                          Icons.arrow_back,
                          size: 1,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    // Wrap ListView in Expanded to give it height constraint
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: BlockedProfiles.length,
                        itemBuilder: (context, index) {
                          final BlockedProfile = BlockedProfiles[index];
                          return BlockedprofileContainer(
                            img: BlockedProfile['img'] as String,
                            text1: BlockedProfile['text1'] as String,
                            text2: BlockedProfile['text2'] as String,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
