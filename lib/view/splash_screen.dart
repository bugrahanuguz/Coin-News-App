import 'package:coin_news_app/view/purchase_screen.dart';
import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:coin_news_app/viewmodel/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../viewmodel/firebase_analtyics.dart';
import '../viewmodel/qonversion.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Provider.of<CoinsViewModel>(context, listen: false).getCoins();
        await Provider.of<CoinsViewModel>(context, listen: false)
            .addCoinsToWatchCoins();
        Provider.of<QonversionService>(context, listen: false)
            .initializeQonversion();
        await Provider.of<RemoteConfigService>(context, listen: false).initialize();
        Provider.of<CoinsViewModel>(context, listen: false).loadTrackedCoins();
        FirebaseAnalyticsService.purchase_screen_viewed();
        AmplitudeConnection.purchase_screen_viewed();
        AmplitudeConnection.user_property("false");
        FirebaseAnalyticsService.user_property("false");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PurchaseScreen(
                      source: 'app_started',
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coinNewsColor,
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.13),
              Image.asset(
                "assets/splash_icon.png",
                width: 222,
                height: 228,
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Coin News",
                style: TextStyle(
                    color: Color(0xff151A1F),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Unlimited Source of Crypto",
                style: TextStyle(
                    color: Color(0xff151A1F),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen.withScreenFunction(
     
//       splash: Image.asset(
//             "assets/splash_icon.png",),
          
//       //     )
//       // Column(
//       //   children: [
//       //     Image.asset(
//       //       "assets/splash_icon.png",
//       //       width: 70,
//       //       height: 50,
//       //     ),
//       //     // const SizedBox(height: 20.0),
          
//       //     const Text(
//       //       "Coin News",
//       //       style: TextStyle(
//       //           color: Color(0xff151A1F),
//       //           fontSize: 18,
//       //           fontWeight: FontWeight.bold),
//       //     ),
//       //     // const SizedBox(height: 20.0),
//       //     const Text(
//       //       "Unlimited Source of Crypto",
//       //       style: TextStyle(
//       //           color: Color(0xff151A1F),
//       //           fontSize: 14,
//       //           fontWeight: FontWeight.bold),
//       //     )
//       //   ],
//       // ),
//       screenFunction: () async {
//         await Provider.of<CoinsViewModel>(context, listen: false).getCoins();
//         await Provider.of<CoinsViewModel>(context, listen: false)
//             .addCoinsToWatchCoins();
//         return const BottomNavBar();
//       },
//       backgroundColor: coinNewsColor,
//       duration: 500,
//       splashTransition: SplashTransition.fadeTransition,
//       animationDuration: const Duration(seconds: 0),
//     );
//   }
// }
