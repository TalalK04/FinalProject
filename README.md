# FinalProject

Purpose: Pong is used as a training program that teaches all the basic concepts for coding as well as incredibly complex ones as more things get added

Description: Rewriting OOP Pong and adding FINAL to methods and classes. Fully functional Pong game with encapsulated variables

Through the semester I enjoyed working with Pong especially with the object orientated version. When the final project was introduced I was interested to see how I could transform my OOP Pong and add inheritance to ensure the numerous variables that exist within my program are declared only once.

List of Easter Eggs:

- Paddle getting smaller as the round goes on: To include this feature into the game I created a bounce variable in the ball class and every time the ball bounces on the wall or paddle the number in bounce would +1. Then at different amount of bounces I set the paddle to be increasingly smaller. This all happens in the ball class where I call the heightPaddle variable from the paddle class and set it to smaller and smaller values as the amount of bounces increase using IF's statements.

- Momentum to Ball: I set the x and y Speed and multiplied it by x and y direction variables. I created a paddleHit boolean which would detect when the ball would hit the paddle. If paddleHit is true and the paddle is moving up or down at that time I set the x and y Direction to a number that would deflect the ball in a different angle other 45 degrees all the time. If the paddles aren't moving when paddleHit is true then the ball would bounce off the paddle at the same angle it hit it.

- Ball speeding up: This feature works similar to the paddle changing size feature as the after a set amount of bounces the speed of the ball becomes faster. All the variables and methods which were used to make the feature fully functional are located in the ball class.

List of unfinished Easter Eggs and features:

-
