import 'package:flutter/material.dart';

enum Winner { NONE, PLAYER1, PLAYER2 }

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Winner currentWinner = Winner.NONE;

  List gameIcon = [
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
  ];
  List reStart = [
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
    Icons.circle_rounded,
  ];
  bool isPlayer1 = false;

  @override
  void initState() {
    super.initState();
    isPlayer1 = true;
  }

  void clickBox(index) {
    if (isPlayer1) {
      gameIcon[index] = Icons.close;
    } else {
      gameIcon[index] = Icons.circle_outlined;
    }
    isPlayer1 = !isPlayer1;
    winnerWinner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chokdi Mindu"),
          elevation: 0.0,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Card(
                      color: Colors.deepPurple.shade400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                          ),
                          itemCount: gameIcon.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                clickBox(index);
                              },
                              child: Container(
                                margin: EdgeInsets.all(2),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  gameIcon[index],
                                  color: Colors.white,
                                  size: gameIcon[index] == Icons.circle_rounded
                                      ? 10
                                      : 60,
                                ),
                                // child:Icons.circle_outlined,size: 70,),
                              ),
                            );
                          },
                        ),
                      )),
                ),
                SizedBox(height: 30),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: restartGame,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Icon(
                        Icons.replay_outlined,
                        size: 40.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void winnerWinner() {
    // player 1 condition
    if (gameIcon[0] == Icons.close &&
        gameIcon[1] == Icons.close &&
        gameIcon[2] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[3] == Icons.close &&
        gameIcon[4] == Icons.close &&
        gameIcon[5] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[6] == Icons.close &&
        gameIcon[7] == Icons.close &&
        gameIcon[8] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[0] == Icons.close &&
        gameIcon[3] == Icons.close &&
        gameIcon[6] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[1] == Icons.close &&
        gameIcon[4] == Icons.close &&
        gameIcon[7] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[2] == Icons.close &&
        gameIcon[5] == Icons.close &&
        gameIcon[8] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[0] == Icons.close &&
        gameIcon[4] == Icons.close &&
        gameIcon[8] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    } else if (gameIcon[2] == Icons.close &&
        gameIcon[4] == Icons.close &&
        gameIcon[6] == Icons.close) {
      currentWinner = Winner.PLAYER1;
    }

    // player 2 condition
    if (gameIcon[0] == Icons.circle_outlined &&
        gameIcon[1] == Icons.circle_outlined &&
        gameIcon[2] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[3] == Icons.circle_outlined &&
        gameIcon[4] == Icons.circle_outlined &&
        gameIcon[5] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[6] == Icons.circle_outlined &&
        gameIcon[7] == Icons.circle_outlined &&
        gameIcon[8] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[0] == Icons.circle_outlined &&
        gameIcon[3] == Icons.circle_outlined &&
        gameIcon[6] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[1] == Icons.circle_outlined &&
        gameIcon[4] == Icons.circle_outlined &&
        gameIcon[7] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[2] == Icons.circle_outlined &&
        gameIcon[5] == Icons.circle_outlined &&
        gameIcon[8] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[0] == Icons.circle_outlined &&
        gameIcon[4] == Icons.circle_outlined &&
        gameIcon[8] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    } else if (gameIcon[2] == Icons.circle_outlined &&
        gameIcon[4] == Icons.circle_outlined &&
        gameIcon[6] == Icons.circle_outlined) {
      currentWinner = Winner.PLAYER2;
    }

    //shoe winning dialog box
    if (currentWinner == Winner.PLAYER1) {
      showDialogMessage("Player 1 is winner");
      return;
    }
    if (currentWinner == Winner.PLAYER2) {
      showDialogMessage("Player 2 is winner");
      return;
    }

    bool isDraw = true;
    gameIcon.forEach((element) {
      if (element == Icons.circle_rounded) {
        isDraw = false;
      }
    });

    //shoe draw dialog box
    if (isDraw) {
      showDialogMessage("Game is draw");
    }
  }

  //winning and drawing dialog box
  showDialogMessage(text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
  }

  // restart game
  void restartGame() {
    currentWinner = Winner.NONE;
    isPlayer1 = true;
    gameIcon = [];
    gameIcon.addAll(reStart);
    setState(() {});
  }
}
