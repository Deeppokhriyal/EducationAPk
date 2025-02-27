import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/bottombar/history.dart';
import 'package:flutter/material.dart';

class LeaveApplication extends StatefulWidget {
  @override
  _LeaveApplicationState createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _submitByController = TextEditingController();
  TextEditingController _leaveDateController = TextEditingController();
  TextEditingController _leaveReasonController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedValue; // Selected branch value

  // List of Branches for Dropdown
  final List<String> items = [
    'Information Technology',
    'Agriculture Engineering',
    'Chemical Engineering',
    'Chemical Paint',
    'Civil',
    'Computer Science Engineering',
    'Electronics Engineering',
    'Mechanical Engineering',
    'Pharmacy',
  ];

  // Function to pick date
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _leaveDateController.text = "${picked.toLocal()}".split(' ')[0]; // YYYY-MM-DD format
      });
    }
  }

  // Function to submit leave application
  Future<void> submitLeaveApplication() async {
    if (_formKey.currentState!.validate()) {
      if (selectedValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select your branch!')),
        );
        return;
      }

      try {
        await _firestore.collection('leave_applications').add({
          'branch': selectedValue, // Save selected branch
          'submitBy': _submitByController.text,
          'leaveDate': _leaveDateController.text,
          'leaveReason': _leaveReasonController.text,
          'submittedAt': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Leave application submitted successfully!')),
        );

        // Clear fields after submission
        _submitByController.clear();
        _leaveDateController.clear();
        _leaveReasonController.clear();
        setState(() {
          selectedValue = null; // Reset dropdown
        });
      } catch (e) {
        print("Error submitting leave application: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting application. Try again!',style: TextStyle(fontFamily: 'nexalight'),)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/pink-neon-synthwave-patterned-social-story-template-vector_53876-176441.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Text(
                      ' Leave Application',
                      style: TextStyle(fontFamily: 'nexalight', fontSize: 24, color: Colors.white),
                    ),
                  ]),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey, // ✅ Wrap Form with _formKey
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(

                              decoration: InputDecoration(
                                labelText: 'Select Your Branch',
                                labelStyle: TextStyle(color: Colors.white,fontFamily: 'nexalight'),
                              ),
                              style: TextStyle(color: Colors.purple, fontSize: 20,fontFamily: 'nexalight'),
                              borderRadius: BorderRadius.circular(40),
                              value: selectedValue,
                              items: items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              validator: (value) => value == null ? 'Please select your branch' : null,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _submitByController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Submit by',
                                labelStyle: TextStyle(color: Colors.white,fontFamily: 'nexalight'),
                              ),
                              validator: (value) => value!.isEmpty ? 'Enter the Submission to' : null,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _leaveDateController,
                              style: TextStyle(color: Colors.white),
                              readOnly: true, // Prevent keyboard pop-up
                              onTap: _pickDate, // ✅ Open date picker on tap
                              decoration: InputDecoration(
                                labelText: 'Leave Date',
                                labelStyle: TextStyle(color: Colors.white,fontFamily: 'nexalight'),
                                suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
                              ),
                              validator: (value) => value!.isEmpty ? 'Enter a valid leave date' : null,
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: _leaveReasonController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Reason',
                                labelStyle: TextStyle(color: Colors.white,fontFamily: 'nexalight'),
                                hintText: 'Enter your reason for application',
                                contentPadding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                                hintStyle: TextStyle(color: Colors.white54, fontSize: 15),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                              ),
                              maxLines: 3,
                              validator: (value) => value!.isEmpty ? 'Enter a reason for application' : null,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: submitLeaveApplication,
                              child: Text(
                                'Submit',
                                style: TextStyle(fontFamily: 'nexaheavy', fontSize: 20, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationHistory()));
        },
        child: Icon(Icons.history, color: Colors.purpleAccent, size: 33),
        tooltip: 'History',
        backgroundColor: Colors.white,
      ),
    );
  }
}
