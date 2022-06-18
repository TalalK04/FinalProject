void starCollisions() {
  for (int i = 0; i < ballCounter; i++) {
    for (int j=stars.length-1; j>1; j--) {
      float dist = dist(ball[i].x, ball[i].y, stars[j].x, stars[j].y);
      if ( dist < (stars[j].diameter*1/2 + ball[i].diameter*1/2) ) {
        collision = true;
      } else {
        collision = false;
      }//end IF
    }//end star FOR
  }//end ball FOR
}//End starCollisions
