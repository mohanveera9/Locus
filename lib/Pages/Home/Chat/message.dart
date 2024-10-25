import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Chat/chat.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkTextField);
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _controller.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Chat(),
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Theme.of(context).colorScheme.secondary;
                        }
                        return Theme.of(context).colorScheme.primary;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: _controller,
                minLines: 7,
                maxLines: 9,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Send Message..',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
