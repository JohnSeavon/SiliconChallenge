import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  Function(String) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();

  bool _isComposing = false;

  void _sentMessage() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Mensagem enviada',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        duration: const Duration(milliseconds: 1500),
        width: 230,
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 24, 43, 217),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          const SizedBox(
              width: 10,
            ),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLength: 100000,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: 'Digite sua mensagem aqui'),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text);
                _sentMessage();
              },
            ),
          ),
          IconButton(
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(_controller.text);
                    _sentMessage();
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
