import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'hello_world_page.dart';

class BiometricAuthPage extends StatefulWidget {
  const BiometricAuthPage({super.key});

  @override
  State<BiometricAuthPage> createState() => _BiometricAuthPageState();
}

class _BiometricAuthPageState extends State<BiometricAuthPage> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'No autorizado';

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Por favor autentícate para acceder',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print(e);
    }
    setState(() {
      _authorized = authenticated ? 'Autenticado' : 'No autorizado';
      if (authenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelloWorldPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticación Biométrica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Autenticarse con biometría'),
            ),
            SizedBox(height: 16),
            Text('Estado: $_authorized'),
          ],
        ),
      ),
    );
  }
}
