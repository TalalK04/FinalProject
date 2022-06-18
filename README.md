# FinalProject

_Purpose:_ Pong is used as a training program that teaches all the basic concepts for coding as well as incredibly complex ones as more things get added

_Description:_ Rewriting OOP Pong and adding FINAL to methods and classes. Fully functional Pong game with encapsulated variables

Through the semester I enjoyed working with Pong especially with the object orientated version. When the final project was introduced I was interested to see how I could transform my OOP Pong and add inheritance to ensure the numerous variables that exist within my program are declared only once.

_List of Easter Eggs:_

- _Paddle getting smaller as the round goes on:_ To include this feature into the game I created a bounce variable in the ball class and every time the ball bounces on the wall or paddle the number in bounce would +1. Then at different amount of bounces I set the paddle to be increasingly smaller. This all happens in the ball class where I call the heightPaddle variable from the paddle class and set it to smaller and smaller values as the amount of bounces increase using IF's statements.

- _Momentum to Ball:_ I set the x and y Speed and multiplied it by x and y direction variables. I created a paddleHit boolean which would detect when the ball would hit the paddle. If paddleHit is true and the paddle is moving up or down at that time I set the x and y Direction to a number that would deflect the ball in a different angle other 45 degrees all the time. If the paddles aren't moving when paddleHit is true then the ball would bounce off the paddle at the same angle it hit it.

- _Ball speeding up:_ This feature works similar to the paddle changing size feature as the after a set amount of bounces the speed of the ball becomes faster. All the variables and methods which were used to make the feature fully functional are located in the ball class.

_List of unfinished Easter Eggs and features:_

- _Star Metaphor:_ To create the stars metaphor I created another ball constructor inside the ball class, as both the ball and the stars were closely related objects. I created a star array and after assigning the star with it's own random width, height and diameter variables I created function where I calculated the distance between each star and using a while loop made sure they did not overlap. It was a simple yet effective formula and I tried to use it to also determine if there was a collision between the ball and the star. However I encountered an issue as the ball only bounces off one of the many stars that appear on the screen and this is most likely because the ball is only detecting the first star in the star array. I tried to fix this issue but I wasn't able to create a functional nested FOR loop where the x and y variables of all the stars and the ball were being accounted for so ultimately I was not able to get the star metaphor to completely work

- _Scoreboard:_ Using a text calculator I was able to create a scoreboard for the left and right player. However for a long time I encountered the issue of resetting the ball to the middle of the screen once it scored on a net. The ball was part of an array and although I created a reset function that would set the x and y variables of the ball to the middle of the screen once a goal was scored, the x and y variables of ball that scored did not reset. I spent a lot time stuck on this error and eventually  just ran out time to fix it
