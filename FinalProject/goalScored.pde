final public void goalScored() {
  background(0);
  restart = true;
  for (int i=ball.length-1; i<ballCounter; i-- ) {
    i--;
    ball[i] = new Ball(width, height);
    ball[i - 1].resetBall();
  }
  fill(255); 
  textSize(width*1/35);
  text("GOALLL! \n Press 'r' to play again", width*1/2, height*1/2);
}//end goalScored
