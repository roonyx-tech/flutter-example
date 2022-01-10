
import 'package:e_shop_flutter/core/di/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state_mixins.dart';

abstract class BaseState<T extends StatefulWidget, G extends Cubit<S>, S>
    extends State<T> {
  @protected
  late G cubit;

  void Function(G cubit)? _onCubitCreated;
  final bool Function(S, S)? _buildWhen;
  final bool Function(S, S)? _listenWhen;

  final bool _shouldProvide;

  static bool _defaultBuildWhen(p, c) => c is StateForBuilder;
  static bool _defaultListenWhen(p, c) => c is StateForListener;

  BaseState({
    void Function(G cubit)? onCubitCreated,
    bool Function(S, S)? buildWhen,
    bool Function(S, S)? listenWhen,
  })  : cubit = getIt.get<G>(),
        _onCubitCreated = onCubitCreated,
        _shouldProvide = true,
        _buildWhen = buildWhen,
        _listenWhen = listenWhen,
        super();

  BaseState.when({
    void Function(G cubit)? onCubitCreated,
  })  : cubit = getIt.get<G>(),
        _onCubitCreated = onCubitCreated,
        _shouldProvide = true,
        _buildWhen = _defaultBuildWhen,
        _listenWhen = _defaultListenWhen,
        super();

  BaseState.empty({
    bool shouldProvide = false,
    bool Function(S, S)? buildWhen,
    bool Function(S, S)? listenWhen,
  })  : _shouldProvide = shouldProvide,
        _buildWhen = buildWhen,
        _listenWhen = listenWhen,
        super();

  BaseState.withParams({
    dynamic param1,
    dynamic param2,
    bool Function(S, S)? buildWhen,
    bool Function(S, S)? listenWhen,
  })  : _shouldProvide = true,
        cubit = getIt.get<G>(param1: param1, param2: param2),
        _buildWhen = buildWhen,
        _listenWhen = listenWhen,
        super();

  @override
  void didChangeDependencies() {
    try {
      // ignore: unnecessary_statements
      cubit;
    } catch (e) {
      throw 'At first you need init the cubit in [initState], [didChangeDependencies] or in [getIt]';
    }
    super.didChangeDependencies();
  }

  Widget builder(BuildContext context, S state);

  void listener(BuildContext context, S state) {}

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final consumer = BlocConsumer<G, S>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: builder,
      listener: listener,
    );
    return _shouldProvide
        ? BlocProvider(
            lazy: false,
            create: (context) {
              _onCubitCreated?.call(cubit);
              return cubit;
            },
            child: consumer,
          )
        : consumer;
  }
}
