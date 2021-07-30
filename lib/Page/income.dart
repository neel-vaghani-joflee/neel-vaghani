import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiny_expence/Model/IncomeModel.dart';
import 'package:tiny_expence/google%20sheet%20service/google_sheet_service.dart';

class IncomePage extends StatefulWidget {
  IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController amountEditingController = TextEditingController();
  TextEditingController toAccountEditingController = TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  GoogleSheetService _googleSheetService = GoogleSheetService();
  String _toAccount = 'To Account';
  String _category = 'Select Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income"),
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
              // To Account
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: _toAccount,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                items: <String>[
                  'To Account',
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
                    toAccountEditingController.text = newValue!;
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
                  'Gift',
                  'Interest',
                  'Salary',
                  'Saving',
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
                maxLines: 4,
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
                  _googleSheetService.insertIncome(
                    IncomeElement(
                        date: dateEditingController.text,
                        amount: amountEditingController.text,
                        toAccount: toAccountEditingController.text,
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
