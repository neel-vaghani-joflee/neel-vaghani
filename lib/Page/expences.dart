import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiny_expence/Model/model.dart';
import 'package:tiny_expence/google%20sheet%20service/google_sheet_service.dart';

class ExpensesPage extends StatefulWidget {
  ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController amountEditingController = TextEditingController();
  TextEditingController fromAccountEditingController = TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  GoogleSheetService _googleSheetService = GoogleSheetService();
  String _fromeAccount = 'From Account';
  String _category = 'Select Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // Date
              TextFormField(
                controller: dateEditingController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today_rounded),
                    labelText: "Date",
                    hintText: "dd/mm/yyyy"),
              ),
              SizedBox(
                height: 10,
              ),
              // Amount
              TextFormField(
                controller: amountEditingController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.money),
                  labelText: "Amount",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // From Account
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: _fromeAccount,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                items: <String>[
                  'From Account',
                  'Bank1',
                  'Bank2',
                  'Bank3',
                  'CreditCard1',
                  'CreditCard2',
                  'CreditCard3',
                  'Cash',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    fromAccountEditingController.text = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              // Category
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: _category,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                items: <String>[
                  'Select Category',
                  'Grocery/Vegetables',
                  'Gasbill',
                  'Gift',
                  'Health/Medical',
                  'Household',
                  'Invest In Office',
                  'Lightibill',
                  'Restaurant',
                  'Saving',
                  'Snacks',
                  'Utility',
                  'Vehicle',
                  'Personal1',
                  'Personal2',
                  'Personal3',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    // Add Text To TextEditongController
                    categoryEditingController.text = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              // Description
              TextField(
                controller: descriptionEditingController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  labelText: "Descreption",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // print(dateEditingController.text);
                  print(amountEditingController.text);
                  // print(fromAccountEditingController.text);
                  // print(categoryEditingController.text);
                  // print(descriptionEditingController.text);
                  _googleSheetService.insert(
                    UserElement(
                        date: dateEditingController.text,
                        amount: amountEditingController.text,
                        fromAccount: fromAccountEditingController.text,
                        category: categoryEditingController.text,
                        description: descriptionEditingController.text),
                  );
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
