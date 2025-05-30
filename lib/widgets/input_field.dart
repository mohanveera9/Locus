import 'package:flutter/material.dart';

class InputFields extends StatefulWidget {
  final Icon icon;
  final String hinttext;
  final Widget? suffixicon;
  final bool isPassword;
  final String? errorText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const InputFields({
    super.key,
    required this.icon,
    required this.hinttext,
    this.suffixicon,
    this.isPassword = false,
    this.errorText,
    this.controller,
    this.onChanged,
  });

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: SizedBox(
            width: 300,
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscureText : false,
              onChanged: widget.onChanged,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'CrimsonText-Bold',
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hinttext,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                prefixIcon: widget.icon,
                prefixIconColor: Theme.of(context).colorScheme.tertiary,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        color: Theme.of(context).colorScheme.tertiary,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : widget.suffixicon,
                suffixIconColor: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
