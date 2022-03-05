import 'package:flutter/foundation.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/services/JSMApi.dart';

class AppProvider extends ChangeNotifier {
  List<Member> _memberList = [];
  final Set<String> _filteredStates = {};
  final Set<String> _allMemberStates = {};
  final JSMApi _api = JSMApi();

  List<Member> get memberList {
    if (_filteredStates.isNotEmpty) {
      return _memberList
          .where((element) => _filteredStates.contains(element.location.state))
          .toList();
    }
    return _memberList;
  }

  List<String> get allMemberStates {
    final List<String> _ = _allMemberStates.toList();
    _.sort();
    return _;
  }

  AppProvider() {
    loadMembers();
  }

  void forceReload() => notifyListeners();

  Future loadMembers() async {
    _memberList = await _api.getAllUsers();
    notifyListeners();
    _loadMemberStates();
  }

  Future _loadMemberStates() async {
    for (var element in _memberList) {
      _allMemberStates.add(element.location.state);
      notifyListeners();
    }
  }

  void addStateToFilteredList(String stateName) =>
      _filteredStates.add(stateName);

  void removeStatefromFilteredList(String stateName) =>
      _filteredStates.removeWhere((element) => element == stateName);

  bool verifyIfStateIsInFilterList(String stateName) {
    return _filteredStates.contains(stateName);
  }

  void sortMembersByNameAsc() {
    _memberList.sort((a, b) => a.name.fullName.compareTo(b.name.fullName));
    notifyListeners();
  }

  void sortMembersByNameDesc() {
    _memberList.sort((a, b) => a.name.fullName.compareTo(b.name.fullName));
    _memberList = _memberList.reversed.toList();
    notifyListeners();
  }
}
