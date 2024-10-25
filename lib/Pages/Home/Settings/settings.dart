import 'dart:ui';

import 'package:app/Pages/Home/Settings/UpdatePassword.dart/resetPassword.dart';
import 'package:app/Pages/Home/Settings/block.dart';
import 'package:app/Pages/Home/Settings/delete.dart';
import 'package:app/Pages/Home/Settings/editProfile.dart';
import 'package:app/Pages/Home/Settings/feedback.dart';
import 'package:app/Pages/Home/Settings/reportProblrm.dart';
import 'package:app/Pages/Login/login.dart';
import 'package:app/widgets/confirm_to_delete.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/bigText.dart';
import 'package:app/widgets/editContainer.dart';
import 'package:app/widgets/Buttons/settingsButton.dart';
import 'package:app/widgets/smallText.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isSelected = false;
  bool _isSelected1 = false;
  bool _isLoading = false; // To manage loading state

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).maybePop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.05),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Container(
                            height: 120,
                            width: 120,
                            child: Image.asset('assets/img/mohan.jpg'),
                          ),
                        ),
                        Bigtext(text: 'Jhon Doe'),
                        Smalltext(text: '@Jhondoe123'),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeButton(
                              text: 'Edit Profile',
                              vpadding: width * 0.001,
                              hpadding: height * 0.002,
                              selected: _isSelected,
                              function: () {
                                setState(() {
                                  _isSelected = true;
                                  _isSelected1 = false;
                                  _isLoading = true; // Show loading indicator
                                });

                                // Delay for 2 seconds before navigating
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.of(context)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (builder) => Editprofile(),
                                    ),
                                  )
                                      .then((_) {
                                    setState(() {
                                      _isLoading = false;
                                      _isSelected = false;
                                    });
                                  });
                                });
                              },
                            ),
                            HomeButton(
                              text: 'Share Profile',
                              vpadding: width * 0.001,
                              hpadding: height * 0.002,
                              selected: _isSelected1,
                              function: () {
                                setState(() {
                                  _isSelected1 = true;
                                  _isSelected = false;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Basic Settings',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Editcontainer(
                                  text: 'Update Password',
                                  function: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) =>
                                                  const HomeResetpassword()))
                                          .then((_) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      });
                                    });
                                  },
                                  need: false,
                                  icon: Icons.person_2_outlined,
                                ),
                                SizedBox(height: height * 0.02),
                                Editcontainer(
                                  text: 'Report Problem',
                                  function: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) =>
                                                  Reportproblrm()))
                                          .then((_) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      });
                                    });
                                  },
                                  need: true,
                                  icon: Icons.warning_amber,
                                ),
                                SizedBox(height: height * 0.02),
                                Editcontainer(
                                  text: 'Blocked Profiles',
                                  function: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) => Block()))
                                          .then((_) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      });
                                    });
                                  },
                                  need: true,
                                  icon: Icons.block,
                                ),
                                SizedBox(height: height * 0.02),
                                Editcontainer(
                                  text: 'Feedback',
                                  function: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) =>
                                                  const FeedBack()))
                                          .then((_) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      });
                                    });
                                  },
                                  need: true,
                                  icon: Icons.feedback_outlined,
                                ),
                                SizedBox(height: height * 0.02),
                                Editcontainer(
                                  text: 'Delete my account',
                                  function: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) => Delete()))
                                          .then((_) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      });
                                    });
                                  },
                                  need: true,
                                  icon: Icons.delete_outline,
                                ),
                                SizedBox(height: height * 0.02),
                                Editcontainer(
                                  text: 'Log out',
                                  function: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      ConfirmToDelete(
                                        message:
                                            'Are you sure you want to logout your Tepnoty account?',
                                        () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (builder) =>
                                                      const Login()))
                                              .then((_) {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          });
                                        },
                                      ).showConfirmDialog(context);
                                    });
                                  },
                                  need: true,
                                  icon: Icons.logout,
                                ),
                                SizedBox(height: height * 0.05),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Theme.of(context)
                    .colorScheme
                    .primary, // Customize the color
              ),
            ),
        ],
      ),
    );
  }
}
