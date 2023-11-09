part of 'pages.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double amount = 0.0;
  double convertedAmount = 0.0;

  final TextEditingController amountController = TextEditingController();

  Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.73,
    'JPY': 110.62,
  };

  void convertCurrency() {
    double fromRate = exchangeRates[fromCurrency] ?? 1.0;
    double toRate = exchangeRates[toCurrency] ?? 1.0;
    double inputAmount = double.tryParse(amountController.text) ?? 0.0;

    double result = (inputAmount / fromRate) * toRate;

    setState(() {
      amount = inputAmount;
      convertedAmount = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFECAA),
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan Jumlah',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: fromCurrency,
                    items: exchangeRates.keys.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        fromCurrency = newValue!;
                      });
                    },
                  ),
                  Icon(Icons.arrow_forward),
                  DropdownButton<String>(
                    value: toCurrency,
                    items: exchangeRates.keys.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        toCurrency = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: convertCurrency,
                child: Text('Konversi'),
              ),
              SizedBox(height: 16),
              Text('$amount $fromCurrency = $convertedAmount $toCurrency'),
            ],
          ),
        ),
      ),
    );
  }
}
