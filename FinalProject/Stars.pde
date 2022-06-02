void stars() {
  while (overlapping == true) {
    for ( int i=0; i<starCounter; i++ ) {
      //starX = random (net.xLeftNetGetter()+starDiameter*1/2, net.xRightNetGetter()-starDiameter*1/2);
      starX = random (width*1/4, width*3/4);
      starY = random (paddle.heightScoreGetter()+starDiameter*1/2, height - paddle.heightScoreGetter());
      starDiameter = width*1/20;
      stars[i] = new Ball (starX, starY, starDiameter);
      float d = dist(starX, starY, stars[i].x, stars[i].y);
      int j = i;

      while (j>=0) {
        if ( d > (stars[j].diameter*1/2 + starDiameter*1/2) ) {
          starX = random (net.xLeftNetGetter()+starDiameter*1/2, net.xRightNetGetter()-starDiameter*1/2);
          starY = random (paddle.heightScoreGetter()+starDiameter*1/2, height - paddle.heightScoreGetter());
        }//end xy while
        j--;
      }//end IF
      stars[i] = new Ball (starX, starY, starDiameter);
    }//end FOR
    overlapping = false;

    for (int i=0; i<stars.length; i++) {
      for (int j=stars.length-1; j>i; j--) {
        float d = dist(stars[j].x, stars[j].y, stars[i].x, stars[i].y);
        if  ( d < (stars[j].diameter*1/2 + stars[i].diameter*1/2) ) overlapping = true;
      }//end J FOR
    }//end I FOR
  }//end overlapping WHILE
}//end stars
