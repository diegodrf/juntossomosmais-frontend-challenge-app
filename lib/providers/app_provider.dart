import 'package:flutter/foundation.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/services/JSMApi.dart';

class AppProvider extends ChangeNotifier {
  List<Member> _memberList = [];
  final JSMApi _api = JSMApi();

  get memberList => _memberList;

  AppProvider() {
    loadMembers();
  }

  Future loadMembers() async {
    print('Loading Members');
    if (_memberList.isEmpty) {
      _memberList = await _api.getAllUsers();
      notifyListeners();
    }
  }
}
