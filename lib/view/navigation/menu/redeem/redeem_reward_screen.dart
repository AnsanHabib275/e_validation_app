import 'package:e_validation/view/navigation/menu/redeem/widget/reward_card_grid.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/section_header.dart';
import 'package:flutter/material.dart';

class RedeemRewardScreen extends StatefulWidget {
  const RedeemRewardScreen({super.key});

  @override
  State<RedeemRewardScreen> createState() => _RedeemRewardScreenState();
}

class _RedeemRewardScreenState extends State<RedeemRewardScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/reward_icon.png', // Replace with your asset
                        height: 150,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Redeem Your Rewards",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                SectionHeader(title: "Transportation"),
                RewardCardGrid(),
                SizedBox(height: 24),
                SectionHeader(title: "Restaurants"),
                RewardCardGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
