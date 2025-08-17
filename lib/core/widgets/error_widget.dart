import 'package:flutter/widgets.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, required this.message, this.style});
  final String message;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, style: style));
  }
}
