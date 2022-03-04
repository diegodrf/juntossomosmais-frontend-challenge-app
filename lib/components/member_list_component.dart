import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/components/member_card_component.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class MemberList extends StatelessWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context).loadMembers();
    final List<Member> memberList =
        Provider.of<AppProvider>(context).memberList;
    return Container(
      height: 100.0,
      width: 100.0,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [for (final Member m in memberList) MemberCard(member: m)],
      ),
    );
  }
}
