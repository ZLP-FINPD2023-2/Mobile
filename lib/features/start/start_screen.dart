import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with TickerProviderStateMixin {
  double xAngle = 0;
  double yAngle = 0;
  double zAngle = 0;
  double prevXAngle = 0;
  double prevYAngle = 0;
  double prevZAngle = 0;

  List<StreamSubscription<dynamic>> streamSub = [];

  @override
  void initState() {
    super.initState();
    streamSub.add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        prevXAngle = xAngle;
        prevYAngle = yAngle;
        prevZAngle = zAngle;
        xAngle = event.x;
        yAngle = event.y;
        zAngle = event.z;
      });
    }));
  }

  @override
  void dispose() {
    for (var sub in streamSub) {
      sub.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: prevXAngle, end: xAngle),
              duration: Duration(milliseconds: 500),
              builder: (context, xValue, child) {
                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: prevZAngle, end: zAngle),
                  duration: Duration(milliseconds: 500),
                  builder: (context, zValue, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // perspective
                        ..rotateX(-zValue / 6)
                        ..rotateY(xValue / 6),
                      alignment: FractionalOffset.center,
                      child: SizedBox(
                        height: 160,
                        width: 180,
                        child: SvgPicture.asset('assets/Illustration.svg', fit: BoxFit.contain),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 48),
            Text(
              'Добро пожаловать!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Теперь ваши финансы находятся\nв одном месте и всегда под контролем',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              height: 40,
              width: 324,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/auth'),
                child: Text(
                  'Войти',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 40,
              width: 324,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed('/auth'),
                child: Text(
                  'Зарегистрироваться',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
