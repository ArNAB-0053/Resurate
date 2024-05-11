
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resurate/constants.dart';
import 'package:resurate/screens/login_screen.dart';
import 'package:resurate/screens/profile_page.dart';
import 'package:resurate/screens/resume_uploading.dart';
import 'package:resurate/widgets/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg";

    return Drawer(
      child: Container(
        color: Constants.primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.white),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Team Droids"),
                accountEmail: Text("teamDroidsbusiness@gmail.com"),
                currentAccountPicture:
                CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
              ),
            ),

            // SizedBox(
            //   height: 70,
            // ),
            // CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            // "Fuck off bitch".text.make(),

            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                nextScreen(context, ProfilePage());
              },
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text("Profile",
                  textScaleFactor: 1,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                nextScreen(context, MyHomePage());
              },
              leading: Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
              ),
              title: Text("Resume",
                textScaleFactor: 1,
                style: TextStyle(color: Colors.white),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.contact_emergency,
                color: Colors.white,
              ),
              title: Text("Contact us",
                  textScaleFactor: 1,
                style: TextStyle(color: Colors.white),


              ),
            ),
            SizedBox(
              height: 180,
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark_rounded,
                color: Colors.white,
              ),
              title: Text("About us",
                  textScaleFactor: 1,
                style: TextStyle(color: Colors.white),

              ),
            ),

            // ListTile(
            //
            //   leading: Icon(
            //     Icons.logout,
            //     color: Colors.white,
            //   ),
            //   title: Text("Log out",
            //       textScaleFactor: 1,
            //     style: TextStyle(color: Colors.white),
            //
            //
            //   ),
            // )

            ListTile(
              onTap: () {
                logout(context);
              },
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Log out",
                textScaleFactor: 1,
                style: TextStyle(color: Colors.white),
              ),
            )


          ],
        ),
      ),
    );
  }
}

// Inside your class or widget
void logout(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // After signing out, you can navigate to the login screen or any other screen
    // For example:
    nextScreenReplace(context, LoginPage());
  } catch (e) {
    print("Error signing out: $e");
    // Handle error if any
  }
}
