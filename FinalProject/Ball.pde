final private class Ball {
  //Global Variables
  private float x, y, xStart, yStart, diameter, xDirection, yDirection;
  private color colour, colourReset = #FFFFFF;
  private int xSpeed, ySpeed;
  private boolean rightGoal = false, leftGoal = false;
  private boolean hardMode = false, godMode = false;
  private boolean nightMode = false;
  private boolean leftPaddleHit = false;
  private boolean rightPaddleHit = false;
  private int bounce = 0;

  private Ball(float width, float height) { 
    x = width*1/2; 
    y = height*1/2;
    xStart = x; 
    yStart = y;
    diameter =  width*1/30;
    xDirection = 1;
    yDirection = 1;
    //xSpeed = int ( random (width/width, width/width*5) );
    //ySpeed = int ( random (height/height, height/height*5) );
    while (xSpeed>-3 && xSpeed<3) xSpeed = int(random( -5, 5));
    while (ySpeed>-3 && ySpeed<3) ySpeed = int(random( -5, 5));
    if (nightMode == false) this.colour = color(int (random(100, 255)), int (random(50, 255)), int (random(175, 255)));
    if (nightMode == true) this.colour = color(int (random(100, 255)), int (random(50, 255)), 0);
  }//end Ball Constructor

  //Start Star Constructor
 private Ball(float widthParameter, float heightParameter, float diameterParameter) {  
    x = widthParameter; 
    y = heightParameter;
    diameter =  diameterParameter;
    colour = color(255);
  }//end Star Constructor

  final public void ballDraw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    ballSpeed();
    bounceWall();
    bouncePaddle();
    Goal();
    bounceCount();
    bounceStar();
    momentumBall();
  }// end draw

  final public void starDraw() {
    fill(colour);
    ellipse(x, y, diameter, diameter);
    ballSpeed();
    bounceWall();
    bouncePaddle();
    Goal();
    bounceCount();
    bounceStar();
  }// end draw

  final private void ballSpeed() {
    x += xSpeed*xDirection;
    y += ySpeed*yDirection;
  }//end Speed

  final private void bounceWall() {
    if (y-diameter*1/2 < height*0 || y+diameter*1/2 > height) {
      ySpeed *= -1; //Top and Bottom
      bounce += 1;
    } else bounce += 0;
  }//end Bounce

  final private void bouncePaddle() {
    if ((x <= paddle.xPaddleLeft + (paddle.widthPaddle + diameter*1/2)) && ((y >= paddle.yPaddleLeft) && (y <= (paddle.yPaddleLeft + paddle.heightPaddle)))) {
      xSpeed *= -1;
      bounce += 1;
      leftPaddleHit = true;
    } else bounce += 0; 
    leftPaddleHit = false;
    if ((x >= paddle.xPaddleRight - (diameter*1/2)) && ((y >= paddle.yPaddleRight) && (y <= (paddle.yPaddleRight + paddle.heightPaddle)))) {
      xSpeed*=-1;
      bounce += 1;
      rightPaddleHit = true;
    } else bounce += 0; 
    rightPaddleHit = false;
  }//end bouncePaddle

  final private void bounceStar() {
    starCollisions();
    if (collision == true) {
      xSpeed*=-1.2;
      ySpeed*=-1.2;
    }
  }//end bounceStar

  final private void Goal() {
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

  final private void bounceCount() {
    if (bounce >= 1) enterStars = true;
    if (bounce >= 5) hardMode = true;
    if (bounce >= 5) godMode = true;
    //
    if (bounce == 5) { 
      paddle.heightPaddle = height*1/6;
    } else if (bounce == 10) { 
      paddle.heightPaddle = height*1/9;
    } else if (bounce == 15) { 
      paddle.heightPaddle = height*1/12;
    } else if (bounce == 20) { 
      paddle.heightPaddle = height*1/15;
    }
    //
    if (hardMode == true && (xSpeed<0 && ySpeed<0)) {
      xSpeed = -6;
      ySpeed = -6;
    } else if (hardMode == true && (xSpeed>0 && ySpeed>0)) {
      xSpeed = 6;
      ySpeed = 6;
    } else if (hardMode == false && (xSpeed>0 && ySpeed>0)) {
      xSpeed = 4;
      ySpeed = 4;
    } else if (hardMode == false && (xSpeed<0 && ySpeed<0)) {
      xSpeed = -4;
      ySpeed = -4;
    }
    //
    if (godMode == true && (xSpeed<0 && ySpeed<0)) {
      xSpeed = -8;
      ySpeed = -8;
    } else if (godMode == true && (xSpeed>0 && ySpeed>0)) {
      xSpeed = 8;
      ySpeed = 8;
    } else if (godMode == false && (xSpeed>0 && ySpeed>0)) {
      xSpeed = 4;
      ySpeed = 4;
    } else if (godMode == false && (xSpeed<0 && ySpeed<0)) {
      xSpeed = -4;
      ySpeed = -4;
    }
  }//end bounceCount

  final private void resetBall() {
    x = width*1/2; //middle of the screen
    y = height*1/2;
    xSpeed = 0;
    ySpeed = 0;
  }//end resetBall

  final private void momentumBall() {
    if (paddle.leftUp == true && leftPaddleHit == true) {
      yDirection = 0.5;
      xDirection = 0.8;
    }
    if (paddle.rightUp == true && rightPaddleHit == true) {
      yDirection = 0.5;
      xDirection = 0.8;
    }
    if (paddle.leftDown == true && leftPaddleHit == true) {
      yDirection = 3;
      xDirection = 1.5;
    }
    if (paddle.rightDown == true && rightPaddleHit == true) {
      yDirection = 3;
      xDirection = 1.5;
    }

    if (paddle.rightStop == true && rightPaddleHit == true) {
      xDirection = 1;
      yDirection = 1;
    }
  }//end momentumBall


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
}//End ball
