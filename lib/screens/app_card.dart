import 'package:flutter/material.dart';
import 'package:flutter_openui/screens/home_screen.dart';
import 'package:flutter_openui/utils/sizing.dart';
import 'package:google_fonts/google_fonts.dart';

class AppCard extends StatelessWidget {
  final App app;
  final bool? clipBottom;
  const AppCard({super.key, required this.app, this.clipBottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(clipBottom == true ? 10 : 0),
        child: Stack(
          children: [
            Image.network(
              app.image,
              height: AppSizing.height(context) / 2,
              fit: BoxFit.cover,
            ),
            Positioned(
              child: Container(
                color: Colors.black.withOpacity(0.3),
                height: AppSizing.height(context) / 2,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      app.description,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            app.image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        AppSizing.kwSpacer(context, 0.02),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                app.title,
                                maxLines: 1,
                                style: GoogleFonts.dmSans(color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                app.description,
                                maxLines: 1,
                                style: GoogleFonts.dmSans(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        AppSizing.kwSpacer(context, 0.05),
                        Chip(
                          backgroundColor: Colors.grey,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: Text(
                            "Get",
                            maxLines: 2,
                            style: GoogleFonts.dmSans(color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text(app.description),
          ],
        ),
      ),
    );
  }
}
