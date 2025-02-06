import 'package:flutter/material.dart';

class Chatcontainer extends StatefulWidget {
  final String img;
  final String text;
  final String name;
  final VoidCallback function;
  final String type;
  const Chatcontainer(
      {super.key,
      required this.img,
      required this.text,
      required this.name,
      required this.function,
      required this.type});

  @override
  State<Chatcontainer> createState() => _ChatcontainerState();
}

class _ChatcontainerState extends State<Chatcontainer> {
  @override
  Widget build(BuildContext context) {
    bool isReceive = widget.type == 'receive';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              widget.img.isNotEmpty ? widget.img : 'assets/img/mohan.jpg',
            ),
            radius: 12,
          ),
          const SizedBox(width: 5),

          // Message container with triangle shape at the top left
          Expanded(
            child: Stack(
              children: [
                // Message container
                Container(
                  margin: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 1, right: isReceive ? 1 : 0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: isReceive
                            ? Colors.white
                            : Theme.of(context).colorScheme.secondary,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sender's name
                          Text(
                            !isReceive
                                ? "You"
                                : widget.name.isNotEmpty
                                    ? widget.name
                                    : 'Unknown',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Message text
                          Text(
                            widget.text.isNotEmpty
                                ? widget.text
                                : 'No message available',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '10:00 AM',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.reply,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  if (isReceive)
                                    GestureDetector(
                                      onTap: widget.function,
                                      child: Icon(
                                        Icons.message,
                                        color: Colors.black,
                                      ),
                                    ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Triangle shape at the top-left corner
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomPaint(
                    size: const Size(20, 20),
                    painter: TrianglePainter(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the triangle shape
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5) // Triangle color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 8); // Top-left corner
    path.lineTo(8, 8); // Top-right corner
    path.lineTo(8, size.height); // Bottom-left corner
    path.close(); // Connects back to the top-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
