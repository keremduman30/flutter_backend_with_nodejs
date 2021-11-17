import 'package:flutter/material.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';

class AlertDialogWidget extends StatelessWidget {
  final TextEditingController postTitle;
  final TextEditingController postBody;
  final List<Widget> array;

  const AlertDialogWidget({Key? key, required this.postTitle, required this.postBody, required this.array}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Guncelle"),
      // content: Text("Guncellerinizi guncelleyebilrsiniz"),
      actions: [...array],
    );
  }
}
