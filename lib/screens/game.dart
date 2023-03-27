import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';

// class GameScree extends StatefulWidget {
//   const GameScree({super.key});

//   @override
//   State<GameScree> createState() => _GameScreeState();
// }

// class _GameScreeState extends State<GameScree> {
//   bool oTurn = true;
//   List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
//   int oScore = 0;
//   int xScore = 0;
//   int filledBoxes = 0;
//   String resultDecleration = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: MainColor.primaryColor,
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Expanded(
//                   flex: 1,
//                   child: Center(
//                       child: Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text('Player 0  '),
//                             Text(oScore.toString())
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [Text('Player x'), Text(xScore.toString())],
//                         )
//                       ],
//                     ),
//                   ))),
//               Expanded(
//                   flex: 1,
//                   child: GridView.builder(
//                       itemCount: 9,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3),
//                       itemBuilder: (BuildContext context, int index) {
//                         return GestureDetector(
//                           onTap: () {
//                             _tapped(index);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                     width: 5, color: MainColor.primaryColor),
//                                 color: MainColor.secondaryColor),
//                             child: Center(
//                               child: Text(
//                                 displayXO[index],
//                                 style: TextStyle(
//                                     fontSize: 64,
//                                     color: MainColor.primaryColor),
//                               ),
//                             ),
//                           ),
//                         );
//                       })),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Expanded(flex: 2, child: Text(resultDecleration)),
//               )
//             ],
//           ),
//         ));
//   }

//   void _tapped(int index) {
//     setState(() {
//       if (oTurn && displayXO[index] == '') {
//         displayXO[index] == 'O';
//         filledBoxes++;
//       } else if (!oTurn && displayXO[index] == '') {
//         displayXO[index] == 'X';
//       }
//       oTurn = !oTurn;
//     });
//   }

//   void _checkWinner() {
//     if (displayXO[0] == displayXO[1] &&
//         displayXO[0] == displayXO[2] &&
//         displayXO[0] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[0] + 'Wins!';
//         _updateScore(displayXO[0]);
//       });
//     }
//     if (displayXO[3] == displayXO[4] &&
//         displayXO[3] == displayXO[5] &&
//         displayXO[3] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[3] + 'Wins!';
//         _updateScore(displayXO[3]);
//       });
//     }
//     if (displayXO[6] == displayXO[7] &&
//         displayXO[6] == displayXO[8] &&
//         displayXO[6] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[6] + 'Wins!';
//         _updateScore(displayXO[6]);
//       });
//     }
//     if (displayXO[0] == displayXO[3] &&
//         displayXO[0] == displayXO[6] &&
//         displayXO[0] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[0] + 'Wins!';
//         _updateScore(displayXO[0]);
//       });
//     }
//     if (displayXO[1] == displayXO[4] &&
//         displayXO[1] == displayXO[7] &&
//         displayXO[1] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[1] + 'Wins!';
//         _updateScore(displayXO[1]);
//       });
//     }
//     if (displayXO[2] == displayXO[5] &&
//         displayXO[2] == displayXO[8] &&
//         displayXO[2] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[2] + 'Wins!';
//         _updateScore(displayXO[2]);
//       });
//     }
//     if (displayXO[0] == displayXO[4] &&
//         displayXO[0] == displayXO[8] &&
//         displayXO[0] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[0] + 'Wins!';
//         _updateScore(displayXO[0]);
//       });
//     }
//     if (displayXO[6] == displayXO[4] &&
//         displayXO[6] == displayXO[2] &&
//         displayXO[6] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[6] + 'Wins!';
//         _updateScore(displayXO[6]);
//       });
//     }
//     if (displayXO[0] == displayXO[1] &&
//         displayXO[0] == displayXO[2] &&
//         displayXO[0] == '') {
//       setState(() {
//         resultDecleration = 'Player' + displayXO[0] + 'Wins!';
//         _updateScore(displayXO[0]);
//       });
//     }
//     void _updateScore(String winner) {
//       if (winner == 'O') {
//         oScore++;
//       } else if (winner == 'X') {
//         xScore++;
//       }
//     }
//   }
// }
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
   bool oTurn = true;
  List<String> displayXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<int> matchedIndexes = [];
  int attempts = 0;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclaration = "";
  bool winnerfound = false;
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }
  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }
  void resetTimer() => seconds = maxSeconds;
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Player O",
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 3,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            oScore.toString(),
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 3,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Player X",
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 3,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            xScore.toString(),
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 3,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 3, color: MainColor.secondaryColor),
                              color: matchedIndexes.contains(index)
                                  ? MainColor.accentColor
                                  : MainColor.primaryColor),
                          child: Center(
                            child: Text(displayXO[index],
                                style:
                                    TextStyle(fontSize: 64, color:MainColor.thirdColor )),
                          ),
                        ),
                      );
                    })),
            Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resultDeclaration,
                        style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 3,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildTimer()
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == "") {
          displayXO[index] = "O";
          filledBoxes++;
        } else if (!oTurn && displayXO[index] == "") {
          displayXO[index] = "X";
          filledBoxes++;
        }
        oTurn = !oTurn;
        _checkwinner();
      });
    }
  }
  void _checkwinner() {
    // check 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[0] + " Wins!";
        matchedIndexes.addAll([0, 1, 2]);
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }
    // check 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[3] + " Wins!";
        matchedIndexes.addAll([3, 4, 5]);
        stopTimer();
        _updateScore(displayXO[3]);
      });
    } // check 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[6] + " Wins!";
        matchedIndexes.addAll([6, 7, 8]);
        stopTimer();
        _updateScore(displayXO[6]);
      });
    } // check 1st Column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[0] + " Wins!";
        matchedIndexes.addAll([0, 3, 6]);
        stopTimer();
        _updateScore(displayXO[0]);
      });
    } // check 2nd Column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[1] + " Wins!";
        matchedIndexes.addAll([1, 4, 7]);
        stopTimer();
        _updateScore(displayXO[1]);
      });
    }
    // check 3rd Column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[2] + " Wins!";
        matchedIndexes.addAll([2, 5, 8]);
        stopTimer();
        _updateScore(displayXO[2]);
      });
    } // check Diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[0] + " Wins!";
        matchedIndexes.addAll([0, 4, 8]);
        stopTimer();
        _updateScore(displayXO[0]);
      });
    } // check Diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != "") {
      setState(() {
        resultDeclaration = "Player " + displayXO[6] + " Wins!";
        matchedIndexes.addAll([6, 4, 2]);
        stopTimer();
        _updateScore(displayXO[6]);
      });
    }
    if (!winnerfound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = "Nobody Wins!";
        stopTimer();
      });
    }
  }
  void _updateScore(String winner) {
    if (winner == "O") {
      oScore++;
    } else if (winner == "X") {
      xScore++;
    }
    winnerfound = true;
  }
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
      resultDeclaration = "";
      matchedIndexes = [];
    });
    filledBoxes = 0;
  }
  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: MainColor.primaryColor,
                ),
                Center(
                  child: Text(
                    "$seconds",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
            onPressed: () {
              startTimer();
              _clearBoard();
              attempts++;
            },
            child: Text(
              attempts == 0 ? "Start" : "Play Again!",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
    );
  }
}