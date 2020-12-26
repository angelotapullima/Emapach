import 'dart:math';

import 'package:emapach/src/pages/samples.dart';
import 'package:emapach/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consumo extends StatelessWidget {
  const Consumo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xff232040),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  color: const Color(0xff232040),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Consumo del mes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: responsive.ip(4),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: BarChartSample3(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: responsive.wp(35),
                              child: Text(
                                'Periodo',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: responsive.ip(2),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              width: responsive.wp(22),
                              child: Text(
                                'Categoría',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: responsive.ip(2),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              width: responsive.wp(23),
                              child: Text(
                                'Consumo (m3)',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: responsive.ip(2),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              width: responsive.wp(20),
                              child: Text(
                                'Monto',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: responsive.ip(2),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 20,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: null,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          int montoRan = Random().nextInt(200);
                          double consumo = Random().nextInt(200) * 1.5;

                          return Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  width: responsive.wp(35),
                                  child: Text(
                                    fechaMes(index),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: responsive.ip(2),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: responsive.wp(22),
                                  child: Text(
                                    'Directa',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: responsive.ip(2),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: responsive.wp(23),
                                  child: Text(
                                    consumo.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: responsive.ip(2),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: responsive.wp(20),
                                  child: Text(
                                    'S/. $montoRan ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: responsive.ip(2),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String fechaMes(int mes) {
    switch (mes.toInt()) {
      case 0:
        return 'Enero';
      case 1:
        return 'Febrero';
      case 2:
        return 'Marzo';
      case 3:
        return 'Abril';
      case 4:
        return 'Mayo';
      case 5:
        return 'Junio';
      case 6:
        return 'Julio';
      case 7:
        return 'Agosto';
      case 8:
        return 'Septiembre';
      case 9:
        return 'Octubre';
      case 10:
        return 'Noviembre';
      case 11:
        return 'Diciembre';
      default:
        return '';
    }
  }
}
