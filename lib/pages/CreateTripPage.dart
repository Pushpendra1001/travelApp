import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelling_app/models/TripModel.dart';
import 'package:travelling_app/pages/BookingPage.dart';

class TripPlanningPage extends StatefulWidget {
  const TripPlanningPage({Key? key}) : super(key: key);

  @override
  _TripPlanningPageState createState() => _TripPlanningPageState();
}

class _TripPlanningPageState extends State<TripPlanningPage> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _priceRangeController = TextEditingController();
  final _locationController = TextEditingController();
  final _destinationController = TextEditingController();
  bool _needHotel = false;
  bool _needVehicle = false;
  bool _needGuide = false;

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _priceRangeController.dispose();
    _locationController.dispose();
    _destinationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Planning'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField('Starting Date', _startDateController, () async {
              _selectDate(_startDateController);
            }),
            _buildTextField('Ending Date', _endDateController, () async {
              _selectDate(_endDateController);
            }),
            _buildTextField('Price Range', _priceRangeController, null,
                keyboardType: TextInputType.number),
            _buildTextField('Location', _locationController, null),
            _buildTextField('Destination', _destinationController, null),
            CheckboxListTile(
              title: Text('Need Hotel'),
              value: _needHotel,
              onChanged: (bool? value) {
                setState(() {
                  _needHotel = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Need Vehicle'),
              value: _needVehicle,
              onChanged: (bool? value) {
                setState(() {
                  _needVehicle = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Need Guide'),
              value: _needGuide,
              onChanged: (bool? value) {
                setState(() {
                  _needGuide = value!;
                });
              },
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                var trip = Trip(
                  startDate: _startDateController.text,
                  endDate: _endDateController.text,
                  priceRange: _priceRangeController.text,
                  location: _locationController.text,
                  destination: _destinationController.text,
                  needHotel: _needHotel,
                  needVehicle: _needVehicle,
                  needGuide: _needGuide,
                );
                Provider.of<TripModel>(context, listen: false).addTrip(trip);
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Save Plan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, void Function()? onTap,
      {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: controller,
          onTap: onTap,
          keyboardType: keyboardType,
          readOnly: onTap != null,
          decoration: InputDecoration(
            hintText: 'Enter $label',
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
