import 'dart:convert';

import 'package:efficacy_user/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_drawer/custom_drawer.dart';

class Developer {
  final String name;
  final String image;
  final String github;
  final String linkedin;

  Developer(
      {required this.name,
      required this.image,
      required this.github,
      required this.linkedin});
}

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({super.key});

  static const String routeName = '/developersPage';

  @override
  DevelopersPageState createState() => DevelopersPageState();
}

class DevelopersPageState extends State<DevelopersPage> {
  List<Developer> developers = [];
  late List<bool> iconVisibility;

  @override
  void initState() {
    super.initState();
    loadDevelopers();
  }

  Future<void> loadDevelopers() async {
    String jsonString =
        await rootBundle.loadString('assets/developers_data/developers.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    setState(() {
      developers = jsonList
          .map((e) => Developer(
                name: e['name'],
                image: e['image'],
                github: e['github'],
                linkedin: e['linkedin'],
              ))
          .toList();
      iconVisibility = List<bool>.filled(developers.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double cardImageSize = width * 0.35;
    double cardImageSizeSmall = width * 0.20;
    double cardSpacing = width * 0.025;

    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'Developers',
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Developed by:",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Image.asset(
              "assets/images/gdsc_logo.png",
              width: cardImageSizeSmall,
            ),
            const Text(
              "Google Developer Student Clubs,",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const Text(
              "National Institute of Technology, Silchar.",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: developers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: cardSpacing,
                  mainAxisSpacing: cardSpacing,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        iconVisibility[index] = !iconVisibility[index];
                      });
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: iconVisibility[index]
                                ? cardImageSizeSmall
                                : cardImageSize,
                            height: iconVisibility[index]
                                ? cardImageSizeSmall
                                : cardImageSize,
                            decoration: BoxDecoration(
                              shape: iconVisibility[index]
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(developers[index].image),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(developers[index].name),
                          const SizedBox(height: 10),
                          if (iconVisibility[index]) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.github,
                                  ),
                                  onPressed: () {
                                    launch(developers[index].github);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.linkedin,
                                  ),
                                  onPressed: () {
                                    launch(developers[index].linkedin);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
