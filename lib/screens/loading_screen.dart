import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.purpleAccent,
      child: Center(
        child: SpinKitDualRing(size: 50, color: Colors.green),
      ),
    );
  }
}
