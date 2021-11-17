import 'package:flutter/material.dart';
import 'package:tekrar/core/extension/context_extension.dart';

class BuildCardHeader extends StatelessWidget {
  final BuildContext context;
  final List<Widget> array;
  final String title;

  const BuildCardHeader({Key? key, required this.context, required this.array, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              " $title",
              style: context.textThem.headline6!.copyWith(color: Colors.black),
            ),
          ),
          Divider(),
          ...array
        ],
      ),
    );
  }
}
