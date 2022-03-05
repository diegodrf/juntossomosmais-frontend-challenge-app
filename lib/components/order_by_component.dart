import 'package:flutter/material.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class OrderBy extends StatelessWidget {
  const OrderBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: ListView(
        children: [
          ElevatedButton(
            child: const Text('Name ASC'),
            onPressed: () {
              Provider.of<AppProvider>(context, listen: false)
                  .sortMembersByNameAsc();
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            child: const Text('Name DESC'),
            onPressed: () {
              Provider.of<AppProvider>(context, listen: false)
                  .sortMembersByNameDesc();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
