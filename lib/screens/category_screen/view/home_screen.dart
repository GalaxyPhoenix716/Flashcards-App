import 'package:flashcards_app/screens/category_screen/widgets/curved_edges.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: FcCurvedEdges(),
            child: Container(
              color: FcColors.primary,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 45, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu, color: FcColors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: FcColors.primaryAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('English'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 32,
                            color: FcColors.tertiary,
                          ),
                        ),
                        Text(
                          'Pick a set to practice',
                          style: TextStyle(
                            fontSize: 15,
                            color: FcColors.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: FcColors.tertiary,
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: FcColors.tertiary,
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
