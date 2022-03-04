import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/components/filter_component.dart';

class FiltersBlock extends StatelessWidget {
  const FiltersBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Filter(
            icon: Icons.filter_alt_outlined,
            text: 'Filter By',
            onTap: () {},
          ),
          Filter(
            icon: Icons.sort_outlined,
            text: 'Order By',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
