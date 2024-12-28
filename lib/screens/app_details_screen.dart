import 'package:flutter/material.dart';
import 'package:flutter_openui/screens/app_card.dart';
import 'package:flutter_openui/screens/home_screen.dart';
import 'package:flutter_openui/utils/sizing.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDetailsScreen extends StatefulWidget {
  final App app;
  const AppDetailsScreen({super.key, required this.app});

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final app = widget.app;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: app.title,
              child: Material(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          AppCard(app: app, clipBottom: false),
                          Positioned(
                            top: kToolbarHeight,
                            right: kToolbarHeight / 2,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.6),
                                child: const Icon(Icons.close_rounded, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                        child: Text(
                          app.description,
                          style: GoogleFonts.dmSans(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
