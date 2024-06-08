class HairModel{
   String? color;
   String? type;
   HairModel({ required this.color, required this.type
   });

   factory HairModel.formJson(Map<String,dynamic> api){
      return HairModel(color: api['color'], type: api['type']);
   }

}