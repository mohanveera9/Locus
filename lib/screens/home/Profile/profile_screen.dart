import 'package:flutter/material.dart';
import 'package:locus/screens/Login/login_screen.dart';
import 'package:locus/screens/home/Profile/change_password_screen.dart';
import 'package:locus/screens/home/Profile/edit_profile_screen.dart';
import 'package:locus/screens/home/Profile/zone_screen.dart';
import 'package:locus/screens/home/explore/admin_chat_screen.dart';
import 'package:locus/screens/home/explore/create_new.dart';
import 'package:locus/widgets/danger_dialog_box.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<String> _getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return '${packageInfo.version}+${packageInfo.buildNumber}';
    } catch (e) {
      return 'Unknown';
    }
  }

  bool isAdmin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'CrimsonText-Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2.0),
                color: Colors.white,
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/img/profile.png'),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Rama Krishna',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'CrimsonText-Bold',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Text(
              '(Rama)',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'CrimsonText-Bold',
                color: Colors.grey,
              ),
            ),
            const Text(
              'n210000@rguktn.ac.in',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'CrimsonText-Bold',
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            fields(
              iconPath: 'assets/img/editprofile.png',
              label: 'Edit Profile',
              iconBg: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            fields(
              iconPath: 'assets/img/changepassword.png',
              label: 'Change Password',
              iconBg: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            fields(
              iconPath: 'assets/img/zone.png',
              label: 'Create Zone',
              iconBg: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZonePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            if (!isAdmin)
              fields(
                iconPath: 'assets/img/People.png',
                label: 'Create Club',
                iconBg: Theme.of(context).colorScheme.primary,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNew(),
                    ),
                  );
                },
              ),
            if (isAdmin)
              fields(
                iconPath: 'assets/img/People.png',
                label: 'Your Club',
                iconBg: Theme.of(context).colorScheme.primary,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminChatScreen(
                        name: "Research & Innovation Club",
                        img: 'assets/img/research.jpg',
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: 20),
            fields(
              iconPath: 'assets/img/deleteaccount.png',
              label: 'Delete Account',
              iconBg: Color(0xFFB80707),
              labelColor: Color(0xFFB80707),
              iconColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => DangerDialogBox(
                    title: 'Delete Account',
                    message: 'Are you sure you want to delete the account?',
                    confirmText: 'Delete',
                    canceltext: 'Cancel',
                    onConfirm: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => DangerDialogBox(
                          title: 'Sign Out',
                          message: 'Are you sure you want to sign out?',
                          confirmText: 'Sign Out',
                          canceltext: 'Cancel',
                          onConfirm: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFB80707),
                        fontFamily: 'CrimsonText-Bold',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<String>(
                    future: _getAppVersion(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox();
                      } else if (snapshot.hasError) {
                        return const Text("Version: -",
                            style: TextStyle(color: Colors.grey));
                      } else {
                        return Text(
                          'Version: ${snapshot.data}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fields({
    required String iconPath,
    required String label,
    required Color iconBg,
    Color labelColor = const Color(0xFF003B73),
    Color iconColor = const Color(0xFF003B73),
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: iconBg,
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
          ),
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'CrimsonText-Bold',
            color: labelColor,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right_outlined,
          size: 40,
          color: iconColor,
        ),
        onTap: onTap,
      ),
    );
  }
}
