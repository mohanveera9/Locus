import 'package:flutter/material.dart';


class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;
  final int _maxChars = 300;
  bool isSending = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkTextField);
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _controller.text.trim().isNotEmpty && _controller.text.length <= _maxChars ;
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, size: 30),
                ),
                Row(
                  children: [
                    Text(
                      '${_controller.text.length}/${_maxChars}'
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: _isButtonEnabled && !isSending ? null : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => _isButtonEnabled
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary.withOpacity(0.8),
                        ),
                      ),
                      child: isSending
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                    ),
                   
                    
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _controller,
                    maxLength: _maxChars,
                    minLines: 7,
                    maxLines: 9,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Send Message..',
                      hintStyle: TextStyle(color: Colors.grey),
                      counterText: "", // Hide default counter
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
