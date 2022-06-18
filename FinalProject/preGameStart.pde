final public void preGameStart() {
  for (int i=ballCounter-1; i<ballCount; i++ ) {
    ball[i].xSpeed = 0;
    ball[i].ySpeed = 0;
  }
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("This game is only compatible in LANDSCAPE mode\nPlease change the size of your screen.", width*1/10, height*1/2.25);
}//end preGameStart

final public void chooseMode() {
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose paddle speed:\nSlow (EASY): RightPaddle (press '1') | LeftPaddle (press 'e')\nMedium: RightPaddle (press '2') | LeftPaddle (press 'm')\nFast (HARD): RightPaddle (press '3') | LeftPaddle (press 'h')", width*1/10, height*1/4);
  text("Left Paddle Controls: W (Up) | S (Down) | D (Stop)\nRight Paddle Controls: Up Arrow Key | Down Arrow Key |\nLeft Arrow Key (Stop)", width*1/10, height*1/2);
}//end chooseMode

final public void choosePlayerNum() {
  background(0);
  fill(255); 
  textSize(width*1/35);
  text("Choose how you want to play:\nSingle Player (you will be controlling the Left Paddle): Press 'p'\nTwo Player: Press 't'\nScreenSaver: Press 'c'", width*1/10, height*1/4);
  text("Keep in mind: \n - Paddles will get smaller as the game continues\n - Ball will begin to move faster at some point", width*1/10, height*1/1.75);
  text("GOOD LUCK!", width*1/10, height*1/1.2);
}//end choosePlayerNum
