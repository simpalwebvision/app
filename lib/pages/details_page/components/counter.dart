import 'package:app/constants.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: kBorderColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            FloatingActionButton.small(
              elevation: 0,
              heroTag: null,
              onPressed: () {
                if (count > 1) {
                  setState(() {
                    count--;
                  });
                }
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.remove,
                color: Color(0xff2e3a59),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                count.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: kTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FloatingActionButton.small(
              elevation: 0,
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: Color(0xff2e3a59),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
