import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getAllDataInCollection(
    String collectionName) async {
  final querySnapshot = await FirebaseFirestore.instance.collection(
      collectionName).get();
  return querySnapshot.docs.map((doc) => doc.data()).toList();
}


//
//   throw UnimplementedError();
// }
List categories =
[
  {
    "id": "color",
    "image": "v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fcolor.png?alt=media&token=1b3acdfb-417b-40cc-aaec-6145cff7e5ef",
    "name": "Colors",
    "score": 100,
    "words": 10,
    "status": 0,
    "word_list": [
      {
        "word_id": "1",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fgray.png?alt=media&token=3389e063-dad6-44d1-8de6-cc418d577b66",
        "vocab": "gray",
        "pronoun": "/ɡreɪ/",
        "type": "adjective",
        "meaning": "màu xám"
      },
      {
        "word_id": "2",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fblack.png?alt=media&token=b9d9f53f-86f6-4655-942a-3f34a7bde42f",
        "vocab": "black",
        "pronoun": "/blæk/",
        "type": "adjective",
        "meaning": "màu đen"
      },
      {
        "word_id": "3",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fblue.png?alt=media&token=abdc279d-663e-4244-bbfa-ff5edb28d730",
        "vocab": "blue",
        "pronoun": "/bluː/",
        "type": "adjective",
        "meaning": "màu xanh"
      },
      {
        "word_id": "4",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fbrown.png?alt=media&token=f9de61c8-98be-4ed5-af3d-66c7909a00d5",
        "vocab": "brown",
        "pronoun": "/braʊn/",
        "type": "adjective",
        "meaning": "màu nâu"
      },
      {
        "word_id": "5",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fgreen.png?alt=media&token=4ffac2a8-ade4-4c94-b305-8978ac9007a8",
        "vocab": "green",
        "pronoun": "/ɡriːn/",
        "type": "adjective",
        "meaning": "màu xanh lá"
      },
      {
        "word_id": "6",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Forange.png?alt=media&token=fd7933e5-7521-4003-a2d1-62b08700e656",
        "vocab": "orange",
        "pronoun": "/ˈɒr.ɪndʒ/",
        "type": "adjective",
        "meaning": "màu cam"
      },
      {
        "word_id": "7",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fpink.png?alt=media&token=6913f52f-593b-477d-befe-72218e1fa936",
        "vocab": "pink",
        "pronoun": "/pɪŋk/",
        "type": "adjective",
        "meaning": "màu hồng"
      },
      {
        "word_id": "8",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fpurple.png?alt=media&token=80f2937c-1c8e-46e2-ab51-2c2fbd9ac005",
        "vocab": "purple",
        "pronoun": "/ˈpɜː.pəl/",
        "type": "adjective",
        "meaning": "màu tím"
      },
      {
        "word_id": "9",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fred.png?alt=media&token=d9771b8a-46ce-4d7e-9907-d72e8cecd2f2",
        "vocab": "red",
        "pronoun": "/red/",
        "type": "adjective",
        "meaning": "màu đỏ"
      },
      {
        "word_id": "10",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcolors%2Fyellow.png?alt=media&token=8fbffa1b-7956-43b2-92c8-1848e5ff271d",
        "vocab": "yellow",
        "pronoun": "/ˈjel.əʊ/",
        "type": "adjective",
        "meaning": "màu vàng"
      }
    ]
  },
  {
    "id": "career",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fcareer.png?alt=media&token=e2cf6166-b234-4311-b077-5e6a84009529",
    "name": "Careers",
    "score": 200,
    "words": 20,
    "status": 0,
    "word_list": [
      {
        "word_id": "1",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fchef.png?alt=media&token=577260b1-e778-40b1-9871-75322ea19975",
        "vocab": "chef",
        "pronoun": "/ʃef/",
        "type": "noun",
        "meaning": "đầu bếp"
      },
      {
        "word_id": "2",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fdentist.png?alt=media&token=3d36da1d-6df3-4d22-b5c3-087333eb23ca",
        "vocab": "dentist",
        "pronoun": "/ˈden.tɪst/",
        "type": "noun",
        "meaning": "nha sĩ"
      },
      {
        "word_id": "3",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fdoctor.png?alt=media&token=1291e389-049c-4481-8881-f7dcd7cb3dc7",
        "vocab": "doctor",
        "pronoun": "/ˈdɒk.tər/",
        "type": "noun",
        "meaning": "bác sĩ"
      },
      {
        "word_id": "4",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fwaiter.png?alt=media&token=f86ab378-5c17-4b08-95a7-df336bc9f6f5",
        "vocab": "waiter",
        "pronoun": "/ˈweɪ.tər/",
        "type": "noun",
        "meaning": "phục vụ bàn"
      },
      {
        "word_id": "5",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fengineer.png?alt=media&token=08625351-1701-4bcc-9a20-47d1c5227c58",
        "vocab": "engineer",
        "pronoun": "/ˌen.dʒɪˈnɪər/",
        "type": "noun",
        "meaning": "kỹ sư"
      },
      {
        "word_id": "6",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Ffireman.png?alt=media&token=c2160484-7675-4df7-b6d1-4a96a4b581cd",
        "vocab": "fireman",
        "pronoun": "/ˈfaɪə.mən/",
        "type": "noun",
        "meaning": "lính cứu hỏa"
      },
      {
        "word_id": "7",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fhairdresser.png?alt=media&token=7ed632d4-6015-45cf-96ce-e423ca9d8ffc",
        "vocab": "hairdresser",
        "pronoun": "/ˈheəˌdres.ər/",
        "type": "noun",
        "meaning": "thợ cắt tóc"
      },
      {
        "word_id": "8",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Flawyer.png?alt=media&token=4706ae47-468a-4e2c-9e8e-b8c90ed88841",
        "vocab": "lawyer",
        "pronoun": "/ˈlɔɪ.ər/",
        "type": "noun",
        "meaning": "luật sư"
      },
      {
        "word_id": "9",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fmechanic.png?alt=media&token=a983c0f9-b9df-4236-af40-f48b4352a3b2",
        "vocab": "mechanic",
        "pronoun": "/məˈkæn.ɪk/",
        "type": "noun",
        "meaning": "thợ cơ khí"
      },
      {
        "word_id": "10",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fnurse.png?alt=media&token=3fcfa9fd-f4bd-4e7f-8214-0c8592f59a1c",
        "vocab": "nurse",
        "pronoun": "/nɜːs/",
        "type": "noun",
        "meaning": "y tá"
      },
      {
        "word_id": "11",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fpainter.png?alt=media&token=ad411733-d2ec-45ac-8b92-03b88653a293",
        "vocab": "painter",
        "pronoun": "/ˈpeɪn.tər/",
        "type": "noun",
        "meaning": "họa sĩ"
      },
      {
        "word_id": "12",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fphotographer.png?alt=media&token=7bc6a737-fc24-4a35-ace5-a10d45a323c0",
        "vocab": "photographer",
        "pronoun": "/fəˈtɒɡ.rə.fər/",
        "type": "noun",
        "meaning": "nhiếp ảnh gia"
      },
      {
        "word_id": "13",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fpilot.png?alt=media&token=f396b23d-c6a1-4e48-b7f6-bc1f58e70726",
        "vocab": "pilot",
        "pronoun": "/ˈpaɪ.lət/",
        "type": "noun",
        "meaning": "phi công"
      },
      {
        "word_id": "14",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fpoliceman.png?alt=media&token=ae9955db-9a77-40e4-b13d-48a60d3e9156",
        "vocab": "policeman",
        "pronoun": "/pəˈliːs.mən/",
        "type": "noun",
        "meaning": "cảnh sát"
      },
      {
        "word_id": "15",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fpostman.png?alt=media&token=818cae61-26b8-49f2-b95c-7904bd322ecd",
        "vocab": "postman",
        "pronoun": "/ˈpəʊst.mən/",
        "type": "noun",
        "meaning": "người đưa thư"
      },
      {
        "word_id": "16",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fscientist.png?alt=media&token=88e1ed69-b6fd-4769-9542-d8b18dfc9b7b",
        "vocab": "scientist",
        "pronoun": "/ˈsaɪən.tɪst/",
        "type": "noun",
        "meaning": "nhà khoa học"
      },
      {
        "word_id": "17",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fsecretary.png?alt=media&token=1db0c973-51a0-4fff-b8b8-bebabd6a3d39",
        "vocab": "secretary",
        "pronoun": "/ˈsek.rə.tər.i/",
        "type": "noun",
        "meaning": "thư ký"
      },
      {
        "word_id": "18",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fsoldier.png?alt=media&token=ad0b7cd6-3069-4aab-b66a-cc0ce47dde4d",
        "vocab": "soldier",
        "pronoun": "/ˈsəʊl.dʒər/",
        "type": "noun",
        "meaning": "bộ đội"
      },
      {
        "word_id": "19",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Ftailor.png?alt=media&token=a874a821-3a95-4ea2-a14e-65c7be2df5b7",
        "vocab": "tailor",
        "pronoun": "/ˈteɪ.lər/",
        "type": "noun",
        "meaning": "thợ may"
      },
      {
        "word_id": "20",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fcareers%2Fteacher.png?alt=media&token=56383d76-65a0-44bb-baae-549cc60aed60",
        "vocab": "teacher",
        "pronoun": "/ˈtiː.tʃər/",
        "type": "noun",
        "meaning": "giáo viên"
      }
    ]
  },
  {
    "id": "dayofweek",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Fweek.png?alt=media&token=f131ea37-5d73-4f5a-9cfd-e18894185f05",
    "name": "Days of the week",
    "score": 70,
    "words": 7,
    "status": 0,
    "word_list": [
      {
        "word_id": "1",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Fmonday.png?alt=media&token=81bcc657-d3b3-47a2-8299-64a6f00d31c0",
        "vocab": "Monday",
        "pronoun": "/ˈmʌn.deɪ/",
        "type": "noun",
        "meaning": "Thứ hai"
      },
      {
        "word_id": "2",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Ftuesday.png?alt=media&token=f957421c-80d3-41c1-9e3f-1382698f7467",
        "vocab": "Tuesday",
        "pronoun": "/ˈtʃuːz.deɪ/",
        "type": "noun",
        "meaning": "Thứ ba"
      },
      {
        "word_id": "3",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Fwednesday.png?alt=media&token=293b30c6-d39a-4aaa-8070-ce2888cf54ac",
        "vocab": "Wednesday",
        "pronoun": "/ˈwenz.deɪ/",
        "type": "noun",
        "meaning": "Thứ tư"
      },
      {
        "word_id": "4",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Fthursday.png?alt=media&token=518eb047-a368-43f4-99d7-c3eb76b2914d",
        "vocab": "Thursday",
        "pronoun": "/ˈθɜːz.deɪ/",
        "type": "noun",
        "meaning": "Thứ năm"
      },
      {
        "word_id": "5",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Ffriday.png?alt=media&token=2e185886-f034-4cc9-b868-34294e2e9535",
        "vocab": "Friday",
        "pronoun": "/ˈfraɪ.deɪ/",
        "type": "noun",
        "meaning": "Thứ sáu"
      },
      {
        "word_id": "6",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Fsaturday.png?alt=media&token=6dea5941-60c0-4519-a850-cf77bb45ef20",
        "vocab": "Saturday",
        "pronoun": "/ˈsæt.ə.deɪ/",
        "type": "noun",
        "meaning": "Thứ bảy"
      },
      {
        "word_id": "7",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fdayofweek%2Fsunday.png?alt=media&token=5f16a116-281d-4c92-967e-433694873530",
        "vocab": "Sunday",
        "pronoun": "/ˈsʌn.deɪ/",
        "type": "noun",
        "meaning": "Chủ nhật"
      }
    ]
  },
  {
    "id": "bodypart",
    "image": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2Fbody.jpg?alt=media&token=35454b7a-383a-47d0-b400-701dc1b3bccb",
    "name": "Body parts",
    "score": 300,
    "words": 30,
    "status": 0,
    "word_list": [
      {
        "word_id": "1",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2Fhead.jpg?alt=media&token=16090566-e5b6-42ee-9f5d-c93a3a9b54a0",
        "vocab": "Head",
        "pronoun": "/hed/",
        "type": "noun",
        "meaning": "Đầu"
      },
      {
        "word_id": "2",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2Fface.png?alt=media&token=d273360c-63eb-42e5-8d43-d2a8d1f4b2d0",
        "vocab": "Face",
        "pronoun": "/feɪs/",
        "type": "noun",
        "meaning": "Khuôn mặt"
      },

      {
        "word_id": "3",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2Fear.jpg?alt=media&token=185ac167-ee87-4acd-afc1-d17cd834696a",
        "vocab": "Ear",
        "pronoun": "/ɪə/",
        "type": "noun",
        "meaning": "Tai"
      },
      {
        "word_id": "4",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FEyebrows.jpg?alt=media&token=070f8f1f-c0e6-47e6-9427-e7d87e45f7b8",
        "vocab": "Eyebrows",
        "pronoun": "/aɪbraʊz/",
        "type": "noun",
        "meaning": "Lông mày"
      },
      {
        "word_id": "5",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FEyelashes.jpg?alt=media&token=e62ab43a-beda-4537-a343-22b4b7e788cf",
        "vocab": "Eyelashes",
        "pronoun": "/aɪlæʃɪz/",
        "type": "noun",
        "meaning": "Lông mi"
      },
      {
        "word_id": "6",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FEyes.png?alt=media&token=6b3ac107-5381-4e15-9a19-e42ca7e2aa8e",
        "vocab": "Eyes",
        "pronoun": "/aɪz/",
        "type": "noun",
        "meaning": "Mắt"
      },
      {
        "word_id": "7",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FNose.jpg?alt=media&token=9d92143b-67f8-4439-aeed-15190e7cd4a4",
        "vocab": "Nose",
        "pronoun": "/nəʊz/",
        "type": "noun",
        "meaning": "Mũi"
      },
      {
        "word_id": "8",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FChin.jpg?alt=media&token=54327aeb-a5c6-421a-adb1-ce262b65c654",
        "vocab": "Chin",
        "pronoun": "/tʃɪn/",
        "type": "noun",
        "meaning": "Cằm"
      },
      {
        "word_id": "9",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FLips.jpg?alt=media&token=35227496-a0bc-4ba8-a233-9b6e0e976594",
        "vocab": "Lips",
        "pronoun": "/lɪps/",
        "type": "noun",
        "meaning": "Môi"
      },
      {
        "word_id": "10",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FMouth.png?alt=media&token=7e9d4532-5a6b-45fc-a6bb-890856bfced1",
        "vocab": "Mouth",
        "pronoun": "/maʊθ/",
        "type": "noun",
        "meaning": "Miệng"
      },
      {
        "word_id": "11",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FTeeth.png?alt=media&token=e5f79fc2-4b5f-4565-9510-fd166e3adce4",
        "vocab": "Tooth",
        "pronoun": "/tuθ/",
        "type": "noun",
        "meaning": "Răng"
      },
      {
        "word_id": "12",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FTongue.jpg?alt=media&token=34730f49-fc08-4339-9551-1f40e57735e4",
        "vocab": "Tongue",
        "pronoun": "/tʌŋ/",
        "type": "noun",
        "meaning": "Lưỡi"
      },
      {
        "word_id": "13",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FHair.png?alt=media&token=621d5a0f-158e-4afd-8359-39948a2b682a",
        "vocab": "Hair",
        "pronoun": "/heə/",
        "type": "noun",
        "meaning": "Tóc"
      },
      {
        "word_id": "14",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FNeck.png?alt=media&token=6dc7f70f-f1b9-44a1-a94e-b38a623d6e64",
        "vocab": "Neck",
        "pronoun": "/nek/",
        "type": "noun",
        "meaning": "Cổ"
      },
      {
        "word_id": "15",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FShoulder.png?alt=media&token=5fe7c20f-fea1-47d4-8490-c64a461f42d0",
        "vocab": "Shoulder",
        "pronoun": "/ʃəʊldəz/",
        "type": "noun",
        "meaning": "Vai"
      },
      {
        "word_id": "16",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FHand.png?alt=media&token=3c9a8b14-6bce-4ef5-8e54-fb279d1cf600",
        "vocab": "Hand",
        "pronoun": "/hænd/",
        "type": "noun",
        "meaning": "Bàn tay"
      },
      {
        "word_id": "17",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FFingers.jpg?alt=media&token=98291436-3df4-4df4-8030-28fbb1bb63fe",
        "vocab": "Fingers",
        "pronoun": "/fɪŋɡəz/",
        "type": "noun",
        "meaning": "Ngón tay"
      },
      {
        "word_id": "18",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FWrist.jpg?alt=media&token=d2ef49bd-04d7-47b0-9b62-64cbd792f2f7",
        "vocab": "Wrist",
        "pronoun": "/rɪst/",
        "type": "noun",
        "meaning": "Cổ tay"
      },
      {
        "word_id": "19",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FElbow.png?alt=media&token=ae346dca-436f-4e96-8704-d0ec2f384d85",
        "vocab": "Elbow",
        "pronoun": "/elbəʊ/",
        "type": "noun",
        "meaning": "Khuỷu tay"
      },
      {
        "word_id": "20",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FChest.jpg?alt=media&token=15845743-0e5f-4d54-9cea-8330efa3cf69",
        "vocab": "Chest",
        "pronoun": "/tʃest/",
        "type": "noun",
        "meaning": "Ngực"
      },
      {
        "word_id": "21",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FLeg.jpg?alt=media&token=e2d638d3-67ba-41fe-b0b9-de39f4cd3c44",
        "vocab": "Leg",
        "pronoun": "/leɡ/",
        "type": "noun",
        "meaning": "Chân"
      },
      {
        "word_id": "22",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FKnee.jpg?alt=media&token=782fb47e-0272-428a-b569-2a354e61bf55",
        "vocab": "Knee",
        "pronoun": "/ni/",
        "type": "noun",
        "meaning": "Đầu gối"
      },
      {
        "word_id": "23",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FFoot.png?alt=media&token=7f2ccf36-0bff-438c-8db5-8a48831fb945",
        "vocab": "Foot",
        "pronoun": "/fʊt/",
        "type": "noun",
        "meaning": "Bàn chân"
      },
      {
        "word_id": "24",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FToes.png?alt=media&token=870eeafe-1e7f-4f84-9044-a8b200e98644",
        "vocab": "Toes",
        "pronoun": "/təʊz/",
        "type": "noun",
        "meaning": "Ngón chân"
      },
      {
        "word_id": "25",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FAnkle.png?alt=media&token=27129f9d-ab92-40fb-9d8c-b8b19de7333a",
        "vocab": "Ankle",
        "pronoun": "/æŋkl̩/",
        "type": "noun",
        "meaning": "Mắt cá chân"
      },
      {
        "word_id": "26",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FBrain.png?alt=media&token=b52e03e9-f181-4ef1-a58a-06a3ae887ccc",
        "vocab": "Brain",
        "pronoun": "/breɪn/",
        "type": "noun",
        "meaning": "Bộ não"
      },
      {
        "word_id": "27",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FLungs.png?alt=media&token=6c7d0841-9cd0-40f3-929c-eeddba7fbb33",
        "vocab": "Lungs",
        "pronoun": "/lʌŋ/",
        "type": "noun",
        "meaning": "Lá phổi"
      },
      {
        "word_id": "28",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FHeart.png?alt=media&token=c7a2a2af-9747-4d58-9c6a-e2c1ae79d501",
        "vocab": "Heart",
        "pronoun": "/hɑt/",
        "type": "noun",
        "meaning": "Trái tim"
      },
      {
        "word_id": "29",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FStomach.png?alt=media&token=2987e05e-166f-4f70-b069-d028612f6405",
        "vocab": "Stomach",
        "pronoun": "/ɡreɪ/",
        "type": "stʌmək",
        "meaning": "Bụng"
      },
      {
        "word_id": "30",
        "word_img_url": "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fbodyparts%2FLiver.png?alt=media&token=7167d292-409d-4156-9787-74f0c0b5afdf",
        "vocab": "Liver",
        "pronoun": "/lɪvə/",
        "type": "noun",
        "meaning": "Gan"
      }
    ]
  }
];
