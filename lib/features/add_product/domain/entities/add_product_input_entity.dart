import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;
  final String code;
  final String price;
  final File image;
  final bool isFeatured;
  // انت بتستخدم فاير بيز فانت مش بتضيف الصوره انت بتستخدم عنوان الصوره فانت محتاج ترفع الصوره على firebase storage وبعدين هوا هيرد عليك بالurl بتاعها
  final String ? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.image,
    required this.isFeatured,
     this.imageUrl,
  });
}