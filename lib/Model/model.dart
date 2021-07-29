class User {
  User({
    required this.users,
  });
  List<UserElement> users;

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<UserElement>.from(
          json['user'].map(
            (x) => UserElement.fromGdheets(x),
          ),
        ),
      );
  set date(date) {}

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(
          users.map(
            (e) => e.toGsheets(),
          ),
        )
      };
}

class UserElement {
  const UserElement({
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
      'User{date: $date,amount: $amount,fromAccount: $fromAccount,category: $category,description: $description}';
  factory UserElement.fromGdheets(Map<String, dynamic> json) {
    return UserElement(
      date: json['date'],
      amount: json['amount'],
      fromAccount: json['fromAccount'],
      category: json['category'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toGsheets() {
    return {
      'date': date,
      'amount': amount,
      'fromAccount': fromAccount,
      'category': category,
      'description': description,
    };
  }
}
