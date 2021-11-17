import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  //olsuturan her sınıf mobxden turuyecek
  final T viewModel;
  final Function(T viewModel) onModelReady;
  final Function(T viewModel)? onDispose;
  final Widget Function(BuildContext context, T viewModel) onPageBuilder;

  const BaseView({Key? key, required this.viewModel, required this.onModelReady, this.onDispose, required this.onPageBuilder}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    widget.onModelReady(viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, viewModel);
  }
}
