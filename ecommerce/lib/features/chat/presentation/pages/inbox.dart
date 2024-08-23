import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/snackbar.dart';
import '../../domain/entities/chat.dart';
import '../bloc/message/message_bloc.dart';

import '../widgets/message_card.dart';

class ChatInboxPage extends StatelessWidget {
  final Chat chat;
  const ChatInboxPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    context.read<MessageBloc>().add(MessageLoadRequested(chat));

    return BlocListener<MessageBloc, MessageState>(
      listener: (context, state) {
        if (state is MessageLoadFailure) {
          showError(context, 'Loading failed');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox ${chat.user1.name} <> ${chat.user2.name}'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Column(
              children: [
                // Message List
                Expanded(
                  child: BlocBuilder<MessageBloc, MessageState>(
                    builder: (context, state) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<MessageBloc>()
                              .add(MessageLoadRequested(chat));
                        },
                        child: ListView.builder(
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];

                            return MessageCard(
                              message: message,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Message Input
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
