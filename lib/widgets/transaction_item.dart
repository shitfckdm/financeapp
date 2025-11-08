import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    // pilih ikon dan warna berdasarkan kategori
    IconData icon;
    Color iconColor;

    switch (transaction.category) {
      case 'Food':
        icon = Icons.fastfood;
        iconColor = Colors.orangeAccent;
        break;
      case 'Travel':
        icon = Icons.travel_explore;
        iconColor = Colors.blueAccent;
        break;
      case 'Health':
        icon = Icons.health_and_safety;
        iconColor = Colors.pinkAccent;
        break;
      case 'Event':
        icon = Icons.event;
        iconColor = Colors.greenAccent;
        break;
      case 'Income':
        icon = Icons.attach_money;
        iconColor = Colors.lightGreen;
        break;
      default:
        icon = Icons.monetization_on;
        iconColor = Colors.deepPurple;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white.withOpacity(0.1), // background semi-transparent
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          transaction.category,
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        trailing: Text(
          transaction.amount,
          style: TextStyle(
            color: transaction.amount.startsWith('-') ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}