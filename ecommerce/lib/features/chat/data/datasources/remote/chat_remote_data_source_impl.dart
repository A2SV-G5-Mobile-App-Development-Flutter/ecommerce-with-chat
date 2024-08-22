import 'dart:convert';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/network/http.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../models/chat_model.dart';
import '../../models/message_model.dart';
import 'chat_remote_data_source.dart';

class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final HttpClient client;
  final String _baseUrl;

  ChatRemoteDataSourceImpl({
    required this.client,
  }) : _baseUrl = '$baseUrl/chats';

  @override
  Future<void> deleteChat(String id) async {
    try {
      final response = await client.delete('$_baseUrl/$id');

      if (response.statusCode != 200) {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Stream<MessageModel> getChatMessages(String id) {
    // TODO: implement getChatMessages
    throw UnimplementedError();
  }

  @override
  Future<ChatModel> getOrCreateChat(UserModel receiver) async {
    try {
      final response = await client.post(_baseUrl, {
        'userId': receiver.id,
      });

      if (response.statusCode == 200) {
        return ChatModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ChatModel>> getUserChats() async {
    try {
      final response = await client.get(_baseUrl);

      if (response.statusCode == 200) {
        final List<dynamic> chats = jsonDecode(response.body)['data'];
        return chats.map((e) => ChatModel.fromJson(e)).toList();
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<MessageModel> sendMessage(String chat, String message, String type) {
    throw UnimplementedError();
  }
}
