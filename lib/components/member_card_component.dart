import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/constants.dart';
import 'package:juntossomosmais_app/extensions/extensions.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/screens/member_details.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  const MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        MemberDetailsScreen.route,
        arguments: member,
      ),
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.5,
        child: Card(
          elevation: kCardElevationDefault,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: member.customId.toString(),
                child: CachedNetworkImage(
                  imageUrl: member.picture.medium,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: kCircleAvatarImageRadiusMedium,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, text) => const CircleAvatar(
                    radius: kCircleAvatarImageRadiusMedium,
                    child: Icon(
                      Icons.person,
                      size: kCircleAvatarImageRadiusMedium,
                    ),
                  ),
                  errorWidget: (context, text, _) => const CircleAvatar(
                    radius: kCircleAvatarImageRadiusMedium,
                    child: Icon(
                      Icons.error,
                      size: kCircleAvatarImageRadiusMedium,
                    ),
                  ),
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
