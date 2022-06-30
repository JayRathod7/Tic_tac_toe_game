import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
  bool isPlayer1 = false;
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    isPlayer1 = true;
  }

  void clickBox(index) {
    if (isPlayer1) {
      gameIcon[index] = Icons.close;
    }
    if (!isPlayer1) {
      gameIcon[index] = Icons.circle_outlined;
    }

    isPlayer1 = !isPlayer1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(12)),
            child: Card(
                color: Colors.deepPurple.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
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
        ));
  }
}
