import 'package:hmi/about.dart';
import 'package:flutter/material.dart';
import 'auth_pages.dart';
import 'database.dart';
import 'edit_user.dart';
import 'user.dart';
import 'user_profile.dart';

IconButton popBackButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),
  );
}

IconButton settingButton(
    {required BuildContext context,
    required UserDb userDb,
    required User user}) {
  return IconButton(
    icon: const Icon(Icons.settings),
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit User'),
                  onTap: () {
                    // Close the bottom sheet of menu
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUserPage(
                                userDb: userDb,
                                user: userDb.muserCurrentUser as User,
                                changePassword: false)));
                  }),
              ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text("Change Password"),
                  onTap: () {
                    // Close the bottom sheet of menu
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUserPage(
                                userDb: userDb,
                                user: userDb.muserCurrentUser as User,
                                changePassword: true)));
                  }),
              ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    userDb.logOut();
                    Navigator.pop(context);
                  }),
              ListTile(
                  // Always show About option
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    helpShowAboutDialog(context: context);
                  })
            ],
          );
        },
      );
    },
  );
}

// show userDb.muserCurrentUser profile if userDb.mbLoggedIn is true else go to login page
IconButton profileButton(BuildContext context, UserDb userDb) {
  return IconButton(
    icon: const Icon(Icons.account_circle),
    onPressed: () {
      userDb.mbLoggedIn
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProfilePage(
                      userDb: userDb, user: userDb.muserCurrentUser as User)))
          : // Navigate to the login page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage(userDb: userDb)));
    },
  );
}

// Log in button
GestureDetector logInButton(BuildContext context, UserDb userDb) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(userDb: userDb)),
      );
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.login),
        ),
        const SizedBox(height: 15),
        const Text("Log In"),
      ],
    ),
  );
}

// Sign up button
GestureDetector signUpButton(BuildContext context, UserDb userDb) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage(userDb: userDb)),
      );
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.app_registration),
        ),
        const SizedBox(height: 15),
        const Text("Sign Up"),
      ],
    ),
  );
}

// recover password button
GestureDetector recoverPasswordButton(BuildContext context) {
  return GestureDetector(
    onTap: () => showForgetPasswordDialog(context),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.search),
        ),
        const SizedBox(height: 15),
        const Text("Forget Password"),
      ],
    ),
  );
}

// About button to show about dialog
GestureDetector aboutButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      helpShowAboutDialog(context: context);
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.info),
        ),
        const SizedBox(height: 15),
        const Text("About"),
      ],
    ),
  );
}
