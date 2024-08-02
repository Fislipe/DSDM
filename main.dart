import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Culinaria fácil pra burro',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 25, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
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
                    Text(
                      'miojo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
