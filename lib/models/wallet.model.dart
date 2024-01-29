class WalletModel {
  String name;
  String wallet;
  String walletLogo;
  String walletNumber;

  WalletModel(
      {required this.name,
      required this.wallet,
      required this.walletLogo,
      required this.walletNumber});

  static List<WalletModel> getWallets() {
    return [
      WalletModel(
          name: "Prambors",
          wallet: "Gopay",
          walletLogo: 'assets/images/gopay_logo.png',
          walletNumber: '+62*** **** 1932'),
      WalletModel(
          name: "Jenny",
          wallet: "Ovo",
          walletLogo: 'assets/images/ovo_logo.png',
          walletNumber: '+62*** **** 2245'),
      WalletModel(
          name: "Jenny",
          wallet: "Gopay",
          walletLogo: 'assets/images/gopay_logo.png',
          walletNumber: '+62*** **** 2245'),
      WalletModel(
          name: "Prambors",
          wallet: "Dana",
          walletLogo: 'assets/images/dana_logo.png',
          walletNumber: '+62*** **** 1932')
    ];
  }
}
