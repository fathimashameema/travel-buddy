import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_buddy/provider/add_place_provider.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key, required this.state});

  final AddPlaceState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black87),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_month),
          SizedBox(width: 10),
          Text(
            state.visitedDate == null
                ? "Pick visited date"
                : "Visited on : ${DateFormat.yMMMd().format(state.visitedDate!)}",
          ),
        ],
      ),
    );
  }
}
