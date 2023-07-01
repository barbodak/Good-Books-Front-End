import 'package:flutter/material.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class paymentPage extends StatefulWidget {
  final String Amount;
  const paymentPage({super.key, required this.Amount});
  @override
  State<StatefulWidget> createState() {
    return paymentPageState();
  }
}

class paymentPageState extends State<paymentPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Color?>? _colorAnim;

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = User.loggedIn.name.toUpperCase();
  String password = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final TextEditingController _password = TextEditingController(text: "");
  String test = "";
  Color appBarColor = Colors.green;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _colorAnim = RainbowColorTween([
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.deepPurple,
      Colors.red,
    ]).animate(controller!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reset();
          controller!.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
      });
    controller!.forward();
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amount : ",
                style: TextStyle(
                  fontFamily: 'Switzer',
                  fontWeight: FontWeight.w600,
                  fontSize: 28.0, // smaller font size
                ),
              ),
              Text(
                widget.Amount + "\$",
                style: TextStyle(
                  fontFamily: 'Switzer',
                  fontWeight: FontWeight.w900,
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  glassmorphismConfig:
                      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  bankName: 'Barbod Bank :)',
                  frontCardBorder:
                      !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                  backCardBorder:
                      !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                  showBackView: isCvvFocused,
                  obscureCardNumber: false,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: _colorAnim!.value!,
                  backgroundImage:
                      useBackgroundImage ? 'assets/card_bg.png' : null,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: false,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: '',
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: Colors.white,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: TextField(
                            controller: _password,
                            style: TextStyle(
                              color:
                                  Colors.amber, // change the color of the text
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.white),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'Password',
                              hintText: 'Enter : 1234',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Hero(
                              tag: 'in',
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: appBarColor,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {
                                  appBarColor = Colors.red;
                                  User u = User.loggedIn;
                                  setState(() {});
                                  print(_password.text +
                                      " " +
                                      cardNumber +
                                      " " +
                                      cvvCode +
                                      " " +
                                      expiryDate +
                                      " " +
                                      _password.text);
                                  if (_password.text == "1234" &&
                                      cardNumber.length == 19 &&
                                      cvvCode.length >= 3 &&
                                      expiryDate.length == 5) {
                                    User.loggedIn.accountBalance +=
                                        int.parse(widget.Amount);
                                    dispose();
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text("PAY"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: _onValidate,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(181, 141, 103, 255),
                                  Color.fromRGBO(229, 209, 178, 255),
                                  Color.fromRGBO(249, 238, 210, 255),
                                  Color.fromRGBO(255, 255, 253, 255),
                                  Color.fromRGBO(249, 238, 210, 255),
                                  Color.fromRGBO(181, 141, 103, 255),
                                ],
                                begin: Alignment(-1, -4),
                                end: Alignment(1, 4),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

class RainbowColorTween extends Animatable<Color?> {
  RainbowColorTween(this.colors) : assert(colors.isNotEmpty);

  final List<Color> colors;

  @override
  Color? transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    if (t == 1.0) return colors.last;
    final p = t * (colors.length - 1);
    final i = p.floor();
    final c1 = colors[i];
    final c2 = colors[i + 1];
    final f = p - i;
    return Color.lerp(c1, c2, f);
  }
}
