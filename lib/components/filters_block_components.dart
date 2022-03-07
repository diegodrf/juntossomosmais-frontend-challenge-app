import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/components/filter_by_states_component.dart';
import 'package:juntossomosmais_app/components/filter_component.dart';
import 'package:juntossomosmais_app/components/order_by_component.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

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
            icon: Provider.of<AppProvider>(context).hasFilteredStates
                ? Icons.filter_alt
                : Icons.filter_alt_outlined,
            text: 'Filter By',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const FilterByStatesComponent();
                },
              );
            },
          ),
          Filter(
            icon: Icons.sort_outlined,
            text: 'Order By',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const OrderBy();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
