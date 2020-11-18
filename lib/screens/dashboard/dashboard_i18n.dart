import 'package:bytebank/components/localization/i18n_messages.dart';

class DashboardViewLazyI18n {

  final I18nMessages _messages;

  DashboardViewLazyI18n(this._messages);

  String get transfer => _messages.get("transfer");

  String get transactionFeed => _messages.get("transaction_feed");

  String get changeName => _messages.get("change_name");

}