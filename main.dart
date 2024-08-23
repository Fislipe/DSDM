import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas/database/dao/receitadao.dart';
import 'package:receitas/model/receita.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;

  // sessao de add receita
  Receita coca = Receita(
    id: 1,
    nome: "Coquinha Gelada",
    image: "assets/images/coca.png",
    ingredientes: "1 Lata de Coca-Cola, Gelo a gosto",
    modopreparo: "Abra a coquinha e coloque-a em um copo com gelos.",
  );

  Receita ovoCozido = Receita(
    id: 2,
    nome: "Ovo Cozido",
    image: "assets/images/ovoco.png",
    ingredientes: "Ovos",
    modopreparo:
        "Coloque os ovos em uma panela e colque agua até cobrir os ovos leve a panela com os ovos ao fogo e ferva os ovos por 7 minutos.",
  );

  Receita miojo = Receita(
    id: 3,
    nome: "Miojo",
    image: "assets/images/miojo.png",
    ingredientes: "1 Miojo e água",
    modopreparo:
        "Abra o pacote de miojo e coloque-o em uma panela, adicione água e leve ao fogo por 5 minutos .",
  );

  Receita pipocasal = Receita(
    id: 4,
    nome: "Pipoca Salgada",
    image: "assets/images/pipocasal.png",
    ingredientes:
        "2 colheres (sopa) de óleo (30ml), 1 xícara de milho (cerca de 200 ml) de pipoca e cerca de 1 colher (chá) de sal (5 ml)",
    modopreparo:
        "Coloque o óleo em uma panela grande e ligue em fogo alto quando o óleo estiver bem quente adicione o milho, tampe a panela e chacoalhe um pouco e coloque em fogo médio e deixe o milho estourar, quando não ouvir mais estouros, desligue o fogo Adicione o sal e chacoalhe bem coloque a pipoca em uma vasilha e aproveite.",
  );

  Receita piraoagua = Receita(
    id: 5,
    nome: "Pirão de Água",
    image: "assets/images/piraoagua.png",
    ingredientes:
        "2 xícaras de cafezinho de farinha de mandioca 1 colher de cafezinho de sal 500 ml de água 1 colher de sopa de manteiga",
    modopreparo:
        "Coloque todos os ingredientes em uma panela e leve ao fogo médio, mexa sempre, até que forme uma massa inteira e consistente, assim virando um pirão! Deve durar cerca de 5 a 7 minutos. ",
  );
  await insertReceita(piraoagua);
  await insertReceita(pipocasal);
  await insertReceita(miojo);
  await insertReceita(coca);
  await insertReceita(ovoCozido);
//fim da add receitas
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
        title: Text('Culinária Fácil Pra Burro',
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
                  // Receita Coquinha Gelada
                  FutureBuilder(
                    future: findReceitaById(1),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro ao carregar receita');
                      } else if (snapshot.hasData) {
                        Receita receita = snapshot.data as Receita;
                        return Column(
                          children: [
                            Text(
                              receita.nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(receita.image)),
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
                                      builder: (context) =>
                                          TelaReceita(receita: receita),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    backgroundColor:
                                        Color.fromRGBO(113, 93, 74, 0.807)),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('Nenhuma receita encontrada');
                      }
                    },
                  ),

                  FutureBuilder(
                    future: findReceitaById(4),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro ao carregar receita');
                      } else if (snapshot.hasData) {
                        Receita receita = snapshot.data as Receita;
                        return Column(
                          children: [
                            Text(
                              receita.nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(receita.image)),
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
                                      builder: (context) =>
                                          TelaReceita(receita: receita),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    backgroundColor:
                                        Color.fromRGBO(113, 93, 74, 0.807)),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('Nenhuma receita encontrada');
                      }
                    },
                  ),
                  // receita ovo
                  FutureBuilder(
                    future: findReceitaById(2),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro ao carregar receita');
                      } else if (snapshot.hasData) {
                        Receita receita = snapshot.data as Receita;
                        return Column(
                          children: [
                            Text(
                              receita.nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(receita.image)),
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
                                      builder: (context) =>
                                          TelaReceita(receita: receita),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    backgroundColor:
                                        Color.fromRGBO(113, 93, 74, 0.807)),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('Nenhuma receita encontrada');
                      }
                    },
                  ),
                  // Receita miojo
                  FutureBuilder(
                    future: findReceitaById(3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro ao carregar receita');
                      } else if (snapshot.hasData) {
                        Receita receita = snapshot.data as Receita;
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                receita.nome,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(receita.image)),
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
                                      builder: (context) =>
                                          TelaReceita(receita: receita),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    backgroundColor:
                                        Color.fromRGBO(113, 93, 74, 0.807)),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('Nenhuma receita encontrada');
                      }
                    },
                  ),
                  FutureBuilder(
                    future: findReceitaById(5),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro ao carregar receita');
                      } else if (snapshot.hasData) {
                        Receita receita = snapshot.data as Receita;
                        return Column(
                          children: [
                            Text(
                              receita.nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(receita.image)),
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
                                      builder: (context) =>
                                          TelaReceita(receita: receita),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    backgroundColor:
                                        Color.fromRGBO(113, 93, 74, 0.807)),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('Nenhuma receita encontrada');
                      }
                    },
                  ),
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

class TelaReceita extends StatelessWidget {
  final Receita receita;

  TelaReceita({required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          receita.nome,
          style: GoogleFonts.montserrat(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 251, 251, 251),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(receita.image),
              ),
            ),
            Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(receita.ingredientes, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16.0),
            Text(
              'Modo de Preparo:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(receita.modopreparo, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
