import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseState<T extends StatefulWidget, G extends Cubit>
    extends State<T> {
  @protected
  late G cubit;
}
