import 'package:e_validation/view/navigation/menu/redeem/widget/reward_card.dart';
import 'package:flutter/material.dart';

class RewardCardGrid extends StatelessWidget {
  const RewardCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return RewardCard();
      },
      itemCount: 6,
    );
  }
}
