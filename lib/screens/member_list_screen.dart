import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juntossomosmais_app/components/filters_block_components.dart';
import 'package:juntossomosmais_app/components/member_list_component.dart';
import 'package:juntossomosmais_app/components/member_search.dart';
import 'package:juntossomosmais_app/constants.dart';

class MemberListScreen extends StatefulWidget {
  static const String router = 'member_list_screen';

  const MemberListScreen({Key? key}) : super(key: key);

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  bool nameFilterVisibility = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SvgPicture.asset(kLogoImagePath),
          ),
          leadingWidth: kLogoWidth,
          title: const Text('Member List'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  nameFilterVisibility = !nameFilterVisibility;
                });
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Visibility(
                visible: nameFilterVisibility,
                child: MemberSearch(),
              ),
              const FiltersBlock(),
              const Divider(),
              const MemberList(),
            ],
          ),
        ),
      ),
    );
  }
}
