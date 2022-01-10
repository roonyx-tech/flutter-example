import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
abstract class BaseStatelessWidget<T extends Cubit<S>, S>
    extends StatelessWidget {
  late T cubit;

  Widget builder(BuildContext context, S state);

  void listener(BuildContext context, S state);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => cubit,
        child: BlocConsumer<T, S>(builder: builder, listener: listener),
      );
}
