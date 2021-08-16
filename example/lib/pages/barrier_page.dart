import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class BarrierPage extends StatefulWidget {
  const BarrierPage({Key? key}) : super(key: key);
  static const routeName = '/barrier';
  @override
  _BarrierPageState createState() => _BarrierPageState();
}

class _BarrierPageState extends State<BarrierPage> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Barrier(
      show: show,
      useBoxIndicator: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(runtimeType.toString()),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: () async {
                  setState(() {
                    show = true;
                  });
                  await Future.delayed(const Duration(seconds: 3));
                  setState(() {
                    show = false;
                  });
                },
                child: Text('show'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
