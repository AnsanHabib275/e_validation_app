import 'package:country_picker/country_picker.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';

class CountryCodePickerScreen extends StatefulWidget {
  @override
  _CountryCodePickerScreenState createState() =>
      _CountryCodePickerScreenState();
}

class _CountryCodePickerScreenState extends State<CountryCodePickerScreen> {
  String _selectedCountryCode = '+92'; // Default country code (USA)
  String _selectedRegionCode = 'PK'; // Default country code (USA)
  int? _maxPhoneDigits;
  final TextEditingController _phoneController = TextEditingController();
  // String initialCountry = 'US';
  // String phoneNumber = '';
  // bool isValid = false;

  // List of country codes and their labels
  // final List<Map<String, String>> _countryCodes = [
  //   {'code': '+1', 'name': 'USA'},
  //   {'code': '+91', 'name': 'India'},
  //   {'code': '+44', 'name': 'UK'},
  //   {'code': '+61', 'name': 'Australia'},
  //   {'code': '+81', 'name': 'Japan'},
  //   // Add more countries as needed
  // ];

  @override
  void initState() {
    super.initState();
    getPhoneNumberLength(_selectedCountryCode, _selectedRegionCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Picker & Phone Input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // DropdownButton<String>(
              //   value: _selectedCountryCode,
              //   underline: SizedBox(),
              //   icon: Image.asset(IconAssets.ic_country_picker),
              //   items: _countryCodes.map((country) {
              //     return DropdownMenuItem<String>(
              //       value: country['code'],
              //       child: Row(
              //         children: [
              //           Text(country['code'] ?? ''),
              //           SizedBox(width: 8),
              //         ],
              //       ),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       _selectedCountryCode = value!;
              //     });
              //   },
              // ),
              // GestureDetector(
              //   onTap: () {
              //     showCountryPicker(
              //       context: context,
              //       showPhoneCode: true,
              //       onSelect: (Country country) {
              //         setState(() {
              //           _selectedCountryCode = '+${country.phoneCode}';
              //         });
              //       },
              //     );
              //   },
              //   child: Row(
              //     children: [
              //       Text(
              //         _selectedCountryCode,
              //         style: TextStyle(fontSize: 16),
              //       ),
              //       SizedBox(width: 5),
              //       Image.asset(IconAssets.ic_country_picker),
              //     ],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country country) async {
                      String countryCode = '+${country.phoneCode}';
                      // String regionCode =
                      //     '+${country.displayNameNoCountryCode}';
                      // print(regionCode);
                      RegExp regExp = RegExp(
                          r'\((\w{2})\)'); // This looks for a two-letter code within parentheses

                      // Match the region code from the country's display name
                      String regionCode = regExp
                              .firstMatch(country.displayNameNoCountryCode)
                              ?.group(1) ??
                          '';

                      print(regionCode);
                      // _updateMaxPhoneLength(countryCode);
                      // setState(() {
                      //   _selectedCountryCode = countryCode;
                      // });
                      int? maxLength =
                          await getPhoneNumberLength(countryCode, regionCode);
                      setState(() {
                        _selectedCountryCode = countryCode;
                        _selectedRegionCode = regionCode;
                        _maxPhoneDigits = maxLength;
                      });
                    },
                  );
                },
                child: Row(
                  children: [
                    Text(
                      _selectedCountryCode,
                      style: TextStyle(
                          color: AppColor.textBlack70Per,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
                    Image.asset(IconAssets.ic_country_picker),
                  ],
                ),
              ),
              SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
              Container(
                height: 64, // Height of the divider
                width: 1, // Thickness of the divider
                color: AppColor.textBlack40Per, // Color of the divider
              ),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
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
    );
  }

  // Future<void> _updateMaxPhoneLength(String countryCode) async {
  //   try {
  //     String dummyPhone = "$countryCode 1234567890"; // Dummy phone number
  //     bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
  //       phoneNumber: dummyPhone,
  //       isoCode: countryCode.replaceFirst('+', ''),
  //     );
  //
  //     if (isValid != null) {
  //       // Valid number: Fetch phone number details
  //       String? formatted = await PhoneNumberUtil.normalizePhoneNumber(
  //         phoneNumber: dummyPhone,
  //         isoCode: countryCode.replaceFirst('+', ''),
  //       );
  //
  //       setState(() {
  //         print('isvalid :true');
  //         _maxPhoneDigits =
  //             formatted?.replaceAll(RegExp(r'[^0-9]'), '').length ??
  //                 10; // Default to 10 if null
  //       });
  //     } else {
  //       print('isvalid : $isValid');
  //       setState(() {
  //         _maxPhoneDigits = 10;
  //       });
  //     }
  //   } catch (e) {
  //     print('catch : $e');
  //     debugPrint("Error determining phone length: $e");
  //     setState(() {
  //       _maxPhoneDigits = 10; // Fallback to 10 digits
  //     });
  //   }
  // }
  // void getMaxPhoneNumberLength(String isoCode) {
  //   try {
  //     // Get metadata for the provided country
  //     final metadata = MetadataFinder.getCountryMetadataByIsoCode(isoCode);
  //
  //     if (metadata != null) {
  //       // Max and min lengths of national numbers
  //       final maxLength = metadata.maxLengths.nsn;
  //       final minLength = metadata.minLengths.nsn;
  //
  //       print('Max Length in $isoCode: $maxLength digits');
  //       print('Min Length in $isoCode: $minLength digits');
  //     } else {
  //       print('Metadata not found for country code: $isoCode');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
  // Future<int> getPhoneNumberLength(String countryCode) async {
  //   try {
  //     PhoneNumber phoneNumber =
  //         await PhoneNumberUtil().parse(countryCode, regionCode: 'US');
  //     return phoneNumber.nationalNumber.length;
  //   } catch (e) {
  //     print('Error: $e');
  //     return 0; // Return 0 or some default length for errors
  //   }
  // }
  // Future<int?> getPhoneNumberLength(String countryCode) async {
  //   try {
  //     final phoneNumberFormat = await PhoneNumberFormat.of(countryCode);
  //     return phoneNumberFormat.pattern.lengthWhere((char) => char == 'd');
  //   } catch (e) {
  //     print('Error getting phone number length: $e');
  //     return null;
  //   }
  // }
  // Future<int?> getPhoneNumberLength(String countryCode) async {
  //   try {
  //     final phoneNumberFormat =
  //         await PhoneNumberUtil().getNumberFormat(countryCode);
  //     return phoneNumberFormat.pattern.lengthWhere((char) => char == 'd');
  //   } catch (e) {
  //     print('Error getting phone number length: $e');
  //     return null;
  //   }
  // }
  // Future<void> _updateMaxPhoneLength(String countryCode) async {
  //   try {
  //     final phoneUtil = PhoneNumberUtil(); // Create PhoneNumberUtil instance
  //     final phoneNumberFormat = await phoneUtil.getNumberFormat(countryCode);
  //     setState(() {
  //       _maxPhoneDigits =
  //           phoneNumberFormat.pattern.lengthWhere((char) => char == 'd');
  //     });
  //   } catch (e) {
  //     print('Error getting phone number length: $e');
  //     setState(() {
  //       _maxPhoneDigits = 10; // Set a default value in case of error
  //     });
  //   }
  // }
  Future<int> getPhoneNumberLength(
      String countryCode, String regionCode) async {
    try {
      print(countryCode);
      PhoneNumber phoneNumber =
          await PhoneNumberUtil().parse(countryCode, regionCode: regionCode);
      print(phoneNumber.nationalNumber.length);
      return phoneNumber.nationalNumber.length;
    } catch (e) {
      print('Error: $e');
      return 10; // Return 0 or some default length for errors
    }
  }
}
