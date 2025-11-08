import 'package:flutter/material.dart';
import '../../widgets/atm_card.dart';
import '../../widgets/transaction_item.dart';
import '../../models/transaction.dart';
import '../../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Sushi', '-Rp35.000', 'Food'),
      TransactionModel('Gojek', '-Rp25.000', 'Travel'),
      TransactionModel('Swim Membership', '-Rp150.000', 'Health'),
      TransactionModel('Road Race', '-Rp60.000', 'Event'),
      TransactionModel('Casual', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      // ===== Gradient Background =====
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF97A87A), Color(0xFF003300)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== AppBar Custom =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Finance Mate',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ===== Title =====
                const Text(
                  'Hi Muslih,',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                // ===== Title =====
                const Text(
                  'Hows Your Day?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AtmCard(
                        bankName: 'Bank BRI',
                        cardNumber: '**** 2345',
                        balance: 'Rp12.500.000.000',
                        backgroundImage: 'assets/bri.jpeg',
                      ),
                      AtmCard(
                        bankName: 'Bank BCA',
                        cardNumber: '**** 8765',
                        balance: 'Rp5.350.000.000',
                        backgroundImage: 'assets/bca.jpeg',
                      ),
                      AtmCard(
                        bankName: 'Bank Mandiri',
                        cardNumber: '**** 3456',
                        balance: 'Rp8.890.000.000',
                        backgroundImage: 'assets/mandiri.jpeg',
                      ),
                      AtmCard(
                        bankName: 'Bank BSI',
                        cardNumber: '**** 7659',
                        balance: 'Rp10.300.000.000',
                        backgroundImage: 'assets/bsi.jpeg',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _animatedMenuItem(
                        Icons.health_and_safety,
                        'Health',
                        Colors.pinkAccent,
                        0,
                      ),
                      _animatedMenuItem(
                        Icons.travel_explore,
                        'Travel',
                        Colors.blueAccent,
                        1,
                      ),
                      _animatedMenuItem(
                        Icons.fastfood,
                        'Food',
                        Colors.orangeAccent,
                        2,
                      ),
                      _animatedMenuItem(
                        Icons.event,
                        'Event',
                        Colors.greenAccent,
                        3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TweenAnimationBuilder(
                      tween: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: const Offset(0, 0),
                      ),
                      duration: Duration(milliseconds: 300 + (index * 100)),
                      builder: (context, Offset offset, child) {
                        return Transform.translate(
                          offset: Offset(offset.dx * 200, 0),
                          child: Opacity(
                            opacity: 1 - offset.dx.abs(),
                            child: child,
                          ),
                        );
                      },
                      child: TransactionItem(transaction: transactions[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedMenuItem(
    IconData icon,
    String label,
    Color color,
    int index,
  ) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            width: 140,
            margin: EdgeInsets.only(right: index == 3 ? 0 : 16),
            child: GridMenuItem(icon: icon, label: label, color: color),
          ),
        );
      },
    );
  }
}
