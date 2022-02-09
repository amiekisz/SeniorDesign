  import controlP5.*;

  ControlP5 cp5;
  int v1;
  int val = 0;

  void setup() {
    size(900, 750);  
    noStroke();
    cp5 = new ControlP5(this);
    cp5.addButton("Read Proximal Latency")
      .setOff()
      .setPosition(100,100)
      .setSize(200,19)
      ;
    cp5.addButton("Read Distal Latency")
      .setOff()
      .setPosition(100,150)
      .setSize(200,19)
      ;
    cp5.addButton("Calculate NCV")
      .setOff()
      .setPosition(100,200)
      .setSize(200,19)
      ;
    cp5.addNumberbox("Calculated NCV")
    .setPosition(450,125)
    .setSize(200,80)
    .setValue(val);
  }

  void draw() {
    background(200, 200, 200);
    rect(50,300,800,400);
  }
