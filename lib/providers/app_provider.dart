import 'package:flutter/foundation.dart';
import 'package:juntossomosmais_app/models/member.dart';
import 'package:juntossomosmais_app/services/JSMApi.dart';

class AppProvider extends ChangeNotifier {
  List<Member> _memberList = [];
  String _nameFilter = '';
  final Set<String> _filteredStates = {};
  final Set<String> _allMemberStates = {};
  final JSMApi _api = JSMApi();

  AppProvider() {
    loadMembers();
  }

  String get nameFilter => _nameFilter;
  bool get hasFilteredStates => _filteredStates.isNotEmpty;

  List<Member> get memberList =>
      _applyNameFilter(_applyLocationFilter(_memberList));

  List<Member> _applyNameFilter(List<Member> members) {
    return members.where(
      (element) {
        return _nameFilter.isEmpty
            ? true
            : element.name.fullName.toLowerCase().startsWith(_nameFilter);
      },
    ).toList();
  }

  List<Member> _applyLocationFilter(List<Member> members) {
    return members.where(
      (element) {
        return _filteredStates.isEmpty
            ? true
            : _filteredStates.contains(element.location.state);
      },
    ).toList();
  }

  void filterByName(String name) {
    _nameFilter = name;
    notifyListeners();
  }

  List<String> get allMemberStates {
    final List<String> _ = _allMemberStates.toList();
    _.sort();
    return _;
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
