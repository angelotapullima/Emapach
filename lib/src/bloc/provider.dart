

import 'package:emapach/src/bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';

class ProviderBloc extends InheritedWidget {
  
  final bottomNaviBloc = BottomNaviBloc();
  

  static ProviderBloc _instancia;

  //generamos un Singleton de Provider para toda la aplicacion
  factory ProviderBloc({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderBloc._internal(key: key, child: child);
    }

    return _instancia;
  }

  ProviderBloc._internal({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //Instanciamos LoginBloc para usarla en el provider del Bloc
  

   static BottomNaviBloc bottom(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())
        .bottomNaviBloc;
  }

    
}
