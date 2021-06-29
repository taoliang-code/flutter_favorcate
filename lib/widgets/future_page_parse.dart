import 'package:flutter/material.dart';

class FuturePageParse extends StatelessWidget {
  final PageStatus status;
  final Widget child;
  const FuturePageParse({
    Key? key,
    required this.status,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case PageStatus.error:
        return Text('网络错误，请检查网络状况');
      case PageStatus.wait:
        return Center(
          child: CircularProgressIndicator(),
        );
      case PageStatus.success:
        return child;
    }
  }
}

enum PageStatus { error, wait, success }
