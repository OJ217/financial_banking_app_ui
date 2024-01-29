import 'package:finance_banking_app_ui/constants/color.constant.dart';
import 'package:finance_banking_app_ui/models/card.model.dart';
import 'package:finance_banking_app_ui/models/transaction.model.dart';
import 'package:finance_banking_app_ui/models/wallet.model.dart';
import 'package:finance_banking_app_ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardModel> cards = [];
  List<WalletModel> wallets = [];
  List<TransactionModel> transactions = [];

  @override
  void initState() {
    super.initState();
    cards = CardModel.getCards();
    wallets = WalletModel.getWallets();
    transactions = TransactionModel.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: _buildAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildHomeScreenHeader(),
          _buildCardsList(),
          _buildTransactionSectionHeader(),
          _buildTransactionsList(),
          _buildWalletSectionHeader(),
          _buildWalletsList()
        ],
      ),
      extendBody: true,
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
      height: 56.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: const LinearGradient(
                colors: kGradientSlideButton,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
                stops: [0.0, 1.0])),
        child: ConfirmationSlider(
          height: 56.0,
          width: MediaQuery.of(context).size.width - 48,
          onConfirmation: () {},
          backgroundColor: Colors.transparent,
          shadow: const BoxShadow(color: Colors.transparent),
          foregroundColor: kWhiteColor,
          foregroundShape: BorderRadius.circular(8.0),
          sliderButtonContent: const Icon(MyFlutterApp.slide_icon),
          iconColor: kBlueColor,
          text: 'Slide for Payment',
          textStyle: const TextStyle(
              color: kWhiteColor, fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  ListView _buildWalletsList() {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.only(
          left: 24.0, top: 16.0, right: 24.0, bottom: 40.0),
      itemCount: wallets.length,
      itemBuilder: (context, index) => Container(
        height: 72.0,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                blurRadius: 10.0,
                spreadRadius: 4.0)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 44.0,
              width: 44.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhiteColor,
                  image: DecorationImage(
                      image: AssetImage(wallets[index].walletLogo))),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        wallets[index].name,
                        style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        wallets[index].wallet,
                        style: const TextStyle(
                            color: kGreyColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Text(
                    wallets[index].walletNumber,
                    style: const TextStyle(
                        color: kGreyColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 8.0,
      ),
    );
  }

  Container _buildWalletSectionHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const Text(
        'Top Up Again',
        style: TextStyle(
            color: kBlackColor, fontSize: 16.0, fontWeight: FontWeight.w700),
      ),
    );
  }

  SizedBox _buildTransactionsList() {
    return SizedBox(
      height: 248.0,
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: 24.0, top: 16.0, right: 24.0, bottom: 40.0),
        scrollDirection: Axis.horizontal,
        itemCount: transactions.length,
        itemBuilder: (context, index) => Container(
          height: 192.0,
          width: 160.0,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                  color: kBlackColor.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 4.0)
            ],
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(transactions[index].type),
                      Text(
                        transactions[index].name,
                        style: TextStyle(
                            color: transactions[index].colorType,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Text(
                    '${transactions[index].signType}USD ${transactions[index].amount}',
                    style: TextStyle(
                        color: transactions[index].colorType,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].information,
                        style: const TextStyle(
                            color: kGreyColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        transactions[index].recipient,
                        style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        transactions[index].date,
                        style: const TextStyle(
                            color: kGreyColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                  bottom: 0.0,
                  right:
                      transactions[index].card.contains('jenius') ? -8.0 : 0.0,
                  child: Image.asset(
                    transactions[index].card,
                    height: 20.0,
                    width: 30.0,
                  ))
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12.0,
        ),
      ),
    );
  }

  Container _buildTransactionSectionHeader() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Last Transactions',
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'See all transactions',
              style: TextStyle(
                  color: kBlueColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }

  SizedBox _buildCardsList() {
    return SizedBox(
      height: 240.0,
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: 24.0, top: 24.0, right: 24.0, bottom: 36.0),
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) => Container(
          height: 180.0,
          width: 220.0,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: cards[index].bgColor,
              boxShadow: [
                BoxShadow(
                    color: kBlackColor.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 4.0)
              ]),
          child: Stack(
            children: [
              Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Opacity(
                    opacity: 0.36,
                    child: SvgPicture.asset(
                      cards[index].cardBackground,
                      width: 60.0,
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        cards[index].type,
                        height: 24.0,
                        width: 36.0,
                      ),
                      Text(
                        cards[index].name,
                        style: TextStyle(
                            color: cards[index].firstColor,
                            backgroundColor: cards[index].bgColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your balance',
                        style: TextStyle(
                            color: cards[index].tertiaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'USD ${cards[index].balance}',
                        style: TextStyle(
                            color: cards[index].secondColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valid Thru',
                        style: TextStyle(
                            color: cards[index].tertiaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        cards[index].valid,
                        style: TextStyle(
                            color: cards[index].secondColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12.0,
        ),
      ),
    );
  }

  Container _buildHomeScreenHeader() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: const Text(
          'Hi, Linus!',
          style: TextStyle(
              color: kBlackColor, fontSize: 20.0, fontWeight: FontWeight.w700),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          MyFlutterApp.navigation_drawer,
          color: kBlackColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
      ),
    );
  }
}
