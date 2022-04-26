/* 
Author: Aleksander Dimitrov
Title: Origami Galaxy
Citations: Utilized the P3D library by Daniel Shiffman (https://processing.org/tutorials/p3d)
Instructions (largely mouse-based input, with some keyboard input for other options):
- Move the mouse to draw (the center is a revolving cube; x and y are inverted)
- Click and hold the left mouse button (LMB), then move (drag) the mouse to modify transparency/color depending on the primary mode
- Click 'a' on your keyboard to change to the alpha-modifying (primary) mode, where dragging the mouse modifies the transparency
- Click 'c' on your keyboard to change to the color-modifying (primary) mode, where dragging the mouse modifies the R/G/B value depending on the secondary mode
- Click '1' on your keyboard to change to the 1st random color preset (secondary) mode
- Click '2' on your keyboard to change to the 2nd random color preset (secondary) mode
- Click 'r' on your keyboard to change to the red color preset (secondary) mode
- Click 'g' on your keyboard to change to the green color preset (secondary) mode
- Click 'b' on your keyboard to change to the blue color preset (secondary) mode
- Click 's' on your keyboard to change to the "surprise" (starting from the current color) color preset (secondary) mode
- Click the up/down arrow on your keyboard to increase/decrease the frame rate (speed) of the animation
- Click the right mouse button (RMB) to reset the drawing canvas
*/

int a_value = 0;
int c_value = 0;
String mode1 = "alpha";
String mode2 = "random1";
float r; float g; float b; float a;
int rate = 60;

/* This method sets up the drawing canvas with some initial attributes. */
void setup()
{
  size(1280, 720, P3D);
  background(255);
  frameRate(rate);
  mouseX = 1500; mouseY = 1000;
}

/* This method sets up the basic shapes and properties of the animation. */
void draw() {
  switch(key) {
    case '1':
      mode2 = "random1";
      break;
    case '2':
      mode2 = "random2";
      break;
    case 'r':
      mode2 = "red";
      println(r);
      break;
    case 'g':
      mode2 = "green";
      break;
    case 'b':
      mode2 = "blue";
      break;
    case 'a':
      mode1 = "alpha";
      break;
    case 'c':
      mode1 = "color";
      break;
    case 's':
      mode2 = "surprise";
      break;
  }

   if (mode2.equals("random1")) {
     r = random(0,128); g = random(0,128); b = random(0,128); 
   }
   
   if (mode2.equals("random2")) {
     r = random(128,256); g = random(128,256); b = random(128,256); 
   }
   
   a = a_value+50;
   println(mode2);
   fill(r,g,b,a);

   translate(random(1280-mouseX,0), random(720-mouseY,0), 5);
   rotate(radians(random(0,360)));
   box(50);
   
   beginShape();
   vertex(random(-100, 0), random(-100, 0), random(-100, 0));
   vertex(random(0, 100), random(-100, 0), random(-100, 0));
   vertex(random(-100, 100), random(-100, 100), random(0, 100));
   
   vertex(random(0, 100), random(-100, 0), random(-100, 0));
   vertex(random(0, 100), random(0, 100), random(-100, 0));
   vertex(random(-100, 100), random(-100, 100), random(0, 100));
  
   vertex(random(0, 100), random(0, 100), random(-100, 0));
   vertex(random(-100, 0), random(0, 100), random(-100, 0));
   vertex(random(-100, 100), random(-100, 100), random(0, 100));
  
   vertex(random(-100, 0),  random(0, 100), random(-100, 0));
   vertex(random(-100, 0), random(-100, 0), random(-100, 0));
   vertex(random(-100, 100), random(-100, 100), random(0, 100));
   endShape(CLOSE);
}

/* This method sets up the dragging functionality of the mouse, depending on which modes are active. */
void mouseDragged() 
{
  if (mode1.equals("alpha")) {
    a_value = a_value + 1;
    if (a_value > 205) {
      a_value = -50;
    }
  }
  if (mode2.equals("red")) {
    r = r + 1; g = 0; b = 0;
    if (r > 255) {
      r = 100;
    }
  }
  else if (mode2.equals("green")) {
    r = 0; g = g + 1; b = 0;
    if (g > 255) {
      g = 100;
    }
  }
  else if (mode2.equals("blue")) {
    r = 0; g = 0; b = b + 1;
    if (b > 255) {
      b = 100;
    }
  }
  else if (mode2.equals("surprise")) {
    r = r + 1; g = g + 1; b = b + 1;
    if (r > 205) {
      r = -50;
    }
    if (g > 205) {
      g = -50;
    }
    if (b > 205) {
      b = -50;
    }
  }
}

/* This method sets up the functionality for the RMB click (resetting the canvas). */
void mousePressed()
{
  if (mouseButton == RIGHT) {
    background(255);
  }
}

/* This method sets up the functionality for the arrow key presses (modifying FPS). */
void keyPressed() { 
  if (key == CODED) { 
    if (keyCode == UP) {
      rate = rate + 1;
      setup();
    }
    else if (keyCode == DOWN) {
      rate = rate - 1;
      setup();
    }
  } 
}
