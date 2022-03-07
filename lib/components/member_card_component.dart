import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/constants.dart';
import 'package:juntossomosmais_app/extensions/extensions.dart';
import 'package:juntossomosmais_app/models/member.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  const MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => print('${member.name.first} tapped!'),
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.5,
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: member.picture.medium,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: kCircleAvatarImageRadius,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, text) => const CircleAvatar(
                  radius: kCircleAvatarImageRadius,
                  child: Icon(Icons.person),
                ),
                errorWidget: (context, text, _) => const CircleAvatar(
                  radius: kCircleAvatarImageRadius,
                  child: Icon(Icons.error),
                ),
              ),
              Text(
                member.name.fullName,
                style: kMemberNameTextStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                '${member.location.streetName}, ${member.location.addressNumber}',
                style: kMemberAddressTextStyle,
                textAlign: TextAlign.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    member.location.state.toTitle(),
                    style: kMemberCityTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${member.location.city.toTitle()} CEP: ${member.location.postcode}',
                    style: kMemberCityTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
