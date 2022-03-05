import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/components/member_card_component.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class MemberList extends StatelessWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: provider.memberList.length,
            itemBuilder: (context, index) {
              final Member member = provider.memberList[index];
              return MemberCard(member: member);
            },
          ),
        );
      },
    );
  }
}
