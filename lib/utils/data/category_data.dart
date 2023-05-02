
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getAllDataInCollection(String collectionName) async {
  final querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();
  return querySnapshot.docs.map((doc) => doc.data()).toList();
}



//
//   throw UnimplementedError();
// }
List categories = [
  {
    "id": "1",
    "name": "Lễ hội",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Ffestival.jpg?alt=media&token=3d94eb50-86df-4dbb-bc10-0c379d2b8ad6",
  },
  {
    "id": "2",
    "name": "Giao thông",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Ftraffic.jpg?alt=media&token=12cfd0dd-d01c-44a8-b5da-7ab85a87b0bb",
  },
  {
    "id": "3",
    "name": "Giáo dục",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Feducation.jpg?alt=media&token=b83d9485-4cd6-4b84-aa74-b4cbeac0b0af",
  },
  {
    "id": "4",
    "name": "Thể thao",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fsport.jpg?alt=media&token=d8334c9f-1207-454d-9e5a-fe7353419ca3",
  },
  {
    "id": "5",
    "name": "Gia đình",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Ffamily.jpg?alt=media&token=8db4f386-313a-41bd-8952-c388a1ff41d4",
  },
  {
    "id": "6",
    "name": "Sức khoẻ",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fhealth.jpg?alt=media&token=46fa0d61-b3ed-4c0f-9d6e-336b9609e3f1",
  },
  {
    "id": "7",
    "name": "Kỳ nghỉ",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fholiday.jpg?alt=media&token=50f856ac-0823-4187-995c-489da941bb1b",
  },
  {
    "id": "8",
    "name": "Tình bạn",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Ffriendship.jpg?alt=media&token=e2c96dfd-4003-4a41-9b6e-9aee99c4fb2b",
  },
  {
    "id": "9",
    "name": "Nghề nghiệp",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcarrer.jpg?alt=media&token=11a4ad15-e914-4143-b34b-374944f542d9",
  },
  {
    "id": "10",
    "name": "Thú cưng",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fpet.jpg?alt=media&token=e916607d-cd14-4a2e-abd1-3b5ad3cd20cd",
  },
  {
    "id": "11",
    "name": "Rau củ",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fvegetables.jpg?alt=media&token=39c07458-79e0-47e5-bc21-dc3a8a76680d",
  },
  {
    "id": "12",
    "name": "My body",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fhand.jpg?alt=media&token=d47d4811-7f1c-49c0-8988-949b8c74fbf8",
  },
  {
    "id": "13",
    "name": "Thiên văn",
    "topics": "28",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fastronomy.jpg?alt=media&token=d989984a-aec3-4044-a2dd-6b22b3695e67",
  },
];