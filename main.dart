import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Culinaria fácil pra burro',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 25, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'NOSSAS RECEITAS DELICIOSAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Bem-vindos à nossa sessão de receitas criada por especialistas culinários! Aqui você encontrará receitas nunca antes vistas!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  // receita 1
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Miojo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset('assets/images/miojo.png')),
                  ),
                  Center(
                    child: TextButton(
                      child: Text(
                        "Ver Receita",
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Receita(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(113, 93, 74, 0.807)),
                    ),
                    // fim receita 1
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Ovo Cozido',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset('assets/images/ovoco.png')),
                  ),
                  Center(
                      child: TextButton(
                    child: Text(
                      "Ver Receita",
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Receita(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Color.fromRGBO(113, 93, 74, 0.807)),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/foto_banner.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

// PG de receita
class Receita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dsawdsawdsawdsawdsaw',
            style: GoogleFonts.montserrat(fontSize: 25, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'mojo dawnidiawonda',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
