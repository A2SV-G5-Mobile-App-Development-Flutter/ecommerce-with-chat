import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../auth/domain/entities/user.dart';
import '../entities/chat.dart';
import '../entities/message.dart';

abstract class ChatRepository {
  Stream<Either<Failure, Message>> getChatMessages(String id);

  Future<Either<Failure, List<Chat>>> getUserChats();
  Future<Either<Failure, Chat>> getOrCreateChat(User receiver);
  Future<Either<Failure, Unit>> deleteChat(String id);
  Future<Either<Failure, Message>> sendMessage(
      String chatId, String message, String type);
}