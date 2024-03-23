import 'package:flutter/material.dart';
import '../desktop/_index.dart';
import '../mobile/_index.dart';
import '../theme/_index.dart';
import '../widgets/_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaung Myat Linn',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : AppBar(elevation: 0.0),
      drawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : NavBar().mobileNavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppThemeData.backgroundGrey,
          child: ResponsiveScreenProvider.isDesktopScreen(context)
              ? desktopUI()
              : mobileUI(),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Go to top',
              backgroundColor: AppThemeData.buttonPrimary,
              foregroundColor: AppThemeData.iconSecondary,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
    );
  }

  Widget desktopUI() {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: const [
        DS1Header(),
        DS2AboutMe(),
        DS3Education(),
        DS4Experience(),
        DS5Volunteering(),
        // DS6TechNotes(),
        DS7Contact(),
        DS8Footer(),
      ],
    );
  }

  Widget mobileUI() {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: const [
        MS1Header(),
        MS2AboutMe(),
        MS3Education(),
        MS4Experience(),
        MS5Volunteering(),
        // MS6TechNotes(),
        MS7Contact(),
        MS8Footer(),
      ],
    );
  }
}
