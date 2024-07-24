import 'package:flutter/material.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String? _selectedEwalletOption;
  String? _selectedOnlineBankingOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method', style: TextStyle(color: Color.fromRGBO(207,178,135, 1))),
        backgroundColor:Color.fromRGBO(2, 8, 75, 1),
        iconTheme: const IconThemeData(color: Color.fromRGBO(207,178,135, 1)),
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPaymentOption(
                icon: Icons.account_balance,
                title: 'SeaBank',
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color.fromRGBO(2, 8, 75, 1),
                  ),
                  child: const Text('Activate', style: TextStyle(color: Color.fromRGBO(207,178,135, 1))),
                ),
              ),
              _buildPaymentOption(
                icon: Icons.money,
                title: 'Cash on Delivery',
              ),
              _buildEwalletOption(),
              _buildOnlineBankingOption(),
              _buildPaymentOption(
                icon: Icons.credit_card,
                title: 'Credit / Debit Card',
              ),
              _buildPaymentOption(
                icon: Icons.payment,
                title: 'Google Pay',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: ListTile(
        leading: Icon(icon, size: 30.0, color:Color.fromRGBO(2, 8, 75, 1)),
        title: Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }

  Widget _buildEwalletOption() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: ExpansionTile(
        leading: const Icon(Icons.account_balance_wallet, size: 30.0, color:Color.fromRGBO(2, 8, 75, 1)),
        title: const Text('Payment Center / E-Wallet', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        children: <Widget>[
          _buildEwalletSubOption(
            image: 'seveneleven.png',
            title: '7-Eleven CLIQQ',
            subtitle: 'Payment (min. P50) should be completed within 24 hrs. Accessible 24/7 and may entail additional 2% fee.',
            isSelected: _selectedEwalletOption == '7-Eleven CLIQQ',
            onTap: () {
              setState(() {
                _selectedEwalletOption = '7-Eleven CLIQQ';
              });
            },
          ),
          _buildEwalletSubOption(
            image: 'gcash.png',
            title: 'GCash',
            subtitle: 'Payment (min. P50) should be completed within 30 mins. Accessible 24/7 and may entail additional 2% fee.',
            isSelected: _selectedEwalletOption == 'GCash',
            onTap: () {
              setState(() {
                _selectedEwalletOption = 'GCash';
              });
            },
          ),
          _buildEwalletSubOption(
            image: 'maya.png',
            title: 'Maya',
            subtitle: 'Payment (min. P50) should be completed within 30 mins. Accessible 24/7.',
            isSelected: _selectedEwalletOption == 'Maya',
            onTap: () {
              setState(() {
                _selectedEwalletOption = 'Maya';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEwalletSubOption({
    required String image,
    required String title,
    required String subtitle,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Image.asset(image, width: 30.0, height: 30.0),
      title: Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: isSelected ? const Icon(Icons.check_circle, color: Colors.orange) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      onTap: onTap,
    );
  }

  Widget _buildOnlineBankingOption() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: ExpansionTile(
        leading: const Icon(Icons.online_prediction, size: 30.0, color:Color.fromRGBO(2, 8, 75, 1)),
        title: const Text('Online Banking', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        children: <Widget>[
          _buildOnlineBankingSubOption(
            image: 'unionbank.png',
            title: 'Unionbank Internet Banking',
            subtitle: 'Payment should be done within 1 hr upon checkout. Accessible daily Mon-Sun with additional P10 fee on top of payment',
            isSelected: _selectedEwalletOption == 'Unionbank',
            onTap: () {
              setState(() {
                _selectedEwalletOption = 'Unionbank';
              });
            },
          ),
          _buildOnlineBankingSubOption(
            image: 'bpi.png',
            title: 'BPI Online Banking',
            subtitle: 'Payment should be done within 1 hr upon checkout. Accessible daily Mon-Sun with additional P5 fee on top of payment',
            isSelected: _selectedOnlineBankingOption == 'bpi',
            onTap: () {
              setState(() {
                _selectedOnlineBankingOption = 'bpi';
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildOnlineBankingSubOption({
    required String image,
    required String title,
    required String subtitle,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Image.asset(image, width: 30.0, height: 30.0),
      title: Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: isSelected ? const Icon(Icons.check_circle, color: Colors.orange) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      onTap: onTap,
    );
  }
}
