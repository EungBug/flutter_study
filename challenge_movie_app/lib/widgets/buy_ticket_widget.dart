import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyTicketButton extends StatelessWidget {
  final String url;
  const BuyTicketButton({
    super.key,
    required this.url,
  });

  onTapButton() async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffF2C94C),
          ),
          child: const Center(
            child: Text(
              'Buy ticket',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
