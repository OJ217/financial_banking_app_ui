import 'package:finance_banking_app_ui/constants/color.constant.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  String type;
  Color colorType;
  String signType;
  String amount;
  String information;
  String recipient;
  String date;
  String card;

  TransactionModel(
      {required this.name,
      required this.type,
      required this.colorType,
      required this.signType,
      required this.amount,
      required this.information,
      required this.recipient,
      required this.date,
      required this.card});

  static List<TransactionModel> getTransactions() {
    return [
      TransactionModel(
          name: "Outcome",
          type: 'assets/icons/outcome_icon.svg',
          colorType: kOrangeColor,
          signType: "-",
          amount: "200.000",
          information: "Transfer to",
          recipient: "Michael Ballack",
          date: "12 Feb 2020",
          card: "assets/images/mastercard_logo.png"),
      TransactionModel(
          name: "Income",
          type: 'assets/icons/income_icon.svg',
          colorType: kGreenColor,
          signType: "+",
          amount: "352.000",
          information: "Received from",
          recipient: "Patrick Star",
          date: "10 Feb 2020",
          card: "assets/images/jenius_logo_blue.png"),
      TransactionModel(
          name: "Outcome",
          type: 'assets/icons/outcome_icon.svg',
          colorType: kOrangeColor,
          signType: "-",
          amount: "53.265",
          information: "Monthly Payment",
          recipient: "Spotify",
          date: "09 Feb 2020",
          card: "assets/images/mastercard_logo.png"),
    ];
  }
}
