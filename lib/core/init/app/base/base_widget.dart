import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseView<T> extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    T value,
  ) onPageBuilder;
  final T viewModel;
  T? viewModel2;
  final Function(T model) onModelReady;

  final VoidCallback? onDispose;

  BaseView(
      {Key? key,
      required this.viewModel,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose,
      this.viewModel2,
      required})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
