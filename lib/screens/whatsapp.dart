// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class WhatsappScreen extends StatelessWidget {
  WhatsappScreen({Key? key}) : super(key: key);

  var faker = Faker();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Whatsapp"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("New Group"),
                  value: "New Group",
                ),
                PopupMenuItem(
                  child: Text("New Broadcast"),
                  value: "New Broadcast",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred Message"),
                  value: "Starred Message",
                ),
              ],
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("CAMERA"),
            ),
            ChatScreen(),
            Center(
              child: Text("CAMERA"),
            ),
            Center(
              child: Text("CAMERA"),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectContact(),
              ),
            );
          },
          child: Icon(Icons.message),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage("https://picsum.photos/id/${index + 10}/500/500"),
        ),
        title: Text(faker.person.name()),
        subtitle: Text(
          faker.lorem.sentence(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text("03:34 PM"),
      ),
    );
  }
}

class SelectContact extends StatelessWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "923 contacts",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white60,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("New Group"),
                value: "New Group",
              ),
              PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New Broadcast",
              ),
              PopupMenuItem(
                child: Text("Whatsapp Web"),
                value: "Whatsapp Web",
              ),
              PopupMenuItem(
                child: Text("Starred Message"),
                value: "Starred Message",
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 5,
              ),
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.teal,
                child: Icon(Icons.people),
              ),
              title: Text(
                "New Group",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 1) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.teal,
                child: Icon(Icons.person_add),
              ),
              title: Text(
                "New Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.qr_code),
              ),
            );
          } else {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 5,
              ),
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage("https://picsum.photos/id/${index + 10}/500/500"),
              ),
              title: Text(
                faker.person.name(),
              ),
            );
          }
        },
      ),
    );
  }
}
