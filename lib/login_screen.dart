import 'package:flutter/material.dart';
import 'register_screen.dart';
import '/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void _login(BuildContext context, String email, String password) {

    if (email == 'teste@gmail.com' && password == '123') {
      // Autenticação bem-sucedida
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      print('Login bem-sucedido!');
    } else {
      // Autenticação falhou
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciais inválidas. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
      print('Login falhou!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FASI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'ON',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: LoginForm(
              onLoginClick: (email, password) {
                _login(context, email, password);
              },
              onRegisterClick: () {
                _navigateToRegister(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final Function(String, String) onLoginClick;
  final Function onRegisterClick;

  LoginForm({required this.onLoginClick, required this.onRegisterClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              icon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              icon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Text('Lembre de mim'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print('Esqueceu a senha pressionado');
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                onLoginClick('teste@gmail.com', '123'); // Passa os valores dos campos de texto
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Se não tem uma conta, ',
                  style: TextStyle(),
                ),
                GestureDetector(
                  onTap: () {
                    onRegisterClick();
                  },
                  child: const Text(
                    'clique aqui',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
