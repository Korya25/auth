import 'package:authapp/constants/app_text_style.dart';
import 'package:authapp/features/auth/screens/main_auth/login_or_register_screen.dart';
import 'package:authapp/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VirfiyScreen extends StatelessWidget {
  const VirfiyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text('Verify', style: AppTextStyle.appBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () {
                VerificationDialog().showVerificationDialog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Center(
                    child: Text(
                  'Clic to Virfiy email',
                  style: AppTextStyle.labelTextFormField,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerificationDialog {
  void showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // منع الإغلاق بالنقر خارج النافذة
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 45, 45, 49),
          title: const Text(
            'Email Verification',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Text(
            'Your account has been created successfully, Please verify your email address.',
            style: AppTextStyle.labelTextFormField,
            textAlign: TextAlign.center,
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () => resendVerificationEmail(context),
                      child: const Text(
                        'Resend Email',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => checkVerificationStatus(context),
                      child: const Text(
                        'I have verified',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginOrRegisterScreen();
                      },
                    ));
                  },
                  child: const Text(
                    'Go to Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> resendVerificationEmail(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('The verification link has been sent again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send verification email.')),
      );
    }
  }

  /// التحقق من حالة البريد الإلكتروني.
  Future<void> checkVerificationStatus(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await user?.reload();
      if (user != null && user.emailVerified) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Your email has not been verified yet.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Error occurred while checking verification status.')),
      );
    }
  }
}
