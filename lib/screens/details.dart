import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> selectedItem; // The item to display details for

  DetailsPage({required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location: ${selectedItem['location']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Timestamp: ${selectedItem['timestamp']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'PM 2.5 Value: ${selectedItem['pm25']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'PM 2.5 Remarks: ${selectedItem['pm25remarks']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'PM 10 Value: ${selectedItem['pm10']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'PM 10 Remarks: ${selectedItem['pm10remarks']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16, // Adjust the position as needed
            right: 16, // Adjust the position as needed
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Handle the "X" button press here, e.g., navigate back
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
