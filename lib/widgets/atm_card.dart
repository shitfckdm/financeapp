import 'package:flutter/material.dart';

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final String? backgroundImage;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          // overlay supaya teks tetap jelas di atas gambar
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.25),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                bankName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                balance,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
