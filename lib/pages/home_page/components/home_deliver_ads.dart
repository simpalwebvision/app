import 'package:app/constants.dart';
import 'package:app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class HomeDeliverAds extends StatelessWidget {
  const HomeDeliverAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: size!.height * .167,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF2c94c),
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: vegetablesImage,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Stay home\nwe deliver",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Any where... Any time!!",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 11,
                ),
          ),
        ],
      ),
    );
  }
}
