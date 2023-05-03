import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> fillSourceArray() {
  return [
    "https://img.freepik.com/free-vector/cute-husky-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-4567.jpg?w=2000",
    "https://img.freepik.com/free-vector/cute-husky-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-4567.jpg?w=2000",
    "https://cdn.dribbble.com/users/4859/screenshots/16325476/blooming_1600x1200.png?compress=1&resize=400x300",
    "https://cdn.dribbble.com/users/4859/screenshots/16325476/blooming_1600x1200.png?compress=1&resize=400x300",
    "https://static.vecteezy.com/system/resources/previews/007/626/807/original/toy-car-for-2d-cartoon-animation-city-cars-and-vehicles-transport-free-vector.jpg",
    "https://static.vecteezy.com/system/resources/previews/007/626/807/original/toy-car-for-2d-cartoon-animation-city-cars-and-vehicles-transport-free-vector.jpg",
    'https://static.vecteezy.com/system/resources/thumbnails/002/491/885/small_2x/diamond-ring-jewelry-free-vector.jpg',
    "https://static.vecteezy.com/system/resources/thumbnails/002/491/885/small_2x/diamond-ring-jewelry-free-vector.jpg",
    "https://w7.pngwing.com/pngs/238/163/png-transparent-pair-of-blue-and-white-low-top-sneakers-illustration-sneakers-air-jordan-shoe-cartoon-shoes-outdoor-shoe-sneaker-collecting-electric-blue.png",
    "https://w7.pngwing.com/pngs/238/163/png-transparent-pair-of-blue-and-white-low-top-sneakers-illustration-sneakers-air-jordan-shoe-cartoon-shoes-outdoor-shoe-sneaker-collecting-electric-blue.png",
    "https://img.freepik.com/premium-vector/vector-cartoon-illustration-automatic-ballpoint-ink-pen-writing-drawing-with-refill-stationery-school-office_364586-998.jpg?w=2000",
    "https://img.freepik.com/premium-vector/vector-cartoon-illustration-automatic-ballpoint-ink-pen-writing-drawing-with-refill-stationery-school-office_364586-998.jpg?w=2000",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKkhXEXBVPNC9ONXYQ6JEf-tfCBAbH-_8g8tA_jwBTkwwR4FPIuhfmZtjRsmi1WU0TjL8&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKkhXEXBVPNC9ONXYQ6JEf-tfCBAbH-_8g8tA_jwBTkwwR4FPIuhfmZtjRsmi1WU0TjL8&usqp=CAU",
    "https://static.vecteezy.com/system/resources/previews/011/996/952/original/cartoon-student-boy-free-png.png",
    "https://static.vecteezy.com/system/resources/previews/011/996/952/original/cartoon-student-boy-free-png.png",
    "https://img.freepik.com/free-vector/cute-corgi-dog-sandwich-cartoon-vector-icon-illustration-animal-food-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4242.jpg?w=2000",
    "https://img.freepik.com/free-vector/cute-corgi-dog-sandwich-cartoon-vector-icon-illustration-animal-food-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4242.jpg?w=2000"
  ];
}

enum Level { Hard, Medium, Easy }

// List getSourceArray(Level level) {
//   List<String> levelList = <String>[];
//   List sourceArray = fillSourceArray();
//   if (level == Level.Hard) {
//     sourceArray.forEach((element) {
//       levelList.add(element);
//     });
//   } else if (level == Level.Medium) {
//     for(int i = 0; i < 12; i++) {
//       levelList.add(sourceArray[i]);
//     }
//   } else if (level == Level.Easy) {
//     for(int i = 0; i < 6; i++) {
//       levelList.add(sourceArray[i]);
//     }
//   }
//   levelList.shuffle();
//   return levelList;
// }
//
// List<bool> getInitialItemState(Level level) {
//   List<bool> initialItemState = <bool>[];
//   if (level == Level.Hard) {
//     for(int i = 0; i < 18; i++) {
//       initialItemState.add(true);
//     }
//   } else if (level == Level.Medium) {
//     for(int i = 0; i < 18; i++) {
//       initialItemState.add(true);
//     }
//   } else if (level == Level.Easy) {
//     for(int i = 0; i < 18; i++) {
//       initialItemState.add(true);
//     }
//   }
//   return initialItemState;
// }
//
// List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
//   List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
//
//   if (level == Level.Hard) {
//     for(int i = 0; i < 18; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (level == Level.Medium) {
//     for(int i = 0; i < 12; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   } else if (level == Level.Easy) {
//     for(int i = 0; i < 6; i++) {
//       cardStateKeys.add(GlobalKey<FlipCardState>());
//     }
//   }
//   return cardStateKeys;
// }

List<String> getSourceArray(
  Level level,
) {
  List<String> levelAndKindList = <String>[];
  List sourceArray = fillSourceArray();
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = <bool>[];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
