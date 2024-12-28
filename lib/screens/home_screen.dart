import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_openui/routes/router.dart';
import 'package:flutter_openui/screens/app_card.dart';
import 'package:flutter_openui/screens/app_details_screen.dart';
import 'package:flutter_openui/utils/sizing.dart';
import 'package:google_fonts/google_fonts.dart';

class App {
  final String image;
  final String title;
  final String description;

  App({required this.image, required this.title, required this.description});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<App> apps = List.generate(10, (i) {
    final faker = fk.Faker();
    return App(
      image: faker.image.loremPicsum(random: i),
      title: faker.company.name(),
      description: faker.lorem.sentences(10).join('\n'),
    );
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ...apps.map((app) {
                  return InkWell(
                    onTap: () {
                      AppRouter.navigate(context, AppDetailsScreen(app: app));
                    },
                    child: Hero(
                      tag: app.title,
                      child: Material(
                        child: AppCard(app: app, clipBottom: true),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
