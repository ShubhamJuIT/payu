import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:payu_money_flutter/payu_money_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Creating PayuMoneyFlutter Instance
  PayuMoneyFlutter payuMoneyFlutter = PayuMoneyFlutter();

//fnuDx1|602ed0df6cea174709c27337|500.00|bucket-1|Shubham|shubham.mua@gmail.com|||||||||||99FzqrK2
  // Payment Details
  String phone = "7838821488";
  String email = "shubham.mua@gmail.com";
  String productName = "bucket-1";
  String firstName = "Shubham";
  String txnID = "602ed9b16cea172139bc7608";
  String amount = "500.0";
  String hash =
      "526b9eeb5e835d44bdfd43d9e7d88d9b111ab7d40f1f1c5efbbd310a2c96ec229f660dea59374e97d003e2a724d0a769730ef19bfa1ab1ea65bb1cc5852af9a6";

  @override
  void initState() {
    super.initState();
    // Setting up the payment details
    setupPayment();
  }

  // Function for setting up the payment details
  setupPayment() async {
    bool response = await payuMoneyFlutter.setupPaymentKeys(
        merchantKey: "fnuDx1",
        merchantID: "130033",
        isProduction: false,
        activityTitle: "App Title",
        disableExitConfirmation: false);
  }

  // Function for start payment with given merchant id and merchant key
  Future<Map<String, dynamic>> startPayment() async {
    // Generating hash from php server
    // Response res =
    //     await post("https://PayUMoneyServer.codedivinedivin.repl.co", body: {
    //   "txnid": txnID,
    //   "phone": phone,
    //   "email": email,
    //   "amount": amount,
    //   "productinfo": productName,
    //   "firstname": firstName,
    // });
    // var data = jsonDecode(res.body);
    // print(data);
    // String hash = data['params']['hash'];
    print(hash);
    var myResponse = await payuMoneyFlutter.startPayment(
        txnid: txnID,
        amount: amount,
        name: firstName,
        email: email,
        phone: phone,
        productName: productName,
        hash: hash);
    print("Message ${myResponse}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payu Money Flutter'),
        ),
        body: Center(
          child: Text("Pay Us 10"),
        ),
        floatingActionButton: FloatingActionButton(
          // Starting up the payment
          onPressed: () => startPayment(),
          child: Icon(Icons.attach_money),
        ),
      ),
    );
  }
}
