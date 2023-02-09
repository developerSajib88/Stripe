import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe/PaymentController.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51M5Ei2IGm0dQSaCMGhNKfosCfIzJNeDqh4gjHvCGQgGC3gnpELF0AgzDMSW5pHLFn5FSrbVFrbxROCnao3RnZP7h00AwmMHRyF';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  TextEditingController totalAmount = TextEditingController();
  PaymentController paymentController = PaymentController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: totalAmount,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          labelText: "Enter Amount"
                      )
                  ),
                ),

                const SizedBox(height: 20.0,),

                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: (){
                      paymentController.makePayment(amount: totalAmount.text, currency: "USD");
                    },
                    child: const Text("PAY NOW"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
