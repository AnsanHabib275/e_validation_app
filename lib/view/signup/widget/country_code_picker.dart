import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:flutter/material.dart';

class CountryCodePickerScreen extends StatefulWidget {
  @override
  _CountryCodePickerScreenState createState() =>
      _CountryCodePickerScreenState();
}

class _CountryCodePickerScreenState extends State<CountryCodePickerScreen> {
  String _selectedCountryCode = '+1'; // Default country code (USA)
  final TextEditingController _phoneController = TextEditingController();

  // List of country codes and their labels
  final List<Map<String, String>> _countryCodes = [
    {'code': '+1', 'name': 'USA'},
    {'code': '+91', 'name': 'India'},
    {'code': '+44', 'name': 'UK'},
    {'code': '+61', 'name': 'Australia'},
    {'code': '+81', 'name': 'Japan'},
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Picker & Phone Input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              DropdownButton<String>(
                value: _selectedCountryCode,
                underline: SizedBox(),
                icon: Image.asset(IconAssets.ic_country_picker),
                items: _countryCodes.map((country) {
                  return DropdownMenuItem<String>(
                    value: country['code'],
                    child: Row(
                      children: [
                        Text(country['code'] ?? ''),
                        SizedBox(width: 8),
                        // Text(
                        //   country['name'] ?? '',
                        //   style: TextStyle(color: Colors.grey, fontSize: 12),
                        // ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCountryCode = value!;
                  });
                },
              ),
              SizedBox(width: 8),
              Container(
                height: 64, // Height of the divider
                width: 1, // Thickness of the divider
                color: Colors.grey, // Color of the divider
              ),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    // labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     String phoneNumber = '$_selectedCountryCode ${_phoneController.text}';
      //     print('Phone Number: $phoneNumber');
      //     // Add your API call or submission logic here
      //   },
      //   child: Icon(Icons.send),
      // ),
    );
  }
}
