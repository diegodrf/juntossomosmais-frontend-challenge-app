import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/components/filters_block_components.dart';
import 'package:juntossomosmais_app/components/member_list_component.dart';

class MemberListScreen extends StatelessWidget {
  static const String router = 'member_list_screen';

  const MemberListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Member List'),
          centerTitle: true,
        ),
        body: Column(
          children: const [
            FiltersBlock(),
            Divider(),
            MemberList(),
          ],
        ),
      ),
    );
  }
}
