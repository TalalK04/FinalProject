void goalScored() {
  background(0);
  for (int i=0; i<ballCounter; i++ ) {//Controls each ball of all 10 (ballCount)
    //ballCount = 0;
    ball[i].resetBall();
    ball[i] = new Ball(width, height);
    ball[i].ballDraw();
  }//end ball.draw
  fill(255); 
  textSize(width*1/35);
  text("GOALLL! \n Press 'r' to play again", width*1/2, height*1/2);
}
