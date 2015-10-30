//declare variables
int num = 300;
float [] x = new float[num];
float [] y = new float[num];
float [] velX = new float[num];
float [] velY = new float[num];
float [] diam = new float[num];
color [] c = new color[num];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for(int i = 0; i < num; i++) {
    c[i] = color(255,random(64,192));
    x[i] = random(width);
    y[i] = random(height);
    diam[i] = random(5,50);
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for (int i = 0; i < num; i += 1) {
  //change color and draw ball
    fill(c[i]);
    ellipse(x[i], y[i], diam[i], diam[i]);

  //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];

  //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}