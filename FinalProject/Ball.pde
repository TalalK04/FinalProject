/* Ideas - Abstract
 Change the Ball Colour based on direction or collision
 Change the speed of the ball based on the score of the game
 Change the colour of the ball at a specific level/score
 Introduce multiple balls at a specific level/score
 Unlimited mode, where the ball speeds up over time
 - Note: continuous collision, so the ball can't zip through the paddle
 Ball become invisible for a split second-guessing
 - invisible halfway across the screen ... guess the path
 */

private class Ball {
  //Global Variables
  private float x, y, diameter, xStart, yStart, xDirection, yDirection;
  private color colour, colourReset = #FFFFFF;
  private int xSpeed, ySpeed;
  private boolean rightGoal = false, leftGoal = false;
  private boolean godMode = false;
  private boolean nightMode = false;
  private int bounce = 0;

  private Ball(float width, float height) { 
    x = width*1/2; //Start Ball Location wherever
    y = height*1/2;
    xStart = x; //Location Specifically at Game Start, middle of field
    yStart = y;
    diameter =  width*1/30;
    //xSpeed = int ( random (width/width, width/width*5) );
    //ySpeed = int ( random (height/height, height/height*5) );
    while (xSpeed>-4 && xSpeed<4) xSpeed = int(random( -5, 5));
    while (ySpeed>-4 && ySpeed<4) ySpeed = int(random( -5, 5));
    if (nightMode == false) this.colour = color(int (random(100, 255)), int (random(50, 255)), int (random(175, 255)));
    if (nightMode == true) this.colour = color(int (random(100, 255)), int (random(50, 255)), 0);
  }//end Ball Constructor

  //Start Star Constructor
  Ball(float widthParameter, float heightParameter, float diameterParameter) {
    //THIS is not used here
    x = widthParameter; //Start Ball Location wherever
    y = heightParameter;
    diameter =  diameterParameter;
    colour = color(255);
    //float diameterParameter
  }//end Star Constructor

  public void ballDraw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    //fill(colourReset);
    //
    ballMove();
    bounceWall();
    bouncePaddle();
    Goal();
    bounceCount();
    bounceStar();
  }// end draw

  public void starDraw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    //fill(colourReset);

    ballMove();
    bounceWall();
    bouncePaddle();
    Goal();
    bounceCount();
    bounceStar();
  }// end draw

  private void ballMove() {
    x += xSpeed;
    y += ySpeed;
  }//end move

  private void bounceWall() {
    if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) {
      ySpeed *= -1; //Top and Bottom
      bounce += 1;
    } else bounce += 0;
  }//end Bounce

  private void bouncePaddle() {
    if ((x <= paddle.xPaddleLeft + (paddle.widthPaddle + diameter*1/2)) && ((y >= paddle.yPaddleLeft) && (y <= (paddle.yPaddleLeft + paddle.heightPaddle)))) {
      xSpeed *= -1;
      bounce += 1;
    } else bounce += 0;
    if ((x >= paddle.xPaddleRight - (diameter*1/2)) && ((y >= paddle.yPaddleRight) && (y <= (paddle.yPaddleRight + paddle.heightPaddle)))) {
      xSpeed*=-1;
      bounce += 1;
    } else bounce += 0;
  }//end bouncePaddle

  private void bounceStar() {
    starCollisions();
    if (collision == true) {
      xSpeed*=-1.2;
      ySpeed*=-1.2;
    }
  }//end bounceStar

  private void Goal() {
    if (rightGoal == true) {
      x = (net.x1RightNet + (diameter*2/3));
      ySpeed = 0;
      xSpeed = 0;
      bounce += 1;
    } else {
      rightGoal = false; 
      paddle.leftScoreGetter();
      bounce += 0;
    }
    if (leftGoal == true) {
      x = (net.x1LeftNet - (diameter*2/3)); 
      ySpeed = 0;
      xSpeed = 0;
    } else {
      leftGoal = false;
      paddle.rightScoreGetter();
    }


    if (x > net.x1RightNet - (diameter*1/2)) {
      rightGoal = true;
      x = width - diameter*1/2;
      y = y;
    } 
    if (x < net.x1LeftNet +(diameter*1/2)) {
      leftGoal = true;
      x = width*0 + diameter*1/2;
      y = y;
    }
  }//end Goal

  private void bounceCount() {
    if (bounce == 5) { 
      paddle.heightPaddle = height*1/6;
    } else if (bounce == 10) { 
      paddle.heightPaddle = height*1/9;
    } else if (bounce == 15) { 
      paddle.heightPaddle = height*1/12;
    } else if (bounce == 20) { 
      paddle.heightPaddle = height*1/15;
    }

    if (bounce >= 1) enterStars = true;
  }//end bounceCount

  private void resetBall() {
    x = width*1/2; //Start Ball Location wherever
    y = height*1/2;
    xSpeed = 0;
    ySpeed = 0;
  }//end resetBall


  boolean rightGoalGetter() {
    return rightGoal;
  }
  boolean leftGoalGetter() {
    return leftGoal;
  }
  boolean rightGoalSetter() {
    return rightGoal = false;
  }
  boolean leftGoalSetter() {
    return leftGoal = false;
  }

  float ballYGetter () {
    return y;
  }

  int bounceGetter() {
    return bounce;
  }

  //boolean Setter(){
  // return nightMode = false; 
  //}
}//End ball
