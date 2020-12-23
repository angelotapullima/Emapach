

import 'package:emapach/src/bloc/bottom_navigation_bloc.dart';
import 'package:emapach/src/bloc/provider.dart';
import 'package:emapach/src/pages/tabsPrincipales/acerca_de.dart';
import 'package:emapach/src/pages/tabsPrincipales/agentes.dart';
import 'package:emapach/src/pages/tabsPrincipales/consumo.dart';
import 'package:emapach/src/pages/tabsPrincipales/cuenta.dart';
import 'package:emapach/src/pages/tabsPrincipales/inicio.dart';
import 'package:emapach/src/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(Inicio());
    pageList.add(Agentes());
    pageList.add(Cuenta());
    pageList.add(Consumo());
    pageList.add(AcercaDe());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);



    final bottomBloc = ProviderBloc.bottom(context);
    if(bottomBloc.page==null){

    bottomBloc.changePage(0);
    } 

    return Scaffold(
      body: StreamBuilder(
        stream: bottomBloc.selectPageStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return IndexedStack(
            index: (bottomBloc.page == null) ? 0 : bottomBloc.page,
            children: pageList,
          );
        },
      ),
      bottomNavigationBar: bottonNaviga(responsive, bottomBloc)
    );
  }

  Widget bottonNaviga(
      Responsive responsive,  BottomNaviBloc bottomBloc) {
    return StreamBuilder(
      stream: bottomBloc.selectPageStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          selectedItemColor: Colors.green[400],
          unselectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: responsive.ip(3),
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidHeart,
                size: responsive.ip(2.7),
              ),
              label: 'Agentes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.near_me,
                size: responsive.ip(3),
              ),
              label:'Cuenta'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                      Icons.shopping_cart,
                      size: responsive.ip(3),
                    ),
              label:'Consumo',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: responsive.ip(3),
              ),
              label:'Acerca De',
            )
          ],
          currentIndex: bottomBloc.page,
          onTap: (index) => {
            bottomBloc.changePage(index),
          },
        );
      },
    );
  }
}
