import '../model/cart.dart';
import 'package:stacked/stacked.dart';



class HomeViewModel extends BaseViewModel{

  List<Cart> cart = [
    Cart('assets/images/fruits.png','Fruits', 12.99),
    Cart('assets/images/vegetables.png','Vegetables', 15.99),
    Cart('assets/images/meats.png','Meats', 60.99),
  ];

  List<List<String>> tabs = [
    ['Fruits','assets/images/fruits.png'],
    ['Vegetables','assets/images/vegetables.png'],
    ['Meats','assets/images/meats.png'],
  ];



  void initialize(){
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}