/* Ideas: Abstract
 Paddle as a Pin-Ball-Lookalike in the middle of the table
 Make the paddle smaller with more points
 [Advanced Option] 360 degrees full rotation for the ball/paddles
 [Advanced Option] Curved Paddle, deflects and different angles
 */

final class Paddle {
  //Global Variables
  private color colour;
  private float xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle, xPaddleRight, yPaddleRight;
  private boolean nightMode = false;
  private boolean leftUp = false, leftDown = false, rightUp = false, rightDown = false, rightStop = false, leftStop = true;
  private int leftPaddleVelocity = 0, rightPaddleVelocity = 0;
  private boolean leftMode = false;
  private boolean singlePlayer = false;
  private boolean rightMode = false;
  private boolean screenSaver = false;
  private boolean twoPlayer = false;
  private int leftScore = 0, rightScore = 0;
  
  private float xLeftScore, xRightScore, yLeftScore, yRightScore, widthScore, heightScore;
  private PFont titleFont;
  private color scoreColour = 000000; 
  private boolean chooseMode = false;
  

  //
 Paddle(float width, float height) { // General Population
    if (nightMode == false) this.colour = color(int (random(100, 255)), int (random(50, 255)), int (random(175, 255)));
    if (nightMode == true) this.colour = color(int (random(100, 255)), int (random(50, 255)), 0);
    widthPaddle = int(width*1/55);
    xPaddleLeft = int(width*1/40);
    xPaddleRight = int(width*39/40) - widthPaddle;
    this.yPaddleRight = int(height*1/2 - heightPaddle*1/2);
    this.yPaddleLeft = int(height*1/2 - heightPaddle*1/2);
    heightPaddle = int(height*1/4);
    yLeftScore = yRightScore = height*0;
    widthScore = width*1/10;
    heightScore = height*1/10;
    xLeftScore = width*1/4 - widthScore*1/2;
    xRightScore = width*3/4 - widthScore*1/2;
  }//End Constructor

  void draw() {
    leftPaddle();
    rightPaddle();
  }//end draw

  void leftPaddle() {
    fill(colour);
    rect(xPaddleLeft, yPaddleLeft, widthPaddle, heightPaddle);
    move();
    for (int i=0; i<ballCounter; i++ ) {
      if (screenSaver == true) {
        yPaddleLeft = ball[i].ballYGetter() - heightPaddle*1/2;
      }//end IF
    }//end FOR
  }//end leftPaddle

  void rightPaddle() {
    fill(colour);
    rect(xPaddleRight, yPaddleRight, widthPaddle, heightPaddle);
    move();
    for (int i=0; i<ballCounter; i++ ) {
      if (screenSaver == true || singlePlayer == true) {
        yPaddleRight = ball[i].ballYGetter() - heightPaddle*1/2;
      }//end IF
    }//end FOR
  }//end rightPaddle

  void move() {
    if (leftUp == true) { 
      yPaddleLeft = yPaddleLeft - leftPaddleVelocity;
    } 
    if (leftDown == true) {
      yPaddleLeft = yPaddleLeft + leftPaddleVelocity;
    }  
    if (rightUp == true) {
      yPaddleRight = yPaddleRight - rightPaddleVelocity;
    } 
    if (rightDown == true) {
      yPaddleRight = yPaddleRight + rightPaddleVelocity;
    } 
        if (leftStop == true) {
      yPaddleLeft = yPaddleLeft + leftPaddleVelocity;
    }  
    if (rightStop == true) {
      yPaddleRight = yPaddleRight - rightPaddleVelocity;
    } 
 
    if (yPaddleLeft >= (height-heightPaddle)) yPaddleLeft = height - heightPaddle; 
    if (yPaddleLeft < height*0) yPaddleLeft = height*0; 
    if (yPaddleRight > (height-heightPaddle)) yPaddleRight = height - heightPaddle; 
    if (yPaddleRight < height*0) yPaddleRight = height*0;  
  }//end move

  void textSetup() {
    titleFont = createFont("Verdana", 55);
  }//End textSetup()

  void preDrawText(float height, color ink, int alignHorizontal, int alignVertical, PFont font) {
    fill(ink);
    textAlign(alignHorizontal, alignVertical);
  }//End preDrawText

  void textDraw(float height, color ink, int alignHorizontal, int alignVertical, PFont font, String string, float xScore, float yScore, float widthScore, float heightScore) {
    preDrawText(height, ink, alignHorizontal, alignVertical, font);
    textSize(textCalculator(height, string, widthScore));
    text(string, xScore, yScore, widthScore, heightScore);
  }//End textDraw()

  void textReset(color resetColor) {
    fill(resetColor);
  }//End textReset

  float textCalculator(float size, String string, float widthScore) {
    textSize(size);
    while (textWidth(string) > widthScore) {
      size = size*0.99;
      textSize(size);
    }
    size = size*0.15;
    return size;
  }//end textCalculator

  public void leftUpSetter() {
    leftUp = true;
    leftDown = false;
  }
  public void leftDownSetter() {
    leftDown = true;
    leftUp = false;
  }
  public void rightUpSetter() {
    rightUp = true;
    rightDown = false;
  }
  public void rightDownSetter() {
    rightDown = true;
    rightUp = false;
  }

  boolean twoPlayerGetter () {
    return twoPlayer;
  }
  boolean singlePlayerGetter () {
    return singlePlayer;
  }
  boolean leftModeSetter () {
    return leftMode = true;
  } 
  boolean rightModeSetter () {
    return rightMode = true;
  }
  boolean leftModeGetter () {
    return leftMode;
  } 
  boolean rightModeGetter () {
    return rightMode;
  }
  int leftScoreGetter() {
    return leftScore += 0;
  }
  int rightScoreGetter() {
    return rightScore += 0;
  }
  int leftScoreSetter () {
    return leftScore ++;
  }
  int rightScoreSetter () {
    return rightScore ++;
  }
  PFont fontGetter() {
    return titleFont;
  }
  color scoreColourGetter() {
    return scoreColour;
  }
  int textLeftScoreSetter() {
    return leftScore;
  }
  int textRightScoreSetter() {
    return rightScore;
  }
  float xLeftScoreGetter() {
    return xLeftScore;
  }
  float yLeftScoreGetter() {
    return yLeftScore;
  }
  float xRightScoreGetter() {
    return xRightScore;
  }
  float yRightScoreGetter() {
    return yRightScore;
  }
  float widthScoreGetter() {
    return widthScore;
  }
  float heightScoreGetter() {
    return heightScore;
  }
}//end Paddle
