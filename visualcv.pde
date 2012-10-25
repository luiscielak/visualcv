//
//  Project:      Visual CV
//  Last update:  2012-03-26
//  Author:       luis@luiscielak.com
//

import processing.pdf.*; 

PImage img1, img2, img3, img4;

PFont font;

color col;    // color variable

color col_blue = color(120, 220, 290, 140);
color col_white = color(240);

color col_orange = #f58020;

color col_lightorange = #f5ad73;

color col_grey = #a6a6a6;
color col_lightgrey = #f0f0f0;

color col_black = color(63);



String[] yearString = {
  "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012"
};

float totalYears = 9;    // yearString.length()

String[] skillString = {
  //  "HTML", "CSS", "XML", "PHP", "SQL", "ColdFusion", "VBA", "JavaScript", "Processing", ".NET"
  "100", "HTML", "XML", "SQL", "Processing", "CSS", "PHP", "ColdFusion", "JS", "VBA", ".NET"
};

int plotX1, plotY1, plotX2, plotY2;


float r;
float w;


void setup() {
  size(1170, 530);      // size(1170, 530);
  smooth();

  //  noLoop();

  font = createFont("TrebuchetMS.vlw", 20);
  col = col_orange;

  plotX1 = 10;
  plotY1 = 10;      // plotX1 = 90
  plotX2 = width-plotX1;
  plotY2 = height-plotY1;

  img1 = new PImage();
  img1 = loadImage("36-toolbox.png");
  img2 = new PImage();
  img2 = loadImage("140-gradhat.png");
  img3 = new PImage();
  img3 = loadImage("157-wrench.png");
  img4 = new PImage();
  img4 = loadImage("124-bullhorn.png");


  stroke(240);
  strokeWeight(1);
}

void draw() {
  background(col_white);


  getJobs();
  //  getLanguages();
  //  getSkills();
}

void getLanguages() {

  r = 230;



  noStroke();

  textAlign(CENTER);
  textFont(font, 14);

  // - icon
  imageMode(CENTER);
  fill(col, 110);
  noStroke();
  ellipse(img1.width, img1.height +5, img2.width*1.5, img2.width*1.5);
  tint(col_black, 120);
  image(img4, img1.width, img1.height+5);

  fill(col, 120);
  ellipse(width/2+r/2, height/2, r*2  +textWidth("spanglish")/2, r*2);

  ellipse(width/2-r/2, height/2, r*2 +textWidth("spanglish")/2, r*2); 

  fill(col_black, 165);

  textFont(font);

  text("spanish", width/2-r, height/2);
  text("english", width/2+r, height/2);
  text("spanglish", width/2, height/2);
}

void getSkills() {
  r= 171;  // 75 
  w = 64;  //29
  //  println(r+" "+w);


  noStroke();

  // -- SKILLS
  ellipseMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);

  // - icon
  fill(col, 110);
  noStroke();
  ellipse(img1.width, img1.height +5, img2.width*1.5, img2.width*1.5);
  tint(col_black, 130);
  image(img3, img1.width, img1.height+5);

  // -- create skills


  // center circle
  translate(width/2, height/2 + height/10);
  noFill();
  stroke(230, 100);

  // 10 bubbles along the curve
  // we keep track of our position along the curve
  float arclength = 0;

  for (int i = skillString.length-1; i > 0; i--) {

    arclength += w*1.5;
    float theta = arclength/r;

    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta);
    float mcol = map(i, skillString.length, 0, 120, 155);
    fill(col, mcol);
    noStroke();
    ellipse(0, 0, w* (skillString.length - i), w* (skillString.length - i ) /4);
    rotate(-theta);


    rotate(theta);
    // -- TEXT
    fill(col_black, 165);
    textFont(font);
    text(skillString[i], 0, 0);    
    popMatrix();
  }
}

void getJobs() {



  timeLine();
  getEntries();
  getIcons();
}

void getIcons() {
  // getIcons function for getJobs  method


  imageMode(CENTER);

  fill(col, 110);
  tint(col_black, 130);
  noStroke();

  // experience icon  
  ellipse(img1.width, img1.height +5, img2.width*1.5, img2.width*1.5);
  image(img1, img1.width, img1.height+5);

  // education icon
  ellipse(img2.width, height-img2.height -5, img2.width*1.5, img2.width*1.5);
  image(img2, img2.width, height-img2.height -5);
}

void getEntries() {

  rectMode(CORNER);
  textFont(font);
 
  float totalMonths = totalYears*12;

  float rectWidth = width/8;
  float rectHeight = 20;

  float position;    // 96 months
  float mposition;

  float duration;
  float mduration;


  // -- tir
  position = 12;  // 2006-02
  duration = 12;   // 3 months

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2-30, rectWidth, rectHeight);


  // -- tir tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height/2-30, mposition + 5, height/12);
  fill(120);
  ellipse(mposition + 5, height/12, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2-30, 5, 5);    

  fill(col_black);
  textSize(11);
  text("Turnberry International Realty", mposition + 5, height/16);
  fill(col_black, 100);
  text("web+db admin \n miami, fl", mposition + 5 +12, height/16+14);

  // -- Systems-tech
  position = 25;  // 2006-02
  duration = 5;   // 3 months

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2-31 -rectHeight, rectWidth, rectHeight);

  // -- systems-tech tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height/2-31 -rectHeight, mposition + 5, height/5);
  fill(120);
  ellipse(mposition + 5, height/5, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2-31 -rectHeight, 5, 5);    

  fill(col_black);
  textSize(11);
  text("Systems-Tech", mposition + 5, height/5.5);
  fill(col_black, 100);
  text("it consultant \n coral gables, fl", mposition + 5 +12, height/5.5+14);

  // -- fsu:cc
  position = 3 * 12 +1;  
  duration = 16;   

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2-32 -rectHeight*2, rectWidth, rectHeight);

  // -- fsu:cc tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height/2-32 -rectHeight*2, mposition + 5, height/12);
  fill(120);
  ellipse(mposition + 5, height/12, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2-32 -rectHeight*2, 5, 5);    

  fill(col_black);
  textSize(11);
  text("FSU Career Center", mposition + 5, height/16);
  fill(col_black, 100);
  text("technology assistant \ntallahassee, fl", mposition + 5 +12, height/16+14);


  // -- Sydney-web
  position = 3 * 12 + 5;  
  duration = 3;  

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2-33 -rectHeight*3, rectWidth, rectHeight);

  // -- sydney-web tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height/2-33 -rectHeight*3, mposition + 5, height/5);
  fill(120);
  ellipse(mposition + 5, height/5, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2-33 -rectHeight*3, 5, 5);    

  fill(col_black);
  textSize(11);
  text("Sydney-Web", mposition + 5, height/5.5);
  fill(col_black, 100);
  text("web dev intern \nsydney, nsw", mposition + 5 +12, height/5.5+14);

  // -- jpmc
  position = 4 * 12 + 6;  
  duration = 46;  

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2-34 - rectHeight*4, rectWidth, rectHeight);

  // -- 'current' job flag
  beginShape();
  fill(col_white);
  noStroke();
  vertex(mposition +2 +rectWidth, height/2-34 - rectHeight*4);
  vertex(mposition +2 +rectWidth, height/2-34 - rectHeight*4 +rectHeight);
  vertex(mposition - 10+rectWidth, height/2-34 - rectHeight*4 +rectHeight/2);
  endShape();

  // -- fsu:cc tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height/2-34 - rectHeight*4, mposition + 5, height/12);
  fill(120);
  ellipse(mposition + 5, height/12, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2-34 - rectHeight*4, 5, 5);    

  fill(col_black);
  textSize(11);
  text("JPMorgan Chase & Co.", mposition + 5, height/16);
  fill(col_black, 100);
  text("business systems analyst \n newark, de", mposition + 5 +12, height/16+14);



  // -- ACADEMICS

  // -- the academy
  duration = 2.5;  
  position = 7;    // grad date
  position = position - duration;    // subract time from graduation date

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2 -9 +21, rectWidth, rectHeight);  //-34 - rectHeight*4

  // -- academy tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height - height/2 -9 +21 + rectHeight, mposition + 5, height-height/6 -11); 
  fill(120);
  ellipse(mposition + 5, height-height/6 -11, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2 -9 +21 + rectHeight, 5, 5);    

  fill(col_black);
  textSize(11);
  text("The Academy", mposition + 5, height-height/6);
  fill(col_black, 100);
  text("comptia a+ \n coral gables, fl", mposition + 5 +12, height-height/6+14);

  // -- fiu
  duration = 24;  
  position = 2 * 12 + 6;     // grad date
  position = position - duration;    // subract time from graduation date

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2 -9 +22 + rectHeight, rectWidth, rectHeight);  //-34 - rectHeight*4

  // -- fiu tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height - height/2 -9 +21 + rectHeight*2, mposition + 5, height-height/3.5 -11);    // -11px font size
  fill(120);
  ellipse(mposition + 5, height-height/3.5 -11, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2 -9 +21 + rectHeight*2, 5, 5);    

  fill(col_black);
  textSize(11);
  text("Florida International University", mposition + 5, height-height/3.5);
  fill(col_black, 100);
  text("associate of arts \n miami, fl", mposition + 5 +12, height-height/3.5 +14 );


  // -- fsu
  duration = 24;  
  position = 4 * 12 + 6.5;     // grad date
  position = position - duration;    // subract time from graduation date

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;

  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2 -9 +23 + rectHeight*2, rectWidth, rectHeight);  //-34 - rectHeight*4

  // -- fsu tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height - height/2 -9 +21 + rectHeight*3, mposition + 5, height-height/5 -11);
  fill(120);
  ellipse(mposition + 5, height-height/5 -11, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2 -9 +21 + rectHeight*3, 5, 5);    

  fill(col_black);
  textSize(11);
  text("Florida State University", mposition + 5, height-height/5);
  fill(col_black, 100);
  text("bachelor of science: \n management information systems \n tallahassee, fl", mposition + 5 +12, height-height/5+14);




  // -- philaU
  duration = 10;               // duration in months  
  position = 4 * 24 + 4;     // grad date or today if current    /// <- FIX THIS!
  position = position - duration;    // subract time from graduation date

  mposition = map(position, 0, totalMonths, 0, width);
  mduration = map(duration, 0, totalMonths, 0, width);

  rectWidth = mduration;


  noStroke();
  fill(col, 140);
  rect(mposition +0.7, height/2 -9 +23 + rectHeight*3, rectWidth, rectHeight);  //-34 - rectHeight*4

  // -- philaU tooltip
  stroke(120, 150);
  strokeWeight(1);

  line(mposition + 5, height - height/2 -9 +41 + rectHeight*3, mposition + 5, height-height/5 -11);
  fill(120);
  ellipse(mposition + 5, height-height/5 -11, 1, 1);
  fill(40);
  ellipse(mposition + 5, height/2 -9 +41 + rectHeight*3, 5, 5);    

  fill(col_black);
  textSize(11);
  text("Philadelphia University", mposition + 5, height-height/5);
  fill(col_black, 100);
  text("master of science: \n interaction design & media \n philadelphia, pa", mposition + 5 +12, height-height/5+14);

  // -- 'current' school flag
  beginShape();
  fill(col_white);
  noStroke();
  vertex(mposition +2 +rectWidth, height/2+154 - rectHeight*4);
  vertex(mposition +2 +rectWidth, height/2+154 - rectHeight*4 +rectHeight);
  vertex(mposition - 10+rectWidth, height/2+154 - rectHeight*4 +rectHeight/2);
  endShape();
//34

}
void timeLine() {
  
  


  fill(120);
  stroke(120, 120);


  // year ticks      // 8-yr timeline
//  textAlign(LEFT);
  for (int i = 0; i < totalYears; i++) {
    if (i>0)line( width/totalYears * i, height/2 -totalYears, width/totalYears * i, height/2 +totalYears);
    // year text
    textSize(11);
    text(yearString[i], width/totalYears *i +textWidth(yearString[i]) +24, height/2 +4);


    // month+quarter ticks
    strokeWeight(0.5);
    for (int j = 0; j < 12; j++) {
         // --- FIX THIS!
      // ------- month ticks
//                              if (j>0)ellipse((width/8 * i) + j * width/96, height/2 -9, 0.5, 0.5);
//                              if (j>0)ellipse((width/8 * i) + j * width/96, height/2 +9, 0.5, 0.5);

      // -------- quarter ticks
      //                        if (j%4!=0) ellipse((width/8 * i) + j * width/32, height/2 -9, 1, 1);
      //                        if (j%4!=0) ellipse((width/8 * i) + j * width/32, height/2 +9, 1, 1);
 
     textAlign(LEFT);
    }
  }
}


// ------ print frames ------

void keyReleased() {
  if (key == 's' || key == 'S') {
    saveFrame(timestamp()+"_##.png");
    println(">> png saved!");
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
} 

void keyPressed() {
  if (key == 'b') {
    beginRecord(PDF, timestamp()+"_resume.pdf");
    println(">> record start");
  } 
  else if (key == 'e') {
    endRecord();
    exit();
  }
}

