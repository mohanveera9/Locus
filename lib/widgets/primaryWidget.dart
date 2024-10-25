import 'package:flutter/material.dart';

class Primarywidget extends StatefulWidget {
  final String img;
  final String name;
  final String lmsg;
  final VoidCallback function;
  const Primarywidget({
    super.key,
    required this.img,
    required this.name,
    required this.lmsg,
    required this.function,
  });

  @override
  State<Primarywidget> createState() => _PrimarywidgetState();
}

class _PrimarywidgetState extends State<Primarywidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.function,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(widget.img),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      child: Container(
                        child: Center(
                          child: Text('2'),
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.lmsg,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(155, 155, 155, 1),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '1h ago.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(70, 70, 70, 1),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black.withOpacity(0.6),
            size: 30,
          )
        ],
      ),
    );
  }
}