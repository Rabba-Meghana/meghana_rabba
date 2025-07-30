import 'package:flutter/material.dart';
import 'package:lets_get_an_internship/hackathon.dart';
import 'package:lets_get_an_internship/photo.dart';
import '/intro_page.dart';
import '/education.dart';
import '/internship.dart';
import '/project.dart';
import '/achievements.dart';
import '/extras.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PortfolioHomeScreen(),
    );
  }
}

class PortfolioHomeScreen extends StatelessWidget {
  const PortfolioHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fixed background image
          Positioned.fill(
            child: Image.asset(
              'assets/videos/bottom#.gif',
              fit: BoxFit.cover,
            ),
          ),
Container(color:const Color.fromARGB(255, 37, 48, 80)!.withOpacity(0.65)
     // Change color/opacity as needed
    ),
          // PageView for vertical scrolling between sections
          PageView(pageSnapping:false,
            scrollDirection: Axis.vertical,
            children:  [
              IntroPage(),
              PhotoPage(imagePath:'assets/videos/phot2.png'),
              EducationPage(),
              InternshipPage(),
              ProjectsPage(),
              AchievementsPage(),
              HackathonAchievement(),
             ResumePage(),
            ],
          ),
        ],
      ),
    );
  }
}