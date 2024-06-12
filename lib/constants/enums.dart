enum HttpType {
  get,
  post,
  put,
  patch,
  delete,
}

// enum Mode { system, dark, light }
enum LabelType{title, bodyLarge , bodyMedium, bodySmall, bodySmallWhite}



class Restaurant{
  Restaurant(this.discount, this.status, {required this.name, required this.menu, required this.deliveryFee, required this.deliveryTime, required this.cuisine, required this.id});
  final String name;
  final List<String> menu;
  final int deliveryFee;
  final int deliveryTime;
  final List<String> cuisine;
  final String id;
  final String status;  //"new", for now
  final int discount;
}