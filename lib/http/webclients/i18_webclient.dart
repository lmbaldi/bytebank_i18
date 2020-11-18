import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

const  MESSAGES_URI =
    "https://gist.githubusercontent.com/lmbaldi/012a3dc4a402ae519a06c98eeb141fbf/raw/306ca65aa4dbfb50eea7b1226f2c8ac7a54df4d8/";

class I18nWebClient {
  final String viewKey;

  I18nWebClient(this.viewKey);

  Future<Map<String, dynamic>> findAll() async {

    final Response response = await client.get("$MESSAGES_URI$viewKey.json",headers: {
      'Content-type': 'application/json',
    });
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
