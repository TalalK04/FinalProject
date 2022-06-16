void goalScored() {
  background(0);
  for (int i=ball.length-1; i<ballCounter; i-- ) {//Controls each ball of all 10 (ballCount)
    //ballCount = 0;
   i--;
    ball[i] = new Ball(width, height);
    //ball[ballCounter].ballDraw();
  }//end ball.draw
  fill(255); 
  textSize(width*1/35);
  text("GOALLL! \n Press 'r' to play again", width*1/2, height*1/2);
}
