import 'package:flutter/material.dart';
import 'package:tsuruo_kit/widgets/widgets.dart';

class BarrierPage extends StatefulWidget {
  const BarrierPage({super.key});
  static const routeName = '/barrier';

  @override
  State<BarrierPage> createState() => _BarrierPageState();
}

class _BarrierPageState extends State<BarrierPage> {
  bool barrierShow = false;
  bool barrierDialogShow = false;

  @override
  Widget build(BuildContext context) {
    return BarrierDialog(
      title: const Text('Test'),
      content: const LinearProgressIndicator(minHeight: 1),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              barrierDialogShow = false;
            });
          },
          child: const Text('Cancel'),
        ),
      ],
      show: barrierDialogShow,
      child: ProgressBarrier(
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
                  child: const Text('show barrier'),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      barrierDialogShow = true;
                    });
                  },
                  child: const Text('show barrier_dialog'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
