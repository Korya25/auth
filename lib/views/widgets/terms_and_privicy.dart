import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({super.key});

  @override
  State<TermsAndPrivacy> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  bool isAccepted = false;

  void toggleAcceptance() {
    setState(() {
      isAccepted = !isAccepted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: toggleAcceptance,
          icon: Icon(
            isAccepted ? Icons.check_box : Icons.check_box_outline_blank,
            color: isAccepted ? Colors.blue : Colors.white,
            size: 27,
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: 'I accept the '),
                  TextSpan(
                    text: 'terms & conditions',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(text: ' and the '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              overflow: TextOverflow.ellipsis, // Ensures overflow is handled
              maxLines: 2, // Ensures text is constrained to a single line
            ),
          ),
        ),
      ],
    );
  }
}
