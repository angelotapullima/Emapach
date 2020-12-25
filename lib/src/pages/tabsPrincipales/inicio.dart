import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emapach/src/utils/customCacheManager.dart';
import 'package:emapach/src/utils/preferencias_usuario.dart';
import 'package:emapach/src/utils/responsive.dart';
import 'package:emapach/src/widgets/sliver_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preferences = Preferences();
    final responsive = Responsive.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HeaderWidget(responsive: responsive, preferences: preferences),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: responsive.hp(.5),
                    ),

                    //Listview de suministros
                    ListSuministros(responsive: responsive),
                    SizedBox(
                      height: responsive.hp(.5),
                    ),
                    //recibos pendientes
                    RecibosPendientes(responsive: responsive),
                    SizedBox(
                      height: responsive.hp(.5),
                    ),
                    //estas al día en tus pagos
                    EstasAlDia(responsive: responsive),
                    SizedBox(
                      height: responsive.hp(.5),
                    ),
                    //suministros desplegable
                    SuministrosDesplegables(responsive: responsive),
                    SizedBox(
                      height: responsive.hp(.5),
                    ),

                    Container(
                      height: responsive.hp(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF1393B3),
                              const Color(0xFF72CAE0),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsive.wp(5),
                            ),
                            width: responsive.wp(65),
                            child: Text(
                              'Conoce tu recibo!',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: responsive.ip(2),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: responsive.wp(30),
                            child: Container(
                              transform: Matrix4.translationValues(
                                  -responsive.wp(1.5), 0, 0),
                              height: responsive.hp(13),
                              width: responsive.wp(9),
                              child: Lottie.asset('assets/lottie/recibo.json'),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: responsive.hp(.5),
                    ),
                    Container(
                      height: responsive.hp(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFFE994DB),
                              const Color(0xFF7E1670),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsive.wp(5),
                            ),
                            width: responsive.wp(65),
                            child: Text(
                              'Conoce el estado de tu reclamo!',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: responsive.ip(2),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: responsive.wp(30),
                            child: Container(
                              transform: Matrix4.translationValues(
                                  -responsive.wp(1.5), 0, 0),
                              height: responsive.hp(13),
                              width: responsive.wp(9),
                              child:
                                  Lottie.asset('assets/lottie/reclamos.json'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuministrosDesplegables extends StatelessWidget {
  const SuministrosDesplegables({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.blueGrey[100],
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Suministros',
                  style: TextStyle(
                      fontSize: responsive.ip(1.8),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              );
            }
            int algo = Random().nextInt(56788);
            return ExpandableListView(
              suministro: algo * index,
            );
          }),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final int suministro;
  ExpandableListView({
    Key key,
    this.suministro,
  }) : super(key: key);

  @override
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;
  String saldoActual;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.hp(0.2)),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Suministro : ${widget.suministro}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  IconButton(
                      icon: Container(
                        height: responsive.ip(10),
                        width: responsive.ip(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            expandFlag
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      }),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                expandFlag = !expandFlag;
              });
            },
          ),
          ExpandableContainer(
            expanded: expandFlag,
            expandedHeight: 1,
            child: Container(
              padding: EdgeInsets.only(
                left: responsive.wp(1),
                top: responsive.hp(1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: responsive.wp(85),
                    child: ListView(
                      children: [
                        Text(
                          'N° de suministro: ${widget.suministro}',
                          style: TextStyle(
                              fontSize: responsive.ip(1.9),
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Dirección: Alzamora 956, Urb. la Pradera'),
                        Text('Razón Social: Cruzado Espinoza'),
                        Text('Estado de conexión: Habilitado'),
                      ],
                    ),
                  ),
                  Container(
                    width: responsive.wp(5),
                    child:
                        Icon(Icons.check_circle_rounded, color: Colors.green),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final int expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final responsive = Responsive.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight * responsive.hp(20) : collapsedHeight,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.transparent),
        ),
      ),
    );
  }
}

class EstasAlDia extends StatelessWidget {
  const EstasAlDia({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.hp(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF358814),
              const Color(0xFF1BD854),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            width: responsive.wp(65),
            child: Text(
              'Felicitaciones , estas al día en tus pagos!',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: responsive.ip(2),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: responsive.wp(30),
            child: Container(
              transform: Matrix4.translationValues(-responsive.wp(1.5), 0, 0),
              height: responsive.hp(13),
              width: responsive.wp(9),
              child: Lottie.asset('assets/lottie/esmiley.json'),
            ),
          )
        ],
      ),
    );
  }
}

class RecibosPendientes extends StatelessWidget {
  const RecibosPendientes({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.hp(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFFDB6F44),
              const Color(0xFFD8211B),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: responsive.wp(60),
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: responsive.wp(2), vertical: responsive.hp(1)),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Text(
                        'Recibos Pendientes',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: responsive.ip(2),
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return Row(
                      children: [
                        CircleAvatar(radius: 4, backgroundColor: Colors.black),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          'Noviembre',
                          style: TextStyle(fontSize: responsive.ip(1.5)),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          'S/205',
                          style: TextStyle(fontSize: responsive.ip(1.5)),
                        ),
                        Spacer(),
                        Icon(Icons.forward)
                      ],
                    );
                  }),
            ),
          ),
          Container(
            width: responsive.wp(30),
            child: Container(
              transform: Matrix4.translationValues(-responsive.wp(1.5), 0, 0),
              height: responsive.hp(13),
              width: responsive.wp(9),
              child: Lottie.asset('assets/lottie/sad.json'),
            ),
          )
        ],
      ),
    );
  }
}

class ListSuministros extends StatelessWidget {
  const ListSuministros({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.hp(10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: responsive.wp(1),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFFBD44DB),
                        const Color(0xFF580A77),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                height: responsive.hp(9),
                width: responsive.wp(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline_outlined,
                        color: Colors.white),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Text(
                      'Agrega un suministro',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: responsive.wp(1),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF518CE4),
                      const Color(0xFF110A77),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              height: responsive.hp(9),
              width: responsive.wp(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'suministro : 2034050',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: responsive.hp(.5),
                  ),
                  Text(
                    'Dirección : Alzamora 956',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    @required this.responsive,
    @required this.preferences,
  }) : super(key: key);

  final Responsive responsive;
  final Preferences preferences;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        maxHeight: responsive.hp(8),
        minHeight: responsive.hp(8),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: responsive.ip(5),
                    height: responsive.ip(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://nteve.com/wp-content/uploads/2020/04/SUSY-FOTO1-777x445.jpg',
                        cacheManager: CustomCacheManager(),
                        placeholder: (context, url) => Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image(
                              image: AssetImage('assets/loading.gif'),
                              fit: BoxFit.contain),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: responsive.wp(3),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Buenos días'),
                      Text(
                        'Wendolyn',
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: responsive.ip(2),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.bell,
                    size: responsive.ip(3),
                  )
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
