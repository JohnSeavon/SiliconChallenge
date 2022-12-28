import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SentMessagesPage extends StatelessWidget {
  const SentMessagesPage({Key? key}) : super(key: key);

  Stream<QuerySnapshot> _getList() {
    return FirebaseFirestore.instance.collection('messages').orderBy('time', descending: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 43, 217),
        title: const Text('Mensagens enviadas'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _getList(),
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('Não há mensagens enviadas'),
                  );
                }
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    final DocumentSnapshot doc = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(doc['text']),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                );
            }
          },
        ),
      ),
    );
  }
}
