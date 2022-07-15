import 'package:flutter/material.dart';
import 'package:testing_work121/homepage.dart';

class WorkTest extends StatefulWidget {
  const WorkTest({Key? key}) : super(key: key);

  @override
  State<WorkTest> createState() => _WorkTestState();
}

class _WorkTestState extends State<WorkTest> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF262D34),
      body: Column(
        children: [
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/121.png")),
                borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            //margin: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'SNP Id.',
                        hintText: "SNP Id.", border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                  ),
                ),
                Container(

                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend Deca'),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF0A6E33))),
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
