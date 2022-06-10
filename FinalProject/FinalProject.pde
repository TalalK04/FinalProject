// Global Variables And Objects
//
int mouse = 0;
int ballCount = 10;
int starCounter = 4;
Ball[] ball = new Ball[ballCount]; //Not just an array, but an array list: includes code and variable
Ball[] stars = new Ball[starCounter]; 
int ballCounter = ball.length - ball.length; //How to get 0 but using another value
Paddle paddle;
Net net;
boolean landscapeMode = false;
boolean restart = false;
int Size;
boolean gameStart = false;
float starX, starY, starDiameter;
color colour;
boolean overlapping = true, enterStars = false, collision = false;

void setup() {
  ball[ballCounter] = new Ball(width, height); //Start the first ball, need ballCounter
  paddle = new Paddle(width, height);
  net = new Net(width, height);
  ballCounter += 1;
  size(1500, 1200);
  if (height < width) landscapeMode = true;
  stars();
}//end setup

void draw() {
  background(0);

  if (landscapeMode == false) preGameStart();
  if ((landscapeMode == true)  && (paddle.leftMode == false || paddle.rightMode == false) ) chooseMode();
  if ((landscapeMode == true)  && (paddle.leftMode == true && paddle.rightMode == true) && (paddle.singlePlayerGetter() == false && paddle.screenSaver == false && paddle.twoPlayer == false)) choosePlayerNum();
  if ((landscapeMode == true)  && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.screenSaver == true || paddle.singlePlayer == true || paddle.twoPlayer == true) && restart == false) {
    gameStart();
  }
  for (int i=0; i<ballCounter; i++ ) {
    if (ball[i].leftGoalGetter() == true || ball[i].rightGoalGetter() == true) {
  
      restart = true;
      ball[i].resetBall();
      goalScored();
      if (restart == true ) println("hello");
    }//end IF
  }//end FOR
}//end draw

void gameStart() {
  net.draw();
  paddle.draw();
  scoreBoardDraw();
  for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
    ball[i].ballDraw();
  }//end ball.draw
   for ( Ball star : stars) {
     if (enterStars == true) star.starDraw();
  }//end FOR
  //gameStart = true;
}//end gameStart

void scoreBoardDraw() {
  paddle.textSetup();
  rect(paddle.xLeftScoreGetter(), paddle.yLeftScoreGetter(), paddle.widthScoreGetter(), paddle.heightScoreGetter()); //score left
  rect(paddle.xRightScoreGetter(), paddle.yRightScoreGetter(), paddle.widthScoreGetter(), paddle.heightScoreGetter()); //score right
  for (int i=0; i<ballCounter; i++ ) {
    if (ball[i].rightGoalGetter() == true) {
      paddle.leftScoreSetter();
      paddle.textDraw(height, paddle.scoreColourGetter(), CENTER, CENTER, paddle.fontGetter(), str(paddle.textLeftScoreSetter()), paddle.xLeftScoreGetter(), paddle.yLeftScoreGetter(), paddle.widthScoreGetter(), paddle.heightScoreGetter()); //Left Score
    } else {
      paddle.textDraw(height, paddle.scoreColourGetter(), CENTER, CENTER, paddle.fontGetter(), str(paddle.textLeftScoreSetter()), paddle.xLeftScoreGetter(), paddle.yLeftScoreGetter(), paddle.widthScoreGetter(), paddle.heightScoreGetter()); //Left Score
    }
    if (ball[i].leftGoalGetter() == true) {
      paddle.rightScoreSetter();
      paddle.textDraw(height, paddle.scoreColourGetter(), CENTER, CENTER, paddle.fontGetter(), str(paddle.textRightScoreSetter()), paddle.xRightScoreGetter(), paddle.yRightScoreGetter(), paddle.widthScoreGetter(), paddle.heightScoreGetter()); //Right Score
    } else {
      paddle.textDraw(height, paddle.scoreColourGetter(), CENTER, CENTER, paddle.fontGetter(), str(paddle.textRightScoreSetter()), paddle.xRightScoreGetter(), paddle.yRightScoreGetter(), paddle.widthScoreGetter(), paddle.heightScoreGetter()); //Right Score
    }
  }//end FOR
}//End draw()

void keyPressed() {
  if (gameStart == false && ( key == CODED && (key == 'r' || key == 'R') )) gameStart(); 

  //nightMode
  //if ((key == 'n' || key == 'N') && (paddle.leftMode == true) ) nightMode = true; paddle.chooseMode = true; 
  //if ((key == 'q' || key == 'Q') && (paddle.leftMode == true)) nightMode = false; paddle.chooseMode = true; 


  //Left Paddle
  if ((key == 'W' || key == 'w') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true )) {
    paddle.leftUpSetter();
  } 
  if ((key == 'S' || key == 's') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) {
    paddle.leftDownSetter();
  } 
   if ((key == 'D' || key == 'd') && (paddle.singlePlayerGetter() == true || paddle.twoPlayerGetter() == true)) {
    paddle.leftStopSetter();
  } 

  if ((paddle.leftPaddleVelocity == 0) && (key == 'e'|| key == 'E')) { //easy
    paddle.leftPaddleVelocity = 2;
    paddle.leftMode = true;
  } else if ((paddle.leftPaddleVelocity == 0) && (key == 'm'|| key == 'M')) { //medium
    paddle.leftPaddleVelocity = 5;
    paddle.leftMode = true;
  } else if ((paddle.leftPaddleVelocity == 0) && (key == 'h'|| key == 'H')) { //hard
    paddle.leftPaddleVelocity = 10;
    paddle.leftMode = true;
  }

  //Choose Mode
  if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 'p'|| key == 'P')) paddle.singlePlayer = true;
  if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 't'|| key == 'T')) paddle.twoPlayer = true;
  if ((paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (key == 'c'|| key == 'C')) paddle.screenSaver = true;

  //Right Paddle
  if ((key == CODED && keyCode == UP)  && (paddle.twoPlayerGetter() == true)) {
    paddle.rightUpSetter();
  } 
  if ((key == CODED && keyCode == DOWN)  && (paddle.twoPlayerGetter() == true)) {
    paddle.rightDownSetter();
  } 
    if ((key == CODED && keyCode == RIGHT)  && (paddle.twoPlayerGetter() == true)) {
    paddle.rightStopSetter();
  } 
  

  if ((paddle.rightPaddleVelocity == 0) && (key == '1')) { //easy
    paddle.rightPaddleVelocity = 2;
    paddle.rightMode = true;
  } else if ((paddle.rightPaddleVelocity == 0) && (key == '2')) { //medium
    paddle.leftPaddleVelocity = 5;
    paddle.rightMode = true;
  } else if ((paddle.rightPaddleVelocity == 0) && (key == '3')) { //hard
    paddle.rightPaddleVelocity = 10;
    paddle.rightMode = true;
  }
}//end keyPresseded

void mousePressed() {
  //Easter Egg Example: mousePressed to create another ball instantiation

  if (ballCounter >= ball.length) {
    exit();
  } else if (landscapeMode == true && (paddle.leftModeGetter() == true && paddle.rightModeGetter() == true) && (paddle.screenSaver == true || paddle.singlePlayer == true || paddle.twoPlayer == true) && restart == false) {
    ballCounter += 1;
  }
  for (int i=ballCounter - 1; i<ballCounter; i++ ) { //Constructor for other ball objects could be a button

    ball[i] = new Ball(width, height);
    ball[i].ballDraw();
  }//end for
}//end mousePressed
