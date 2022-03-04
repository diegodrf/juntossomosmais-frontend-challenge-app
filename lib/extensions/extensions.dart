extension StringParsing on String {
  String toTitle() {
    final String _ = this;
    final List<String> _newString = [];
    if (_.isNotEmpty) {
      final List<String> _words = _.split(' ');
      for (var element in _words) {
        _newString.add(element.toCapitalized());
      }
      return _newString.join(' ');
    }
    return this;
  }
  String toCapitalized() {
    final String _ = this;
    String _newString = '';
    String _others = '';
    if (_.isNotEmpty) {
      final String _firstLetter = _.substring(0, 1);
      if (_.length > 1) {
        _others = substring(1);
      }
      _newString = '${_firstLetter.toUpperCase()}$_others';
    }
    return _newString;
  }
}