part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class MessageLoadRequested extends MessageEvent {
  final Chat chat;

  const MessageLoadRequested(this.chat);
}
