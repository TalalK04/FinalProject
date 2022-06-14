void starCollisions() {
  for (int i = 0; i < starCounter; i++) {
    for ( int j=0; j<ballCounter; j++ ) {
      float dist = dist(ball[j].x, ball[j].y, stars[i].x, stars[i].y);
      if ( dist < (stars[i].diameter*1/2 + ball[j].diameter*1/2) ) {
        collision = true;
      } else {
        collision = false;
      }//end IF
    }//end star FOR
  }//end ball FOR
}//End starCollisions
