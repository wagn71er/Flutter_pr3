import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(244, 255, 255, 255), 
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                ),            
            primary: const Color.fromARGB(255, 34, 34, 34), 
            onPrimary: Color.fromARGB(255, 255, 255, 255), 
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ToyotaScreen(),
        '/search': (context) => ServiceSearchScreen(), 
      },
    );
  }
}

class ToyotaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Центр Toyota'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Выбор услуги'), // Изменил текст
          onPressed: () => Navigator.pushNamed(context, '/search'),
        ),
      ),
    );
  }
}

class ServiceSearchScreen extends StatefulWidget { 
  @override
  _ServiceSearchScreenState createState() => _ServiceSearchScreenState(); 
}

class _ServiceSearchScreenState extends State<ServiceSearchScreen> { 
  final TextEditingController _phoneController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _sendConsultationRequest() {
    _showSnackBar("Консультационный запрос отправлен. Номер телефона: ${_phoneController.text}"); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сервисный Центр'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showSnackBar("Запись на ТО"),
              child: const Text('Техническое обслуживание'), 
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar("Запись на диагностику"),
              child: const Text('Диагностика'), 
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar("Запись на ремонт"),
              child: const Text('Ремонт'), 
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Ваш номер телефона', 
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendConsultationRequest,
              child: const Text('Отправка заявки на консультацию'), 
            ),
          ],
        ),
      ),
    );
  }
}