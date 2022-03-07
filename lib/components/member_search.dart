import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class MemberSearch extends StatelessWidget {
  MemberSearch({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text =
        Provider.of<AppProvider>(context, listen: false).nameFilter;
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.name,
      onChanged: (newText) {
        Provider.of<AppProvider>(context, listen: false).filterByName(newText);
      },
      autofocus: true,
    );
  }
}
