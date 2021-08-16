import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class BarrierPage extends StatefulWidget {
  const BarrierPage({Key? key}) : super(key: key);
  static const routeName = '/barrier';
  @override
  _BarrierPageState createState() => _BarrierPageState();
}

class _BarrierPageState extends State<BarrierPage> {
  bool barrierShow = false;
  bool barrierDialogShow = false;

  @override
  Widget build(BuildContext context) {
    return BarrierDialog(
      title: Text('Test'),
      content: LinearProgressIndicator(minHeight: 1),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              barrierDialogShow = false;
            });
          },
          child: Text('Cancel'),
        ),
      ],
      show: barrierDialogShow,
      child: Barrier(
        show: barrierShow,
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
                      barrierShow = true;
                    });
                    await Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        barrierShow = false;
                      });
                    });
                  },
                  child: Text('show barrier'),
                ),
                OutlinedButton(
                  onPressed: () async {
                    setState(() {
                      barrierDialogShow = true;
                    });
                  },
                  child: Text('show barrier_dialog'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
