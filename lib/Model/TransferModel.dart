class TransferModel {
  TransferModel({
    required this.transfers,
  });
  List<TransferElement> transfers;

  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
        transfers: List<TransferElement>.from(
          json['transfers'].map(
            (x) => TransferElement.fromTransferSheet(x),
          ),
        ),
      );

  set date(date) {}
  Map<String, dynamic> toJson() => {
        "transfers": List<dynamic>.from(
          transfers.map(
            (e) => e.toTransferSheet(),
          ),
        ),
      };
}

class TransferElement {
  const TransferElement({
    required this.date,
    required this.amount,
    required this.fromAccount,
    required this.toAccount,
    required this.description,
  });
  final String date;
  final String amount;
  final String fromAccount;
  final String toAccount;
  final String description;

  @override
  String toString() =>
      'icome{T_Date:$date, T_Amount: $amount, T_From Account:$fromAccount , T_To Account : $toAccount, T_Description: $description}';
  factory TransferElement.fromTransferSheet(Map<String, dynamic> json) {
    return TransferElement(
      date: json['T_Date'],
      amount: json['T_Amount'],
      fromAccount: json['T_From Account'],
      toAccount: json['T_To Account'],
      description: json['T_Description'],
    );
  }
  Map<String, dynamic> toTransferSheet() {
    return {
      'T_Date': date,
      'T_Amount': amount,
      'T_From Account': fromAccount,
      'T_To Account': toAccount,
      'T_Description': description,
    };
  }
}
