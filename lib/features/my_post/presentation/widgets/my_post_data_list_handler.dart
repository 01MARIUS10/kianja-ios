import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';

class MyPostDataListHandler<T> extends StatelessWidget {
  const MyPostDataListHandler({
    super.key,
    required this.isLoading,
    required this.data,
    required this.error,
    required this.onRetry,
    required this.builder,
  });
  final bool isLoading;
  final List<T>? data;
  final String? error;
  final VoidCallback onRetry;
  final Widget Function(List<T> data) builder;

  @override
  Widget build(BuildContext context) {
    if (isLoading && data == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error != null && data == null) {
      final message = error!.toLowerCase();
      if (message.contains('connection') ||
          message.contains('network') ||
          message.contains('socket')) {
        return NoConnectionScreen(onRetry: onRetry);
      }
      return ServerFailureScreen(onRetry: onRetry, message: error);
    }
    if (data != null) {
      return builder(data!);
    }
    return const Center(child: CircularProgressIndicator());
  }
}
