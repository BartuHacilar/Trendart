class imageClass  {
  
  String base64;
  String author;
  String name;
  int price;
  String id ;
  bool? favourite = false;
 

  
 imageClass({
    
    required this.base64,
    required this.author,
    required this.name,
    required this.price,
    required this.id,
     this.favourite
   
  }); 
}