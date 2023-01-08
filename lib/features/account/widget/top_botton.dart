import 'package:amazon/features/account/services/account_services.dart';
import 'package:amazon/features/account/widget/account_botton.dart';
import 'package:flutter/material.dart';
class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountBotton(
              text: 'Your orders',
              onTap: () {},
            ),
            AccountBotton(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountBotton(
              text: 'Your Wish List',
              onTap: () {},
            ),
            AccountBotton(
              text: 'Log out',
              onTap: () => AccountServices().logOut(context),
            ),
          ],
        ),
      ],
    );
  }
}