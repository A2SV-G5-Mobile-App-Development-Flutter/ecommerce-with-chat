import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat.dart';
import '../../../domain/entities/message.dart';
import '../../../domain/usecases/get_chat_messages.dart';
import '../../../domain/usecases/send_message.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetChatMessages getChatMessages;
  final SendMessage sendMessage;

  MessageBloc({
    required this.getChatMessages,
    required this.sendMessage,
  }) : super(const MessageInitial([])) {
    on<MessageLoadRequested>(_onLoadMessageRequested,
        transformer: restartable());
  }

  Future<void> _onLoadMessageRequested(
      MessageLoadRequested event, Emitter<MessageState> emit) async {
    emit(const MessagesMessageLoadInProgress([]));

    final messages =
        await getChatMessages(GetChatMessagesParams(event.chat.id));

    await emit.forEach(messages, onData: (data) {
      final result = data.fold((l) {
        return MessageLoadFailure([...state.messages]);
      }, (r) {
        print('[debug] ${state.messages.map((e) => e.id)}');
        print('[debug] ${r.id}');
        print(
            '[debug] ${state.messages.map((e) => e.id).contains(r.id)} ${state.messages.length}');
        print('[debug]');
        return MessageLoadSuccess([...state.messages, r]);
      });

      return result;
    });
  }
}
