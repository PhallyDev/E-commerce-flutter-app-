import 'dart:async';
import 'dart:io';

import 'package:ecommerce_fakeapi/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('normalizes slashes in the base URL and endpoint', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final requestUri = Completer<Uri>();
    server.listen((request) async {
      requestUri.complete(request.uri);
      request.response
        ..statusCode = HttpStatus.ok
        ..write('{"ok":true}');
      await request.response.close();
    });

    final service = ApiService(
      baseUrl: 'http://127.0.0.1:${server.port}/',
    );

    try {
      await service.callApi<Map<String, dynamic>>(
        endpoint: '/products',
        fromJson: (json) => json,
      );

      expect((await requestUri.future).path, '/products');
    } finally {
      service.closeClient();
      await server.close(force: true);
    }
  });
}
