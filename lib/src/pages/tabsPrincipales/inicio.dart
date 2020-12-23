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
                    Container(
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
                                      horizontal: responsive.wp(2),
                                      vertical: responsive.hp(1)),
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
                                        CircleAvatar(
                                            radius: 4,
                                            backgroundColor: Colors.black),
                                        SizedBox(
                                          width: responsive.wp(2),
                                        ),
                                        Text(
                                          'Noviembre',
                                          style: TextStyle(
                                              fontSize: responsive.ip(1.5)),
                                        ),
                                        SizedBox(
                                          width: responsive.wp(2),
                                        ),
                                        Text(
                                          'S/205',
                                          style: TextStyle(
                                              fontSize: responsive.ip(1.5)),
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
                              transform: Matrix4.translationValues(
                                  -responsive.wp(1.5), 0, 0),
                              height: responsive.hp(13),
                              width: responsive.wp(9),
                              child: Lottie.asset('assets/lottie/sad.json'),
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
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF6FDB44),
                              const Color(0xFF1BD854),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Recibos Pendientes',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: responsive.ip(2),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),Container(
                            width: responsive.wp(30),
                            child: Container(
                              transform: Matrix4.translationValues(
                                  -responsive.wp(1.5), 0, 0),
                              height: responsive.hp(13),
                              width: responsive.wp(9),
                              child: Lottie.asset('assets/lottie/esmiley.json'),
                            ),
                          )
                        ],
                      ),
                    )
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
