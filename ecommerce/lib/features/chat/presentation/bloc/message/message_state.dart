part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  final List<Message> messages;

  const MessageState(this.messages);

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {
  const MessageInitial(super.messages);

  @override
  List<Object> get props => [messages];
}

class MessagesMessageLoadInProgress extends MessageState {
  const MessagesMessageLoadInProgress(super.messages);
}

class MessageLoadSuccess extends MessageState {
  const MessageLoadSuccess(super.messages);

  @override
  List<Object> get props => [messages];
}

class MessageLoadFailure extends MessageState {
  const MessageLoadFailure(super.messages);

  @override
  List<Object> get props => [messages];
}

class MessageReceived extends MessageState {
  const MessageReceived(super.messages);

  @override
  List<Object> get props => [messages];
}
