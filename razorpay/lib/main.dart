import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Razorpay _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Success Response: ${response}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Error Response: ${response}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External SDK Response: ${response}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("RazorPay Sample"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openCheckout(100, "zoople", "fadil description", "9895574181",
                "fadilameen11@gmail.com");
          },
          child: Text(
            "open",
            // style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

//   void openCheckout(int amt, String shopname, String description, String no,
//       String email) async {
//     var options = {
//       'key': 'rzp_live_iLgsfZcZoFIKMb',
//       'amount': '${amt * 100}',
//       'name': '${shopname}',
//       'description': '$description',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '$no', 'email': '$email'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error:e');
//     }
//   }
// }

  void openCheckout(int amt, String shopname, String discription, String no,
      String email) async {
    var options = {
      //dynamic key of clint please replace key with ur key
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      //amt in pisa
      'amount': amt * 100,
      'name': '${shopname}',
      'description': '${discription}',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '$no', 'email': '$email'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
}
