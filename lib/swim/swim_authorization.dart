import 'package:dio/dio.dart';

import 'swim_funcii.dart';

Future<String?> swimAuthorization({
  required String addPath,
  required String l,
  required String p,
}) async {
  final swimIsConnected = await swimIsInternetConnected();
  if (swimIsConnected) {
    try {
      final serverAuthKeyResponse = await Dio().post(
        addPath,
        data: {"username": l, "password": p},
      );
      if (serverAuthKeyResponse.data != null) {
        return serverAuthKeyResponse.data['access'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  return null;
}
