// ignore_for_file: unused_import, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste/Dropdown.dart';
import 'package:teste/definition.dart';
import 'package:teste/formula.dart';
import 'package:teste/stepbystep.dart';
import 'table.dart';

dynamic valor;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static dynamic numero;
  dynamic resultadofinal;
  var ControleInput = TextEditingController();

  void resultado(double valor) {
    setState(() {
      if (DropDown1 == "Celsius" && DropDown2 == "Celsius") {
        numero = valor;
      } else if (DropDown1 == "Celsius" && DropDown2 == "Fahrenheit") {
        numero = valor * 1.8 + 32;
      } else if (DropDown1 == "Celsius" && DropDown2 == "Kelvin") {
        numero = valor + 273;
      } else if (DropDown1 == "Celsius" && DropDown2 == "Rankine") {
        numero = valor * (9 / 5) + 491.67;
      }

      if (DropDown1 == "Fahrenheit" && DropDown2 == "Celsius") {
        numero = (valor - 32) / 1.8;
      } else if (DropDown1 == "Fahrenheit" && DropDown2 == "Fahrenheit") {
        numero = valor;
      } else if (DropDown1 == "Fahrenheit" && DropDown2 == "Kelvin") {
        numero = (valor - 32) * (5 / 9) + 273;
      } else if (DropDown1 == "Fahrenheit" && DropDown2 == "Rankine") {
        numero = valor + 459.67;
      }

      if (DropDown1 == "Kelvin" && DropDown2 == "Celsius") {
        numero = valor - 273;
      } else if (DropDown1 == "Kelvin" && DropDown2 == "Fahrenheit") {
        numero = (valor - 273) * 1.8 + 32;
      } else if (DropDown1 == "Kelvin" && DropDown2 == "Kelvin") {
        numero = valor;
      } else if (DropDown1 == "Kelvin" && DropDown2 == "Rankine") {
        numero = valor * 1.8;
      }

      if (DropDown1 == "Rankine" && DropDown2 == "Celsius") {
        numero = (valor - 491.67) * (5 / 9);
      } else if (DropDown1 == "Rankine" && DropDown2 == "Fahrenheit") {
        numero = valor - 459.67;
      } else if (DropDown1 == "Rankine" && DropDown2 == "Kelvin") {
        numero = valor * (5 / 9);
      } else if (DropDown1 == "Rankine" && DropDown2 == "Rankine") {
        numero = valor;
      }

      numero = numero.toStringAsFixed(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var ScreenHeight = size.height;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black12,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleSpacing: 0,
        backgroundColor: const Color.fromRGBO(126, 5, 1, 1),
        toolbarHeight: 65,
        title: Row(
          children: [
            Container(width: 20),
            SvgPicture.asset('assets/Term.svg',
                color: Colors.white, height: 32, width: 32),
            Text("TEMPERATURE",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            Container(width: 25),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/Share.svg',
                  color: Colors.white, height: 32, width: 32),
            ),
            IconButton(
              onPressed: () {
                ControleInput.clear();
                valor = null;
              },
              icon: SvgPicture.asset('assets/X.svg',
                  color: Colors.white, height: 32, width: 32),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: PopupMenuButton(
                position: PopupMenuPosition.under,
                iconSize: 32,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Language", style: GoogleFonts.inter()),
                  ),               
                  PopupMenuItem(
                    value: 2,
                    child: Text("About", style: GoogleFonts.inter()),
                  ),
                ],
                onSelected: (value) {
                  if (value == 1) {

                  }else {

                  }
                }),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          color: const Color.fromRGBO(237, 230, 227, 0.5),
          child: Column(
            children: [
              Container(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [               
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 34,
                    ),
                    child: DropDown("Celsius", 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 34,
                    ),
                    child: DropDown("Fahrenheit", 2),
                  ),
                ],
              ),
              Container(height: 17),
              const Text("Value",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(left: 34, right: 34),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: ControleInput,
                  cursorColor: Colors.black,
                  onChanged: (text) {
                    resultadofinal = text;
                    valor = double.tryParse(resultadofinal);
                  },
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(126, 5, 1, 1), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(126, 5, 1, 1), width: 2),
                    ),
                  ),
                ),
              ),
              Container(height: 40),
              SizedBox(
                height: 48,
                width: 307,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(126, 5, 1, 1)),
                  onPressed: () {
                    setState(() {
                      valor;
                    });
                    if (valor != null) {
                      resultado(valor);
                    }
                  },
                  child: Text(
                    "Convert",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(height: 21),
              Text(
                "Result",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(126, 5, 1, 1),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    if (valor != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: FittedBox(
                          child: Text(
                            "$valor ${Temperatura.Temperatura1} = $numero ${Temperatura.Temperatura2}",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (valor == null)
                      Text(
                        "No value has been entered!",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.public, size: 32,),
                    Text("Information",style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Formula(),
              const SizedBox(height: 10,),
              StepByStep(),
              const SizedBox(height: 10,),
              Definiton(),
              const SizedBox(height: 10,),
              Tabela(),
            ],
          ),
        ),
      ),
    );
  }
}
