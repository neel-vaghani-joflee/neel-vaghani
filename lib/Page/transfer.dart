import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiny_expence/Model/TransferModel.dart';
import 'package:tiny_expence/google%20sheet%20service/google_sheet_service.dart';

class TransferPage extends StatefulWidget {
  TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController fromAccountController = TextEditingController();
  TextEditingController toAccountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GoogleSheetService _googleSheetService = GoogleSheetService();
  String _fromeAccount = 'From Account';
  String _toAccount = 'To Account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
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
                controller: dateController,
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
                controller: amountController,
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
                    fromAccountController.text = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
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
                    // Add Text To TextEditongController
                    toAccountController.text = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              // Description
              TextField(
                controller: descriptionController,
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
                  print(dateController.text);
                  _googleSheetService.insertTransfer(
                    TransferElement(
                        date: dateController.text,
                        amount: amountController.text,
                        fromAccount: fromAccountController.text,
                        toAccount: toAccountController.text,
                        description: descriptionController.text),
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
