import 'package:equatable/equatable.dart';
import '../../../auth/domain/entities/user.dart';
import 'chat.dart';

class Message extends Equatable {
  final String id;
  final Chat chat;
  final User sender;

  get receiver => chat.user1 == sender ? chat.user2 : chat.user1;

  const Message({
    required this.id,
    required this.chat,
    required this.sender,
  });

  @override
  List<Object?> get props => [id, chat, sender];
}
