import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:bytebank/http/webclients/i18_webclient.dart';
import 'package:bytebank/components/localization/i18n_state.dart';
import 'package:bytebank/components/localization/i18n_messages.dart';

class I18nMessagesCubit extends Cubit<I18nMessagesState> {
  final LocalStorage storage = new LocalStorage(
      'local_unsecure_version_1.json');
  final String _viewKey;

  I18nMessagesCubit(this._viewKey) : super(InitI18nMessagesState());

  reload(I18nWebClient client) async {
    emit(LoadingI18nMessagesState());
    await storage.ready;
    final items = storage.getItem(_viewKey);
    if (items != null) {
      emit(LoadedI18nMessagesState(I18nMessages(items)));
      return;
    }
    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(_viewKey, messages);
    final state = LoadedI18nMessagesState(I18nMessages(messages));
    emit(state);
  }

}