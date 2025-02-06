import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Settings/delete.dart';
import 'package:locus/Pages/Home/Settings/feedback.dart';
import 'package:locus/Pages/Home/Settings/reportProblrm.dart';
import 'package:locus/Pages/Home/Settings/updatePassword.dart';
import 'package:locus/Pages/LoginRegister/loginMain.dart';
import 'package:locus/widgets/confirm_to_delete.dart';
import 'package:locus/widgets/editContainer.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Electrolize',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Editcontainer(
                                text: 'Update Password',
                                function: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (builder) => Updatepassword(),
                                    ),
                                  );
                                },
                                need: true,
                                icon: Icons.person_4_outlined,
                              ),
                              SizedBox(height: height * 0.02),
                              Editcontainer(
                                text: 'Report Problem',
                                function: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (builder) => Reportproblrm(),
                                    ),
                                  );
                                },
                                need: true,
                                icon: Icons.warning_amber,
                              ),
                              SizedBox(height: height * 0.02),
                              Editcontainer(
                                text: 'Feedback',
                                function: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (builder) => const FeedBack(),
                                    ),
                                  );
                                },
                                need: true,
                                icon: Icons.feedback_outlined,
                              ),
                              SizedBox(height: height * 0.02),
                              Editcontainer(
                                text: 'Delete my account',
                                function: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (builder) => Delete(),
                                    ),
                                  );
                                },
                                need: true,
                                icon: Icons.delete_outline,
                              ),
                              SizedBox(height: height * 0.02),
                              Editcontainer(
                                text: 'Log out',
                                function: () {
                                  ConfirmToDelete(
                                    message:
                                        'Are you sure you want to logout your Tepnoty account?',
                                    () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) =>
                                                  Loginmain()))
                                          .then((_) {});
                                    },
                                  ).showConfirmDialog(context);
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
        ],
      ),
    );
  }
}
