import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class PayMethodScreen extends StatefulWidget {
  final double price;

  const PayMethodScreen({Key? key, required this.price}) : super(key: key);

  @override
  State<PayMethodScreen> createState() => _PayMethodScreenState(price: price);
}

class _PayMethodScreenState extends State<PayMethodScreen> {
  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;
  final double price;

  _PayMethodScreenState({required this.price});

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      print(e);
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app )async{
    return _upiIndia.startTransaction(app: UpiApp.googlePay, receiverUpiId: "arpitjoshi555@oksbi", receiverName: "Arpit", transactionRefId: "testing",amount: price);
  }
  

  Widget displayUpiApps() {
    if (apps == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (apps!.isEmpty) {
      return Center(
          child: Text(
        "No apps found to handle transaction",
      ));
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(app.icon,height: 60,width: 60,),Text(app.name)
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
      ),
      body: Center(
        child: displayUpiApps()
      ),
    );
  }
}
