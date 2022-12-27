import 'package:flutter/material.dart';
import 'package:desafio_silicon/pages/compose_message_page.dart';
import 'package:desafio_silicon/pages/sent_messages_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 43, 217),
        title: const Text('Silicon App Challenge'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ComposeMessagePage())));
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 24, 43, 217),
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'Enviar mensagem',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SentMessagesPage())));
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 24, 43, 217),
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'Exibir mensagens',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
