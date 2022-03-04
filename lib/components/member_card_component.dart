import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/models/member.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  const MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: member.picture.thumbnail,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
              );
            },
            placeholder: (context, text) {
              return const CircleAvatar(
                child: Icon(Icons.person),
              );
            },
          ),
        ],
      ),
    );
  }
}
