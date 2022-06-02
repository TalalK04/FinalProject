class Net {
  float x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet; // left net line
  float x1RightNet, y1RightNet, x2RightNet, y2RightNet; //right net line
  float x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine; //middle line

  Net (float width, float height) {
    x2MiddleLine= x1MiddleLine = width*1/2;
    x2LeftNet = x1LeftNet = width*1/40;
    x2RightNet = x1RightNet = width*39/40;
    y1MiddleLine = y1RightNet = y1LeftNet = height*0;
    y2MiddleLine = y2RightNet = y2LeftNet = height;
  }// end Constructor

  void draw() {
    stroke(255); 
    line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
    line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
    line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine);
    //println(x1RightNet);
  }//end netDraw
  
  float xLeftNetGetter(){
    return x1LeftNet;
  }
    float xRightNetGetter(){
    return x1RightNet;
  }
  
}//end class Net
