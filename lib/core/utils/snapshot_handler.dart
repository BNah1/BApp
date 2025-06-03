import 'package:bapp/core/screen/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureBuilderHandler<T> extends StatelessWidget {
  const FutureBuilderHandler({super.key, required this.future, this.condition, required this.builder});

  final Future<T> future;
  final bool Function(T data)? condition;
  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Loader();
      }
      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
      }

      final data = snapshot.data as T;
      if (data != null && !condition!(data)){
        return  const SizedBox.shrink();
      }
      return builder(data);
    });
  }
}



class AsyncValueHandler<T> extends StatelessWidget {
  const AsyncValueHandler({
    super.key,
    required this.state,
    this.condition,
    required this.builder,
  });

  final AsyncValue<T> state;
  final bool Function(T data)? condition;
  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return state.when(
      data: (data) {
        if (condition != null && !condition!(data)) {
          return const SizedBox.shrink();
        }
        return builder(data);
      },
      loading: () => const Loader(),
      error: (e, _) => Center(
        child: Text('Error: $e', style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
