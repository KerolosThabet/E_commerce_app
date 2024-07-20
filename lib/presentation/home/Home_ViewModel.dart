import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<homeState>{
  @factoryMethod
  HomeViewModel():super(HomeInitialState());
  static HomeViewModel get(context)=>BlocProvider.of(context);
  int currentIndex =0 ;

  void ChangeBottomNavIndex(int newIndex){
     currentIndex = newIndex;
    emit(HomeChangeTabState());
  }
}

abstract class homeState{}
class HomeInitialState extends homeState{}
class HomeChangeTabState extends homeState{}