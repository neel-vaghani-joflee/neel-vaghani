class ExpensesModel {
  ExpensesModel({
    required this.users,
  });
  List<ExpensesElement> users;

  factory ExpensesModel.fromJson(Map<String, dynamic> json) => ExpensesModel(
        users: List<ExpensesElement>.from(
          json['user'].map(
            (x) => ExpensesElement.fromExpensesSheet(x),
          ),
        ),
      );
  set date(date) {}

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(
          users.map(
            (e) => e.toExpensesSheet(),
          ),
        )
      };
}

class ExpensesElement {
  const ExpensesElement({
    required this.date,
    required this.amount,
    required this.fromAccount,
    required this.category,
    required this.description,
  });
  final String date;
  final String amount;
  final String fromAccount;
  final String category;
  final String description;

  @override
  String toString() =>
      'User{E_Date: $date,E_Amount: $amount,E_From Account: $fromAccount,E_Category: $category,E_Description: $description}';
  factory ExpensesElement.fromExpensesSheet(Map<String, dynamic> json) {
    return ExpensesElement(
      date: json['E_Date'],
      amount: json['E_Amount'],
      fromAccount: json['E_From Account'],
      category: json['E_Category'],
      description: json['E_Description'],
    );
  }
  Map<String, dynamic> toExpensesSheet() {
    return {
      'E_Date': date,
      'E_Amount': amount,
      'E_From Account': fromAccount,
      'E_Category': category,
      'E_Description': description,
    };
  }
}
