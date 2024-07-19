import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  String _data = '';

  Future<void> _loadData() async {
    try {
      // Veri setini assets klasöründen oku
      String data = await rootBundle.loadString('assets/final_dataset.csv');
      // Okunan veriyi konsola yazdır
      setState(() {
        _data = data;
      });
    } catch (e) {
      print('Veri setini yüklerken hata oluştu: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Veri setini yükle
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: Center(
        child: _data.isEmpty
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Fitness Veri Seti',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(_data),
                      SizedBox(height: 20.0),
                      // Kullanıcı bilgilerini almak için formu ekleyin
                      UserInputForm(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class UserInputForm extends StatefulWidget {
  @override
  _UserInputFormState createState() => _UserInputFormState();
}

class _UserInputFormState extends State<UserInputForm> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _result = '';

  // Kullanıcı bilgilerini al ve öneri algoritmasını çağır
  void _submit() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;
    int age = int.tryParse(_ageController.text) ?? 0;

    // Öneri algoritmasını çağır
    String result = _getRecommendation(height, weight, age);

    setState(() {
      _result = result;
    });
  }

  // Öneri algoritması
  String _getRecommendation(double height, double weight, int age) {
    // Burada öneri algoritmasını yazabilirsiniz.
    // Örneğin, veri setindeki egzersizler ve kullanıcı bilgileri
    // arasında bir ilişki kurarak uygun egzersizleri belirleyebilirsiniz.
    // Bu örnekte basit bir mesaj döndürüyoruz.
    return 'Öneri: Yüzme, koşu ve ağırlık antrenmanlarına başlayabilirsiniz.';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Kullanıcı Bilgileri',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 10.0),
        TextFormField(
          controller: _heightController,
          decoration: InputDecoration(labelText: 'Boy (cm)'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          controller: _weightController,
          decoration: InputDecoration(labelText: 'Kilo (kg)'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          controller: _ageController,
          decoration: InputDecoration(labelText: 'Yaş'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: _submit,
          child: Text('Öneri Al'),
        ),
        SizedBox(height: 10.0),
        Text(
          _result,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
