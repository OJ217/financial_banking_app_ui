import 'package:finance_banking_app_ui/constants/color.constant.dart';
import 'package:flutter/material.dart';

class CardModel {
  String name;
  String type;
  String balance;
  String valid;
  String moreIcon;
  String cardBackground;
  Color bgColor;
  Color firstColor;
  Color secondColor;
  Color tertiaryColor;

  CardModel(
      {required this.name,
      required this.type,
      required this.balance,
      required this.valid,
      required this.moreIcon,
      required this.cardBackground,
      required this.bgColor,
      required this.firstColor,
      required this.secondColor,
      required this.tertiaryColor});

  static List<CardModel> getCards() {
    return [
      CardModel(
          name: "Prambors",
          type: "assets/images/mastercard_logo.png",
          balance: "6.352.251",
          valid: "06/24",
          moreIcon: 'assets/icons/more_icon_grey.svg',
          cardBackground: 'assets/svg/mastercard_bg.svg',
          bgColor: kMasterCardColor,
          firstColor: kAccentColor,
          secondColor: kBlackColor,
          tertiaryColor: kGreyColor),
      CardModel(
          name: "Prambors",
          type: "assets/images/jenius_logo.png",
          balance: "20.528.337",
          valid: "02/26",
          moreIcon: 'assets/icons/more_icon_white.svg',
          cardBackground: 'assets/svg/jenius_bg.svg',
          bgColor: kJeniusCardColor,
          firstColor: kWhiteColor,
          secondColor: kWhiteColor,
          tertiaryColor: kWhiteColor),
      CardModel(
          name: "Prambors",
          type: "assets/images/mastercard_logo.png",
          balance: "6.352.251",
          valid: "06/24",
          moreIcon: 'assets/icons/more_icon_grey.svg',
          cardBackground: 'assets/svg/mastercard_bg.svg',
          bgColor: kMasterCardColor,
          firstColor: kAccentColor,
          secondColor: kBlackColor,
          tertiaryColor: kGreyColor),
      CardModel(
          name: "Prambors",
          type: "assets/images/jenius_logo.png",
          balance: "20.528.337",
          valid: "02/26",
          moreIcon: 'assets/icons/more_icon_white.svg',
          cardBackground: 'assets/svg/jenius_bg.svg',
          bgColor: kJeniusCardColor,
          firstColor: kWhiteColor,
          secondColor: kWhiteColor,
          tertiaryColor: kWhiteColor),
    ];
  }
}
