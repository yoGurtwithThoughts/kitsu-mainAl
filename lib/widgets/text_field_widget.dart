import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
  bool _showLogin = true;

  void _userAction() {
    _email = _emailController.text;
    _password = _passwordController.text;

    _emailController.clear();
    _passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    Widget _input(
      TextEditingController controller, 
      String hintTitle, 
      bool obcText,
      ){
        return Container(
          child: TextField(
            controller: controller,
            obscureText: obcText,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.white30,
                fontWeight: FontWeight.w500
              ),
              hintText: hintTitle,
                ),
              )
              );
    }
    Widget _loginButton(String buttonText, void Function() onPress,){
          return ElevatedButton(
            onPressed: () {
              onPress();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(2, 217, 173, 1),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
            Shadow(
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
             ]),),
          );
        }

    Widget _form(String buttonText, void Function()  onPress) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
              const SizedBox(height: 20),
           
             Container(
               decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromRGBO(2, 217, 173, 1), width: 2),),
              child: _input(_emailController, 'Введите почту', false),
             ),
             const SizedBox(height: 20),

             Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromRGBO(2, 217, 173, 1), width: 2),),
              child: _input(_passwordController, 'Введите пароль', true),
             ),
             const SizedBox(height: 70),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),),
              child: _loginButton(buttonText, _userAction),
            )
          ],
        ),
      );
    }
    return Column(
      children:<Widget>[
      _showLogin
      ? Column(
        children: [
          _form('ВОЙТИ', _userAction),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _showLogin = false;
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 206),
              
            ),
          )
        ],
      )
      : Column(
          children: [
          _form('ВОЙТИ', _userAction),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _showLogin = false;
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 206),
              
            ),
          )
          ]
      )
      ]
    );
  }
}