import 'package:emapach/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Estado : ',
                    style: GoogleFonts.mPlus1p(
                      textStyle: TextStyle(
                          fontSize: responsive.ip(2),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Activo ',
                    style: GoogleFonts.mPlus1p(
                      textStyle: TextStyle(
                          color: Colors.green,
                          fontSize: responsive.ip(2),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(8),
                  vertical: responsive.hp(1),
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  'Tienes recibos pendientes',
                  style: TextStyle(
                    fontSize: responsive.ip(1.8),
                  ),
                ),
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(1),
                          ),
                          width: responsive.wp(35),
                          child: Text(
                            'Periodo',
                            style: TextStyle(
                                fontSize: responsive.ip(1.8),
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: responsive.wp(1)),
                          width: responsive.wp(30),
                          child: Text(
                            'Recibo',
                            style: TextStyle(
                                fontSize: responsive.ip(1.8),
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(1),
                          ),
                          width: responsive.wp(25),
                          child: Text(
                            'Total',
                            style: TextStyle(
                                fontSize: responsive.ip(1.8),
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: responsive.wp(10),
                          //child: Icon(FontAwesomeIcons.filePdf),
                        ),
                      ],
                    );
                  }
                  if (index == 9) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: responsive.hp(1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: responsive.wp(60),
                            child: Text(
                              'Total ',
                              style: TextStyle(
                                  fontSize: responsive.ip(2),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              'S/ 50000.00 ',
                              style: TextStyle(
                                  fontSize: responsive.ip(2),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: responsive.hp(.7)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(1),
                          ),
                          width: responsive.wp(35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: responsive.ip(2),
                                width: responsive.ip(2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                              ),
                              Text(
                                'Enero',
                                style: TextStyle(
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(1),
                          ),
                          width: responsive.wp(30),
                          child: Text(
                            '500 - 1',
                            style: TextStyle(
                              fontSize: responsive.ip(1.8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(1),
                          ),
                          width: responsive.wp(25),
                          child: Text(
                            'S/. 500.50',
                            style: TextStyle(
                              fontSize: responsive.ip(1.8),
                            ),
                          ),
                        ),
                        Container(
                          width: responsive.wp(10),
                          child: Icon(
                            FontAwesomeIcons.filePdf,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(8),
                  vertical: responsive.hp(1),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  'Historial de pagos',
                  style: TextStyle(
                    fontSize: responsive.ip(1.8),
                  ),
                ),
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFFA1E1E6),
                              const Color(0xFF69A9DD),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 3.0],
                            tileMode: TileMode.clamp),
                      ),
                      margin:EdgeInsets.symmetric(horizontal: responsive.wp(5),vertical: responsive.hp(1)),
                      padding:EdgeInsets.symmetric(horizontal: responsive.wp(3),vertical: responsive.hp(1)),
                      height: responsive.hp(18),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Comprobante : ',
                                style: TextStyle(
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                              Text(
                                '56789',
                                style: TextStyle(
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                              Spacer(),
                              RaisedButton(
                                onPressed: () {},
                                child: Text('Ver más'),
                                color: Colors.green,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Lugar : ',
                                style: TextStyle(
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                              Text(
                                'Av los paujiles ',
                                style: TextStyle(
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Descripción : ',
                                style: TextStyle(
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'pago de cuotas del mes de Enero',
                                  style: TextStyle(
                                    fontSize: responsive.ip(1.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
