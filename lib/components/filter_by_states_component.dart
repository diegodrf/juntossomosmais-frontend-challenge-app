import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class FilterByStatesComponent extends StatefulWidget {
  const FilterByStatesComponent({Key? key}) : super(key: key);

  @override
  State<FilterByStatesComponent> createState() =>
      _FilterByStatesComponentState();
}

class _FilterByStatesComponentState extends State<FilterByStatesComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.allMemberStates.length,
                itemBuilder: (context, index) {
                  final String stateName = provider.allMemberStates[index];
                  bool checked =
                      provider.verifyIfStateIsInFilterList(stateName);
                  return ListTile(
                    leading: Checkbox(
                      value: checked,
                      onChanged: (value) {
                        if (checked == false) {
                          provider.addStateToFilteredList(stateName);
                        } else {
                          provider.removeStatefromFilteredList(stateName);
                        }
                        setState(() {});
                      },
                    ),
                    title: Text(stateName),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                provider.forceReload();
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}
