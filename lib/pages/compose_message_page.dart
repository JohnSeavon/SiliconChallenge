import 'package:desafio_silicon/components/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ComposeMessagePage extends StatelessWidget {
  const ComposeMessagePage({Key? key}) : super(key: key);
/*class ComposeMessagePage extends StatefulWidget {
  const ComposeMessagePage({super.key});

  @override
  State<ComposeMessagePage> createState() => _ComposeMessagePageState();
}

class _ComposeMessagePageState extends State<ComposeMessagePage> {*/

  void _sendMessage(String text){
    FirebaseFirestore.instance.collection("messages").add({"text": text, "time": Timestamp.now()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 43, 217),
        title: const Text('Enviar Mensagem'),
        elevation: 0,
      ),
      body: Align(alignment: Alignment.bottomCenter,
          child: 
          TextComposer(_sendMessage),
      ),
    );
  }
}