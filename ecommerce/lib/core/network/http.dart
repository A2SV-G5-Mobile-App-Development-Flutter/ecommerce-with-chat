import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

const Map<String, String> _defaultHeaders = {
  'Content-Type': 'application/json; charset=UTF-8'
};

enum HttpMethod { post, put }

class UploadFile {
  final String key;
  final String path;

  UploadFile({
    required this.key,
    required this.path,
  });
}

class HttpResponse {
  final String reasonPhrase;
  final int statusCode;
  final String body;

  HttpResponse(
      {this.reasonPhrase = '', required this.statusCode, required this.body});
}

class HttpClient {
  final http.Client client;

  HttpClient({
    required this.client,
  });

  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));

    return HttpResponse(
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  Future<HttpResponse> post(String url, Map<String, dynamic> body) async {
    final response = await client.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: _defaultHeaders,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  Future<HttpResponse> put(String url, Map<String, dynamic> body) async {
    final response = await client.put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: _defaultHeaders,
    );

    return HttpResponse(
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  Future<HttpResponse> delete(String url) async {
    final response = await client.delete(Uri.parse(url));

    return HttpResponse(
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  Future<HttpResponse> uploadFile(
    String url,
    HttpMethod method,
    Map<String, String> body,
    List<UploadFile> files,
  ) async {
    var request =
        http.MultipartRequest(method.name.toUpperCase(), Uri.parse(url));
    request.fields.addAll(body);

    for (var file in files) {
      request.files.add(await http.MultipartFile.fromPath(
        file.key,
        file.path,
        contentType: _inferMediaType(file.path),
      ));
    }

    http.StreamedResponse streamedResponse = await request.send();

    final response = await streamedResponse.stream.bytesToString();
    return HttpResponse(
      statusCode: streamedResponse.statusCode,
      body: response,
      reasonPhrase: streamedResponse.reasonPhrase ?? '',
    );
  }

  MediaType _inferMediaType(String path) {
    if (path.endsWith('.jpg') || path.endsWith('.jpeg')) {
      return MediaType('image', 'jpeg');
    } else if (path.endsWith('.png')) {
      return MediaType('image', 'png');
    } else if (path.endsWith('.gif')) {
      return MediaType('image', 'gif');
    } else {
      return MediaType('image', 'jpeg');
    }
  }
}
