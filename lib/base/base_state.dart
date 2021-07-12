import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseState<T extends StatefulWidget, G extends Cubit<S>, S>
    extends State<T> {
  @protected
  late G cubit;

  Widget builder(BuildContext context, S state);

  void listener(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<G, S>(
        builder: builder,
        listener: listener,
      ),
    );
  }
}
