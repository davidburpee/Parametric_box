import peasy.*;
import controlP5.*;
import processing.opengl.*;

ControlP5 MyController; //controlP5 object name
PeasyCam cam;

int WIDTH;
int DEPTH;
int HEIGHT;
int BASECOLOR = 330;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(400);
  cam.setActive(false);

  cam.beginHUD();

  MyController = new ControlP5(this);

  MyController.addSlider("HEIGHT")
    .setPosition(20, 20)
    .setRange(5, 100)
    .setSize(240, 20)
    .setValue(10)
    .setColorForeground(color(BASECOLOR, 100, 100))
    .setColorLabel(color(0, 0, 100))
    .setColorBackground(color(BASECOLOR, 100, 50))
    .setColorValue(color(0, 0, 100))
    .setColorActive(color(BASECOLOR, 100, 100))
    ;

  MyController.addSlider("WIDTH")
    .setPosition(20, 45)
    .setRange(5, 50)
    .setSize(240, 20)
    .setValue(10)
    .setColorForeground(color(BASECOLOR, 100, 100))
    .setColorLabel(color(0, 0, 100))
    .setColorBackground(color(BASECOLOR, 100, 50))
    .setColorValue(color(0, 0, 100))
    .setColorActive(color(BASECOLOR, 100, 100))
    ;

  MyController.addSlider("DEPTH")
    .setPosition(20, 70)
    .setRange(5, 50)
    .setSize(240, 20)
    .setValue(10)
    .setColorForeground(color(BASECOLOR, 100, 100))
    .setColorLabel(color(0, 0, 100))
    .setColorBackground(color(BASECOLOR, 100, 50))
    .setColorValue(color(0, 0, 100))
    .setColorActive(color(BASECOLOR, 100, 100))
    ;

  MyController.setAutoDraw(false);
  cam.endHUD();
}
void draw() {
  rotateX(-1.7);
  rotateZ(1);
  //rotateY();
  background(0, 0, 15);
  noFill();
  stroke(0, 0, 40);
  box(100);

  pushMatrix();
  translate(0, 0, 50-(.5*HEIGHT));
  fill(BASECOLOR, 100, 100);
  stroke(0, 0, 100);
  strokeWeight(2);
  box(DEPTH, WIDTH, HEIGHT);
  popMatrix();

  gui();
}

void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  textSize(14);
  fill(0, 0, 50);
  text("Parametric Box", width-150, height - 50);
  text("by David Burpee", width-150, height - 30);
  MyController.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}