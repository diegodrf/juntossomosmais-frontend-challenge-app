import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/components/map_component.dart';
import 'package:juntossomosmais_app/constants.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/extensions/extensions.dart';

class MemberDetailsScreen extends StatelessWidget {
  static const String route = 'member_details_route';

  const MemberDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Member member = ModalRoute.of(context)?.settings.arguments as Member;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Member'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: kCardElevationDefault,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Hero(
                            tag: member.customId.toString(),
                            child: CachedNetworkImage(
                              imageUrl: member.picture.large,
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                radius: kCircleAvatarImageRadiusLarge,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (context, text) =>
                                  const CircleAvatar(
                                radius: kCircleAvatarImageRadiusLarge,
                                child: Icon(
                                  Icons.person,
                                  size: kCircleAvatarImageRadiusLarge,
                                ),
                              ),
                              errorWidget: (context, text, _) =>
                                  const CircleAvatar(
                                radius: kCircleAvatarImageRadiusLarge,
                                child: Icon(
                                  Icons.error,
                                  size: kCircleAvatarImageRadiusLarge,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              FieldValueDetails(
                                  field: 'Name',
                                  value:
                                      '${member.name.title.toCapitalized()} ${member.name.fullName}'),
                              FieldValueDetails(
                                  field: 'E-mail', value: member.email),
                              FieldValueDetails(
                                  field: 'Phone', value: member.phone),
                              FieldValueDetails(
                                  field: 'Gender',
                                  value: member.gender.toCapitalized()),
                              FieldValueDetails(
                                  field: 'City',
                                  value: member.location.city.toTitle()),
                              FieldValueDetails(
                                  field: 'State',
                                  value: member.location.state.toTitle()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  width: double.infinity,
                  child: Card(
                    elevation: kCardElevationDefault,
                    child: MapComponent(
                      latitude: member.location.coordinates.latitude,
                      longitude: member.location.coordinates.longitude,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FieldValueDetails extends StatelessWidget {
  final String field;
  final String value;
  const FieldValueDetails({Key? key, required this.field, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(horizontal: size.width * 0.10, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              field,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
