class IncomeModel {
  IncomeModel({
    required this.incomes,
  });
  List<IncomeElement> incomes;

  factory IncomeModel.formJson(Map<String, dynamic> json) => IncomeModel(
        incomes: List<IncomeElement>.from(
          json['user'].map(
            (x) => IncomeElement.fromIncomeSheet(x),
          ),
        ),
      );
  set date(date) {}

  Map<String, dynamic> toJson() => {
        "incomes": List<dynamic>.from(
          incomes.map(
            (e) => e.toIncomeSheet(),
          ),
        ),
      };
}

class IncomeElement {
  const IncomeElement(
      {required this.date,
      required this.amount,
      required this.toAccount,
      required this.category,
      required this.description});
  final String date;
  final String amount;
  final String toAccount;
  final String category;
  final String description;

  @override
  String toString() =>
      'User{I_Date: $date,I_Amount: $amount,I_to Account: $toAccount,I_Category: $category,I_Description: $description}';
  factory IncomeElement.fromIncomeSheet(Map<String, dynamic> json) {
    return IncomeElement(
      date: json['I_Date'],
      amount: json['I_Amount'],
      toAccount: json['I_To Account'],
      category: json['I_Category'],
      description: json['I_Description'],
    );
  }
  Map<String, dynamic> toIncomeSheet() {
    return {
      'I_Date': date,
      'I_Amount': amount,
      'I_To Account': toAccount,
      'I_Category': category,
      'I_Description': description
    };
  }
}
