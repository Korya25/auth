import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/services/auth/auth_services.dart';
import 'package:authapp/views/screen/home/settings_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 45, 45, 49),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),

              // Home list title
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text(
                    "H o m e",
                    style: AppTextStyle.labelTextFormField,
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Settings
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text(
                    "S E T T I N G S",
                    style: AppTextStyle.labelTextFormField,
                  ),
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SettingeScreen();
                      },
                    ));
                  },
                ),
              ),

              // Logout list tile
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text(
                "L O G O U T",
                style: AppTextStyle.labelTextFormField,
              ),
              leading: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 255, 19, 2),
              ),
              onTap: () async {
                await AuthServices().signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
/*
   onPressed: () async {
                await GoogleAuthService().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginOrRegisterPage()),
                );
              },
*/
