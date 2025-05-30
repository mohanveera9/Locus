import 'package:flutter/material.dart';

class CustomDropdownInput extends StatefulWidget {
  final String label;
  final List<String> options;
  final void Function(String) onChanged;
  final String? initialValue;
  final double width;
  final String? errorText;

  const CustomDropdownInput({
    super.key,
    required this.label,
    required this.options,
    required this.onChanged,
    this.initialValue,
    this.width = 300,
    this.errorText,
  });

  @override
  State<CustomDropdownInput> createState() => _CustomDropdownInputState();
}

class _CustomDropdownInputState extends State<CustomDropdownInput> {
  late String? selectedValue;
  bool showDropdown = false;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  void _toggleDropdown() {
    setState(() {
      showDropdown = !showDropdown;
    });
  }

  void _selectOption(String value) {
    setState(() {
      selectedValue = value;
      showDropdown = false;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            width: widget.width,
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const Icon(Icons.person, color: Color(0xFF696767)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedValue ?? widget.label,
                    style: TextStyle(
                      fontFamily: 'CrimsonText-Bold',
                      fontSize: 18,
                      color: selectedValue == null ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                Icon(
                  showDropdown ? Icons.expand_less : Icons.expand_more,
                  color: theme.tertiary,
                ),
              ],
            ),
          ),
        ),
        if (showDropdown)
          Container(
            width: widget.width,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Column(
              children: widget.options.map((option) {
                return ListTile(
                  title: Text(
                    option,
                    style: TextStyle(
                      fontFamily: 'CrimsonText-Bold',
                      fontSize: 18,
                      color: theme.tertiary,
                    ),
                  ),
                  onTap: () => _selectOption(option),
                );
              }).toList(),
            ),
          ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 6),
            child: Text(
              widget.errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
      ],
    );
  }
}
