
class I18nMessages {
  final Map<String, dynamic> _messages;

  I18nMessages(this._messages);

  String get(String key) {
    assert(key != null);
    assert(_messages.containsKey(key));
    return _messages[key];
  }
}