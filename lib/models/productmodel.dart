class ProductModel{
  String name,image,price,description,productId;
  ProductModel({this.name,this.image,this.description,this.price,this.productId});

  ProductModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return ;
    }
    name=map['name'];
    image=map['image'];
    price=map['price'];
    description=map['description'];
    productId=map['productId'];
  }

  toJson(){
    return {
      'name':name,
      'image':image,
      'price':price,
      'description':description,
      'productId':productId,
    };
  }
}