// import 'dart:async';
// import 'dart:html';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'game_data.dart';
//
// class FlipCardItem extends StatefulWidget {
//   final Level _level;
//   FlipCardItem(this._level);
//
//   @override
//   _FlipCardItemState createState() => _FlipCardItemState(_level);
// }
//
// class _FlipCardItemState extends State<FlipCardItem> {
//   _FlipCardItemState(this._level);
//   Level _level;
//   int previousIndex = -1;
//   bool flip = false;
//   bool start = false;
//   bool wait = false;
//   Timer _time;
//   int left;
//   bool isFinished;
//   List<String> data;
//   List<bool> cardFlips;
//   List<GlobalKey<FlipCardState>> cardStateKeys;
//
//   Widget getItem(int index) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black45,
//             blurRadius: 3,
//             spreadRadius: 0.8,
//             offset: Offset(2.0, 1),
//           )
//         ],
//         borderRadius: BorderRadius.circular(5),
//       ),
//       margin: EdgeInsets.all(0.4),
//       child: Image.network(data[index]),
//     );
//   }
//
//   startTimer() {
//     _time = Timer.periodic(Duration(seconds: 1), (t) {
//       setState(() {
//         _time = _time - 1;
//       });
//     });
//   }
//
//   void restart() {
//     startTimer();
//     data = getSourceArray(_level);
//     cardFlips = getInitialItemState(_level);
//     cardStateKeys = getCardStateKeys(_level);
//     _time = 5;
//     _left = (data.length ~/ 2);
//     isFinished = false;
//     Future.delayed(const Duration(seconds: 6), () {
//       setState(() {
//         start = true;
//         _time.cancel();
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     restart();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isFinished
//         ? Scaffold(
//             body: GestureDetector(
//             onTap: () {},
//             child: Container(
//               height: 50,
//               width: 200,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Text(
//                 "Replay",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           ))
//         : Scaffold(
//             body: SafeArea(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: _time > 0 ? Text("$_time") : Text("left: $left"),
//                 ),
//                 GridView.builder(
//                     itemCount: data.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3),
//                     itemBuilder: (context, index) => start
//                         ? FlipCard(
//                             key: cardStateKeys[index],
//                             onFlip: () {
//                               if (!flip) {
//                                 flip = true;
//                                 previousIndex = index;
//                               } else {
//                                 flip = true;
//                                 if (previousIndex != index) {
//                                   if (data[previousIndex] != data[index]) {
//                                     wait = true;
//                                     Future.delayed(
//                                         const Duration(milliseconds: 1500), () {
//                                       cardStateKeys[previousIndex]
//                                           .currentState
//                                           ?.toggleCard();
//
//                                       previousIndex = index;
//
//                                       Future.delayed(
//                                           const Duration(milliseconds: 160),
//                                           () {
//                                         setState(() {
//                                           wait = false;
//                                         });
//                                       });
//                                     });
//                                   }
//                                 }
//                               }
//                             },
//                             front: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   borderRadius: BorderRadius.circular(5),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.black45,
//                                         blurRadius: 3,
//                                         offset: Offset(2, 1))
//                                   ]),
//                               margin: EdgeInsets.all(4.0),
//                               child: Image.network(""),
//                             ),
//                             flipOnTouch: wait ? false : cardFlips[index],
//                             direction: FlipDirection.HORIZONTAL,
//                             back: getItem(index))
//                         : getItem(index))
//               ],
//             ),
//           ));
//   }
// }


import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'game_data.dart';

class FlipCardItem extends StatefulWidget {
  final Level _level;
  FlipCardItem(this._level);
  @override
  _FlipCardItemState createState() => _FlipCardItemState(_level);
}

class _FlipCardItemState extends State<FlipCardItem> {
  _FlipCardItemState(this._level);

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;

  bool _wait = false;
  Level _level;
  late Timer _timer;
  int _time = 5;
  late int _left;
  late bool _isFinished;
  late List<String> _data;

  late List<bool> _cardFlips;
  late List<GlobalKey<FlipCardState>> _cardStateKeys;

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(4.0),
      child: Image.network(_data[index]),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(
      _level,
    );
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);
    _time = 5;
    _left = (_data.length ~/ 2);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isFinished
        ? Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              restart();
            });
          },
          child: Container(
            height: 50,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              "Replay",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    )
        : Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _time > 0
                    ? Text(
                  '$_time',
                  style: Theme.of(context).textTheme.headline3,
                )
                    : Text(
                  'Left:$_left',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => _start
                      ? FlipCard(
                      key: _cardStateKeys[index],
                      onFlip: () {
                        if (!_flip) {
                          _flip = true;
                          _previousIndex = index;
                        } else {
                          _flip = false;
                          if (_previousIndex != index) {
                            if (_data[_previousIndex] !=
                                _data[index]) {
                              _wait = true;

                              Future.delayed(
                                  const Duration(milliseconds: 1500),
                                      () {
                                    _cardStateKeys[_previousIndex]
                                        .currentState
                                        ?.toggleCard();
                                    _previousIndex = index;
                                    _cardStateKeys[_previousIndex]
                                        .currentState
                                        ?.toggleCard();

                                    Future.delayed(
                                        const Duration(milliseconds: 160),
                                            () {
                                          setState(() {
                                            _wait = false;
                                          });
                                        });
                                  });
                            } else {
                              _cardFlips[_previousIndex] = false;
                              _cardFlips[index] = false;
                              print(_cardFlips);

                              setState(() {
                                _left -= 1;
                              });
                              if (_cardFlips
                                  .every((t) => t == false)) {
                                print("Won");
                                Future.delayed(
                                    const Duration(milliseconds: 160),
                                        () {
                                      setState(() {
                                        _isFinished = true;
                                        _start = false;
                                      });
                                    });
                              }
                            }
                          }
                        }
                        setState(() {});
                      },
                      flipOnTouch: _wait ? false : _cardFlips[index],
                      direction: FlipDirection.HORIZONTAL,
                      front: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 3,
                                spreadRadius: 0.8,
                                offset: Offset(2.0, 1),
                              )
                            ]),
                        margin: EdgeInsets.all(4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/avatar.jpeg",
                          ),
                        ),
                      ),
                      back: getItem(index))
                      : getItem(index),
                  itemCount: _data.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}