import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class FilterChipWidget extends StatefulWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({
    Key? key,
    required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected; // Toggle selection
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.selectedItems : AppColors.items,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            widget.label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}