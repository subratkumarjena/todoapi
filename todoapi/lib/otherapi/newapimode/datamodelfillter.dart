

import 'package:todoapi/otherapi/newapimode/sizemodel.dart';

import 'brandsmodel.dart';
import 'categoriesmodel.dart';
import 'colorsmodel.dart';

class DataModelFillter{

   List<ColoresModel> ? colors;
   List<BrandsModel> ? brands;
   List<SizeModel> ? sizes;
   String? subBrands ;
   List<CategoriesModel> ? categories;
   String ? subCategories;

   DataModelFillter({ required this.colors, required this.brands, required this.sizes, required this.subBrands,
      required  this.categories, required this.subCategories});

    factory DataModelFillter.fromJson(Map<String , dynamic> api){

       List<ColoresModel> Mcoloermodel =[];
       for(Map<String,dynamic> color in api['colors']){
          ColoresModel coloerModel = ColoresModel.fromJson(color);
          Mcoloermodel.add(coloerModel);
       }
       List<SizeModel> Msizemodel =[];
       for(Map<String,dynamic> size in api['sizes']){
          SizeModel sizeModel = SizeModel.fromJson(size);
          Msizemodel.add(sizeModel);
       }

       List<BrandsModel> Mbrandmodel =[];
       for(Map<String,dynamic> brand in api['brands']){
          BrandsModel brandModel = BrandsModel.fromJson(brand);
          Mbrandmodel.add(brandModel);
       }

       // List<SubBrandsModel> Msubbrandmodel =[];
       // for(Map<String,dynamic> subbrand in api['subBrands']){
       //    SubBrandsModel subBrandsModel = SubBrandsModel.fromJson(subbrand);
       //    Msubbrandmodel.add(subBrandsModel);
       // }
       List<CategoriesModel> Mcatagorimodel =[];
       for(Map<String,dynamic> catagory in api['categories']){
          CategoriesModel CategoriesMode = CategoriesModel.fromJson(catagory);
          Mcatagorimodel.add(CategoriesMode);
       }
       // List<SubCategoriesModel> Msubcatagorimodel =[];
       // for(Map<String,dynamic> subcatagory in api['null']){
       //    SubCategoriesModel subCategoriesMode = SubCategoriesModel.fromJson(subcatagory);
       //    Msubcatagorimodel.add(subCategoriesMode);
       // }

       return DataModelFillter(
           colors: Mcoloermodel,
           brands: Mbrandmodel,
           sizes: Msizemodel,
           subBrands: api['subBrands'] ,
           categories: Mcatagorimodel,
           subCategories: api['subCategories']);
    }
}