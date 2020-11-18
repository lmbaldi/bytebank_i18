import 'package:bytebank/components/localization/locale.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewI18n {
  String _language;
  ViewI18n(BuildContext context) {
    this._language = BlocProvider
        .of<CurrentLocaleCubit>(context)
        .state;
  }

  String localize(Map<String, String> values) {
    assert(values != null);
    assert(values.containsKey(_language));
    return values[_language];
  }
}