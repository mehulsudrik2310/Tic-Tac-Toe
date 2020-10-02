import 'package:flutter/material.dart';
import './button.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Button> gamebuttons;
  var player1;
  var player2;
  var activeplayer;
  var noofmoves;
  String display;
  @override
  void initState() {
    super.initState();
    gamebuttons = setgame();
  }

  List<Button> setgame() {
    player1 = new List();
    player2 = new List();
    activeplayer = 1;
    noofmoves = 0;
    display = "X to play";
    var buttons = <Button>[
      new Button(i: 1),
      new Button(i: 2),
      new Button(i: 3),
      new Button(i: 4),
      new Button(i: 5),
      new Button(i: 6),
      new Button(i: 7),
      new Button(i: 8),
      new Button(i: 9),
    ];
    return buttons;
  }
  void playgame(Button b)
  {
    setState(() {
      noofmoves = noofmoves + 1;
      if(activeplayer ==1)
      {
        b.text = 'X';
        player1.add(b.i);
        activeplayer=2;
        b.enable = false;
        display= "X to play";
      }
      else
      {
        b.text = 'O';
        player2.add(b.i);
        activeplayer=1;
        b.enable = false;
        display= "O to play";
      }
      checkwinner();
    });

  }
  void checkwinner()
  {
    int winner=-1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3))
    {
      winner=1;
    }
    if(player1.contains(4) && player1.contains(5) && player1.contains(6))
    {
      winner=1;
    }
    if(player1.contains(7) && player1.contains(8) && player1.contains(9))
    {
      winner=1;
    }
    if(player1.contains(1) && player1.contains(4) && player1.contains(7))
    {
      winner=1;
    }
    if(player1.contains(2) && player1.contains(5) && player1.contains(8))
    {
      winner=1;
    }
    if(player1.contains(3) && player1.contains(6) && player1.contains(9))
    {
      winner=1;
    }
    if(player1.contains(1) && player1.contains(5) && player1.contains(9))
    {
      winner=1;
    }
    if(player1.contains(3) && player1.contains(5) && player1.contains(7))
    {
      winner=1;
    }

    // player 2

    if(player2.contains(1) && player2.contains(2) && player2.contains(3))
    {
      winner=2;
    }
    if(player2.contains(4) && player2.contains(5) && player2.contains(6))
    {
      winner=2;
    }
    if(player2.contains(7) && player2.contains(8) && player2.contains(9))
    {
      winner=2;
    }
    if(player2.contains(1) && player2.contains(4) && player2.contains(7))
    {
      winner=2;
    }
    if(player2.contains(2) && player2.contains(5) && player2.contains(8))
    {
      winner=2;
    }
    if(player2.contains(3) && player2.contains(6) && player2.contains(9))
    {
      winner=2;
    }
    if(player2.contains(1) && player2.contains(5) && player2.contains(9))
    {
      winner=2;
    }
    if(player2.contains(3) && player2.contains(5) && player2.contains(7))
    {
      winner=2;
    }
    if(winner>0)
    {
      if(winner==1) {
        display = "Winner is Player 1";
      }
      else {
        display = "Winner is Player 2";
      }
      for(int i=0; i<9; i++)
        gamebuttons[i].enable = false;
    }
    else
    {
      if(noofmoves ==9)
      {
        display = "Match Draw!!!";
      }
    }
  }
  void reset()
  {
    setState(() {
      gamebuttons=setgame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tic-Tac-Toe",
          style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.pink, fontSize: 35.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            child: Center(
              child: Text(
                display,
                style: TextStyle(fontSize: 30.0, color: Colors.deepOrange),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text(gamebuttons[i].text,style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold ),),
                  onPressed: gamebuttons[i].enable ? () => playgame(gamebuttons[i]) : null,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 75.0,
              width: 350.0,
              child: RaisedButton(
                onPressed: reset,
                color: Colors.red,
                child: Text(
                  "Reset",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
