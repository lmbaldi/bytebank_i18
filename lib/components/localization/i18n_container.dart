import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bytebank/components/container.dart';
import 'package:bytebank/http/webclients/i18_webclient.dart';
import 'package:bytebank/components/localization/i18n_cubit.dart';
import 'package:bytebank/components/localization/i18n_view.dart';

class I18nLoadingContainer extends BlocContainer {

  I18nWidgetCreator creator;
  String viewKey;

  I18nLoadingContainer({
    @required String viewKey,
    @required I18nWidgetCreator creator
  }) {
    this.creator = creator;
    this.viewKey = viewKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18nMessagesCubit>(
      create: (context) {
        final cubit = I18nMessagesCubit(this.viewKey);
        cubit.reload(I18nWebClient(this.viewKey));
        return cubit;
      },
      child: I18nLoadingView(this.creator),
    );
  }

}