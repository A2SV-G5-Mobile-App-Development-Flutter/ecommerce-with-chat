import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // box
              Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Greetings
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('July 14, 2024',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text('Hello, ',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('John!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),

          // Notification
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
