import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/message.dart';
import '../repositories/chat_repository.dart';

class GetMyChat implements UseCase<List<Message>, GetChatMessagesParams> {
  final ChatRepository repository;

  const GetMyChat(this.repository);

  @override
  Future<Either<Failure, List<Message>>> call(
      GetChatMessagesParams params) async {
    return await repository.getChatMessages(params.id);
  }
}

class GetChatMessagesParams extends Equatable {
  final String id;

  const GetChatMessagesParams(this.id);

  @override
  List<Object?> get props => [id];
}
