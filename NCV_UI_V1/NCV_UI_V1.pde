  import controlP5.*;
  import processing.serial.*;
  import grafica.*;
  import org.gicentre.utils.stat.*;
  
  ControlP5 cp5;
  int v1;
  int val = 0;
  
  Serial myPort;  // Create object from Serial class declaring a serial object ( to allow you to read in from serial port)
  String emgRead;//Data received from the serial port 
// For Plotting Line Graph
  float xPos = 1;   // horizontal position of the graph 
  float emg = 0; ;  // Store heart rate
   
  float[] yPlots = {};
  float[] xPlots = {};
  XYChart lineChart;

  int TotalActivity;

  void setup() {
    size(900, 700);  
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
    
    String portName = Serial.list()[0];
    myPort = new Serial(this, portName, 9600);
    lineChart = new XYChart(this);
    lineChart.showXAxis(true);
    lineChart.showYAxis(true);
      //lineChart.setXFormat("###.#");
    lineChart.setMinY(0);
       
      // Symbol colours
      textSize(9);
      lineChart.setPointColour(color(255,255,255,255));
      lineChart.setPointSize(3);
      lineChart.setLineWidth(1);
      lineChart.setYAxisLabel("EMG (mV)\n");
      lineChart.setXAxisLabel(" Time (ms)");
  }

  void draw() {
    background(200, 200, 200);
    //rect(50,300,800,400);
    textSize(20);
    fill(204, 102, 0);
    textAlign(CENTER);
    text("EMG Waveform", width/2, 50);
   
   //Outputting emg data
    emgRead = myPort.readStringUntil('\n');   // read it and store it in val
    println(emgRead); //print it out in the console
     
    //Attempt at outputting graph
    lineChart.draw(75,350,(width-200),(height/2)-80); 
    yPlots = append(yPlots, emg);
    xPlots = append(xPlots, TotalActivity);
    lineChart.setData(xPlots, yPlots);

  }
