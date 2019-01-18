//Modell handels displaying of modell version of the bordakreis

//fixed Position for the Icons
int tree1Position = 30;
int housePosition = 150;
int siloPosition = 280;
int barnPosition = 342;
int tree2Position = 430;

void drawModell(int x, int y){  //draws the modell of the bordakreis at position x and y , x and y are the upper left corner of the modell
  fill(150);
  stroke(100);

//draws the Bordakreis disks themeselves
noStroke();
fill(158);
ellipse(x+262, y+300, 70, 70);
fill(69);
ellipse(x+262, y+300, 50, 50);

//drawes the icons of the 5 object at the position set above
image(treeImage, x+tree1Position, y-70);
image(houseImage, x+housePosition, y-70);
image(siloImage, x+siloPosition, y-70);
image(barnImage, x+barnPosition, y-72);
image(treeImage, x+tree2Position, y-70);
}
//checks if any Object left of this object is currently active. returns true if sensor of object is the leftmost activated sensor
boolean nothingLeftOf(int sensor){  
  for(int i = 1; i < sensor; i++){
    if(getSensorValue(i)!=0){
      return false;
    }
  }
  return true;
}

//handels drawing the lines connecting the bordakreis to the 5 objects
void drawLines(int x, int y, int gameState){
      textSize(32);
      strokeWeight(3);
      stroke(69);
      
      
      if(S1in+S2in+S3in+S4in+S5in== 0){//if none of the sensors are active, replaces icons above inputField with emptyIcon
        leftObject = loadImage("emptyIcon.png");
        rightObject = loadImage("emptyIcon.png");
        leftObjectName = "(kein Objekt ausgewählt)";
        rightObjectName = "(kein Objekt ausgewählt)";
      }
      if(S1in+S2in+S3in+S4in+S5in== 1 && S5in != 1){ //if one of the sensors are active, replaces right icon above inputField with emptyIcon
        rightObject = loadImage("emptyIcon.png");
        rightObjectName = "(kein Objekt ausgewählt)";
      }
      
      /*checks for gameState look if icons should be greyed out or not and if text for the lines should be displayed or not. 
      It also draws the line between bordakreis and object
      also decides which object is the left object in the game and which the right, dependant on which of the 5 sensors are active
      */
      
      if (S1in == 1) { //if sensor 1/object 1 is active, the following will be displayed
        if(gameState >= 2){ //if gameState 2 is active:
          text(distanceInt1 + "cm", x+80, y+150);  //shows text next to line with length of distance 1
          leftObject = loadImage("Icon Tree.png");  //left icon above Input Field becomes tree icon
        }else{
          leftObject = loadImage("Icon TreeInactive.png");  // if gameState is bellow 2: left icon above Input Field becomes greyed out tree icon
        }
        leftObjectName = "dem linken Baum";  // puts "den linken Baum" into the text description of the tasks
        line(x+62 , y, x+262, y+300);   //draws the actual Line between bordakreis and the tree object
      }
      else {
      }      
      
      if (S2in == 1) {  //if sensor 2/object 2 is active, the following will be displayed
        if(nothingLeftOf(2)){   //if this is the leftmost object
          if(gameState >= 2){  //and gameState is 2 or above
            text(distanceInt1 + "cm", x+160, y+150);  //shows text next to line with length of distance 1
            leftObject = loadImage("Icon House.png");  //left icon above Input Field becomes house icon
          }else{                                      //if gameState is bellow 2: 
            leftObject = loadImage("Icon HouseInactive.png");  //left icon above Input Field becomes greyed out house icon
          }
          leftObjectName = "dem Haus";   //puts "dem Haus" into the text description of the tasks
        }else{
          if(gameState >= 3){  //and gameState is 3 or above
          text(distanceInt2 + "cm", x+290, y+150);  //shows text next to line with length of distance 2
          rightObject = loadImage("Icon House.png");  //right icon above Input Field becomes house icon
        }else{                                        //if gameState is bellow 3: 
          rightObject = loadImage("Icon HouseInactive.png");//right icon above Input Field becomes greyed out house icon
        }
          rightObjectName = "dem Haus";
        }
        line(x+182, y, x+262, y+300); //draws the actual Line between bordakreis and the tree object
      }
      else {
      } 
      if (S3in == 1) {
        if(nothingLeftOf(3)){
          if(gameState >= 2){
          text(distanceInt1 + "cm", x+220, y+150);
          leftObject = loadImage("Icon Silo.png");
          }else{
            leftObject = loadImage("Icon SiloInactive.png");
          }
          leftObjectName = "dem Silo";
        }else{
          if(gameState >= 3){
            text(distanceInt2 + "cm", x+350, y+150);
            rightObject = loadImage("Icon Silo.png");
        }else{
          rightObject = loadImage("Icon SiloInactive.png");
        }
          rightObjectName = "dem Silo";
        }
        line(x+312, y, x+262, y+300);
      }
      else {
      }
      
      if (S4in == 1) {
        if(nothingLeftOf(4)){
          if(gameState >= 2){
            text(distanceInt1 + "cm", x+250, y+150);
            leftObject = loadImage("Icon Barn.png");
          }else{
            leftObject = loadImage("Icon BarnInactive.png");
          }
          leftObjectName = "der Scheune";
        }else{
          if(gameState >= 3){
          text(distanceInt2 + "cm", x+365, y+150);
          rightObject = loadImage("Icon Barn.png");
        }else{
          rightObject = loadImage("Icon BarnInactive.png");
        }
          rightObjectName = "der Scheune";
        }
        line(x+372, y, x+262, y+300); 
      }
      else {
      }      
      if (S5in == 1) {
        line(x+462, y, x+262, y+300);
        if(gameState >= 3){
          text(distanceInt2 + "cm", x+410, y+150);
          rightObject = loadImage("Icon Tree.png");
        }else{
          rightObject = loadImage("Icon TreeInactive.png");
        }
        rightObjectName = "dem rechten Baum";
      }
      else {
      }
      
      // Displays line between the two objects at the final screen
      if(gameState == 4){
        stroke(69);
        if(S1in==1 && S2in== 1){
          line(x+tree1Position+32, y, x+tree1Position+housePosition, y); //drawsLine between the two selected objects
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+housePosition))/2, y+20);  //displays the distance between the two objects (result)
        }else if(S1in==1 && S3in== 1){
          line(x+tree1Position+32, y, x+tree1Position+siloPosition, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+siloPosition))/2, y+20);
        }else if(S1in==1 && S4in== 1){
          line(x+tree1Position+32, y, x+tree1Position+barnPosition, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+barnPosition))/2, y+20);
        }else if(S1in==1 && S5in== 1){
          line(x+tree1Position+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+tree2Position))/2, y+20);
        }else if(S2in==1 && S3in== 1){
          line(x+housePosition+32, y, x+tree1Position+siloPosition, y);
          text(resultInt + "cm",((x+housePosition+32)+(x+tree1Position+siloPosition))/2, y+20);
        }else if(S2in==1 && S4in== 1){
          line(x+housePosition+32, y, x+tree1Position+barnPosition, y);
          text(resultInt + "cm",((x+housePosition+32)+(x+tree1Position+barnPosition))/2, y+20);
        }else if(S2in==1 && S5in== 1){
          line(x+housePosition+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+housePosition+32)+(x+tree1Position+tree2Position))/2, y+20);
        }else if(S3in==1 && S4in== 1){
          line(x+siloPosition+32, y, x+tree1Position+barnPosition, y);
          text(resultInt + "cm",((x+siloPosition+32)+(x+tree1Position+barnPosition))/2, y+20);
        }else if(S3in==1 && S5in== 1){
          line(x+siloPosition+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+siloPosition+32)+(x+tree1Position+tree2Position))/2, y+20);
        }else if(S4in==1 && S5in== 1){
          line(x+barnPosition+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+barnPosition+32)+(x+tree1Position+tree2Position))/2, y+20);
        }
      }
      
      
      //displays angel value inside of the bordakreis objects
      fill(255);
      textSize(32);
      textAlign(CENTER, CENTER);
      if(gameState >= 1){text(angle + "°" ,x+262, y+300);}
      
      textAlign(LEFT, TOP);
      stroke(30);
      strokeWeight(1);

} 