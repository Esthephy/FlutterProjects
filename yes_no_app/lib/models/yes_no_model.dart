import '../../domain/entities/message.dart';
class YesNoModel{
  String answer;
  bool forced;
  String image;

  YesNoModel({
   required this.answer,
   required this.forced,
   required this.image
  });

  //constructor factory  cuando llamen este constructor creara una instancia
 factory YesNoModel.fromJsonMap(Map<String,dynamic> json)=>
     YesNoModel(
         answer: json['answer'],
         forced: json['forced'],
         image: json['image']);

 Message toMessageEntity()=>Message(
     text: answer??'',
     fromWho: FromWho.hers,
     imageUrl: image
 );


}