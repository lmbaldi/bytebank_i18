import 'package:bytebank/components/localization/i18n_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bytebank/components/error.dart';
import 'package:bytebank/components/progress/progress_view.dart';
import 'package:bytebank/components/localization/i18n_state.dart';
import 'package:bytebank/components/localization/i18n_messages.dart';

typedef Widget I18nWidgetCreator(I18nMessages messages);

class I18nLoadingView extends StatelessWidget {
  final I18nWidgetCreator _creator;

  I18nLoadingView(this._creator);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18nMessagesCubit, I18nMessagesState>(
        builder: (context, state) {
          if (state is InitI18nMessagesState ||
              state is LoadingI18nMessagesState) {
            return ProgressView(message: "Loading...");
          }
          if (state is LoadedI18nMessagesState) {
            final messages = state.messages;
            return _creator.call(messages);
          }
          return ErrorView('Erro buscando mensagens da tela');
        }
    );
  }
}


