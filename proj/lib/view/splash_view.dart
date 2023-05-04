import 'package:flutter/material.dart';
import 'package:proj/utilies/app_images.dart';

import 'home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation fadingAination;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    fadingAination =
        Tween<double>(begin: 0.4, end: 1).animate(animationController);
    animationController.repeat(reverse: true);
    animationController.addListener(() {
      setState(() {});
    },);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeView();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
            opacity: animationController.value,
            child: Image.asset(AppImages.kLogo)),
      ),
    );
  }
}
