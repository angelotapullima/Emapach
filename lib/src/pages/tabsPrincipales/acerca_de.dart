import 'package:emapach/src/utils/responsive.dart';
import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SuministrosDesplegables();
  }
}

class SuministrosDesplegables extends StatelessWidget {
  final List<String> listTarifa = [
    'Tarifas Agua y Alcantarillado',
    'Tarifas Colaterales'
  ];

  List<String> listReqTramites = [
    "Solicitud de Cambio de titular",
    "Solicitud de Cambio de Categoria",
    "Solicitud de Corte temporal",
    "Solicitud de Compromiso al pago de las facturas por la prestación de servicio",
    "Solicitud de Reapertura de Servicios de cortado a Solicitud",
    "Formato para los nuevos Clientes",
  ];

  List<String> listReclamos = [
    "Procedimiento para Reclamos",
    "Flujo de Reclamo",
  ];

  List<String> listServicios = [
    "Requisitos para Conexión Nueva de Agua y Alcantarillado",
    "Requisitos para Instalación de Medidor",
    "Requisitos para Cambio de Nombre",
    "Requisitos para Factibilidad"
  ];
  List<String> listValoresAd = [
    "Guía Informativa - VMA",
    "Normas Legales - VMA",
    "Laboratorios Acreditados - VMA"
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
        child: ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 38.0),
        child: Text(
          'ORIENTACION AL CLIENTE',
          style: TextStyle(
              fontSize: responsive.ip(3),
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      ExpandableListView2("Tarifa", listTarifa),
      ExpandableListView2("Requisitos para tramites", listReqTramites),
      ExpandableListView2("Procedimiento para Reclamos", listReclamos),
      ExpandableListView2("Requisitos para Servicios", listServicios),
      ExpandableListView2("Valores Máximos Admisibles VMA", listValoresAd),
      // ExpandableListView2(
      //     "Eliminar mis conexiones", ["Suministro 00001", "Suministro 00002"]),

      // ExpandableListView2("Conoce tu Recibo", ["Grafico de recibo"]),
      Text("Eliminar mis conexiones",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
      Divider(
        color: Colors.grey,
      ),
      Container(
        margin: EdgeInsets.only(right: 60, left: 10),
        child: Card(
          child: ListTile(
            onTap: () {},
            //leading: Icon(Icons.whatshot_outlined),
            title: Text('Suministro 00001'),
            trailing: Icon(
              Icons.cancel,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 60, left: 10),
        child: Card(
          child: ListTile(
            onTap: () {},
            //leading: Icon(Icons.whatshot_outlined),
            title: Text('Suministro 00002'),
            trailing: Icon(
              Icons.cancel,
              color: Colors.blue,
            ),
          ),
        ),
      ),

      RaisedButton(
        onPressed: () {},
        child: Text("Cerrar Sesion",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.green,
      )
    ]));
  }
}

class ExpandableListView2 extends StatefulWidget {
  final String titulo;
  List<String> lista = List();
  ExpandableListView2(this.titulo, this.lista);

  @override
  _ExpandableListViewState2 createState() => _ExpandableListViewState2();
}

class _ExpandableListViewState2 extends State<ExpandableListView2> {
  bool expandFlag = false;

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
              height: responsive.hp(10),
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${widget.titulo}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
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
              child: Container(
                //width: responsive.wp(25),
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount: widget.lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        leading: Text('${index + 1}.-'),
                        //Icon(Icons.whatshot_outlined),
                        title: Text('${widget.lista[index]}'),
                        trailing: Icon(
                          Icons.arrow_downward,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  },
                ),
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
