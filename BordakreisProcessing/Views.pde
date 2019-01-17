int screenState = 0;
int gameState = 0;   //0 = trial, 1 = angle, 2=distance1, 3=distance, 4 = Result
static int maxGameStates = 4;

// Main Menu

Button game = new Button("Spiel", 100,100,500,200);
Button menu2 = new Button("menu2", 700,100,500,200);
Button menu3 = new Button("menu3", 100,400,500,200);
Button menu4 = new Button("menu4", 700,400,500,200);

int angle = 0;
int distanceInt1 = 0;
int distanceInt2 = 0;
int resultInt = 0;

int modellPositionX = 1300;
int modellPositionY = 450;


//SecondaryMenu


String leftObjectName = "(kein Objekt ausgewählt)";
String rightObjectName = "(kein Objekt ausgewählt)";

String angleLabel = " °";
String distance1Label = " cm";
String distance2Label = " cm";

void mainMenu(){
  background(255);
  game.Draw();
  menu2.notSelectable();
  menu3.notSelectable();
  menu4.notSelectable();
  menu2.Draw();
  menu3.Draw();
  menu4.Draw(); 
}

void secondaryMenu(){  
  //background(backgroundPic);
  
  fillInputFields();
  
  image(backgroundPic, (displayWidth /10)*6, 0);
  drawTitle();
  drawNavigationList((displayWidth /10)*1 + (displayWidth /20), ((displayHeight/10)*9) -10);  
  
  
  //Textbox
  int x1 = (displayWidth /10)*1;  //200
  int y1 = (displayHeight/10)*3; //400
  int x2 = (displayWidth/10)*4; //800
  int y2 = (displayHeight/10)*4; //400
      
  if(gameState == 0){
    home.Draw();
    next.Draw();
    back.Draw();
    back.notSelectable();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    String s = "Ziel: Du möchtest die Distanz zwischen zwei Objekten berechnen. Schritt 1: Wähle frei zwei Objekte aus und beleuchte beide gleichzeitig mit den Lasern (die roten Lampen über den Objekten leuchten auf).";
    stroke(30);
    fill(50);
    textAlign(LEFT);
    textSize(32);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    textSize(32);
    
    image(BordaGif, (displayWidth /10)*1, (displayHeight/10)*5, (displayWidth /10)*4, (displayHeight/10)*3);
    isNumberEmpty();
    
  }else if(gameState == 1){
    home.Draw();
    next.Draw();
    back.Draw();;
    back.turnSelectable();
    //drawNumPad();
    drawInputFields();
    fillInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    //image(angleImage, 950, 0, 400, 250);
    //textAlign(LEFT);
    //fill(0);
    //text("Winkelanzeige", 950, 280); 
    String s = "Schritt 2: Trage den an der Wand angezeigten Winkel mit der Tastatur rechts unten ein.";
    stroke(30);
    fill(50);
    textAlign(LEFT);
    textSize(32);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    isNumberEmpty();
    
    
    
  }else if(gameState == 2){
    home.Draw();
    next.Draw();
    back.Draw();
    //drawNumPad();
    drawInputFields();
    fillInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    String s = "Schritt 3: Messe die Distanz vom Bordakreis zu " + leftObjectName + " mit dem am Bordakreis befestigten Messband. Trage die Distanz in ganzen Zentimetern mit der Tastatur unten ein.";
    stroke(30);
    fill(50);
    textAlign(LEFT);
    textSize(32);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    isNumberEmpty();
    
  }else if(gameState == 3){
    home.Draw();
    next.Draw();
    back.Draw();
    //drawNumPad();
    drawInputFields();
    fillInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    String s = "Schritt 4: Messe die Distanz vom Bordakreis zu " + rightObjectName + " mit dem am Bordakreis befestigten Messband. Trage die Distanz in ganzen Zentimetern mit der Tastatur unten ein.";
    stroke(30);
    fill(50);
    textAlign(LEFT);
    textSize(32);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    textSize(32);
    isNumberEmpty();
    
  }else if(gameState == 4){
    home.Draw();
    //next.Draw();
    newGame.Draw();
    back.Draw();
    //drawNumPad();
    drawInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    fill(255,202,40);
    stroke(30);
    textSize(32);
    String solution1 = "Lösung: Die Distanz zwischen " + leftObjectName + " und " + rightObjectName + " beträgt " + Integer.toString(calculateResult(distanceInt1, distanceInt2, angle))+" cm. "
    + "Das Resultat wurde mit folgender Gleichung berrechnet:";
    String solution2 = "Wurzel aus ( " + distanceInt1 + "cm^2   - 2  *   " + distanceInt1 + "cm   *   " + distanceInt2 + 
    "cm * cos(  " + angle + "°  ) +   " + distanceInt2 + "cm^2 ) = " + Integer.toString(calculateResult(distanceInt1, distanceInt2, angle)) + " cm";
    
    String solution3 = "Wurzel aus (             ^2 - 2 *              *              * cos(            ) +              ^2) = " + Integer.toString(calculateResult(distanceInt1, distanceInt2, angle)) + " cm";
    fill(0);
    text(solution1, x1, y1, x2, y2);
    text(solution2, x1, y1+130, x2 +100, y2);// Text wraps within text box
    text(solution3, x1, y1+200, x2 +100, y2);
    
    image(leftObject, x1+135, y1+170);
    image(leftObject, x1+290, y1+170);
    image(rightObject, x1+390, y1+170);
    image(angleImage, x1+530, y1+170);
    image(rightObject, x1+635, y1+170);
  }
}

void drawScreen(String label1){
  if (screenState == 0){
    mainMenu();
  }
  if(screenState == 1){
    secondaryMenu();   
  }
}

void drawInputFields(){
  
  textAlign(LEFT);
  image(angleImage, (displayWidth /10)*1 + 20, (displayHeight/10)*6);
  image(leftObject, (displayWidth /10)*2 + 20, (displayHeight/10)*6);
  image(rightObject, (displayWidth /10)*3 + 20, (displayHeight/10)*6);
  
  if(gameState == 1){
    //text("Winkel", inputFieldPositionX, inputFieldPositionY-20);
    angleField.Draw();
    distance1.Draw();
    distance2.Draw();
    
  }else if(gameState ==2){
    angleField.Draw();
    distance1.Draw();
    distance2.Draw();
    
  }else if(gameState ==3){
    angleField.Draw();
    distance1.Draw();
    distance2.Draw();
  }else if(gameState <=4){
    image(leftObject,  (displayWidth /10)*4 - displayWidth/60, (displayHeight/10)*6);
    image(rightObject,  (displayWidth /10)*4 + displayWidth/22, (displayHeight/10)*6);
    image(rulerImage,  (displayWidth /10)*4 + displayWidth/60, (displayHeight/10)*6);
    
    //image(leftObject, inputFieldPositionX + 660, inputFieldPositionY-100);
    //image(rightObject, inputFieldPositionX + 800, inputFieldPositionY-100);
    //image(rulerImage, inputFieldPositionX +730 , inputFieldPositionY-90);
    
    //text("Resultat", inputFieldPositionX+700, inputFieldPositionY-20);
    angleField.Draw();
    distance1.Draw();
    distance2.Draw();
    result.Draw();
    //angle = calculateAngle(0,0);
    resultInt = calculateResult(distanceInt1, distanceInt2, angle);
    result.setLabel(resultInt +" cm");
    println(angle);
  }
}

void fillInputFields(){
  if(gameState == 1){
  angleField.setLabel(getNumber()  + " °");
  drawBlinkingLine((displayWidth /10)*1 + 5, (displayHeight /10)*7);
  }
  if(gameState == 2){
  distance1.setLabel(getNumber()  + " cm");
  drawBlinkingLine((displayWidth /10)*2, (displayHeight /10)*7);
  }
  if(gameState == 3){
  distance2.setLabel(getNumber()  + " cm");
  drawBlinkingLine((displayWidth /10)*3, (displayHeight /10)*7);
  }
  
}

void drawTitle(){
  String s1 = "Exponat Bordakreis";
  String s2 = "wie früher vermessen wurde";
    stroke(30);
    textAlign(CENTER);
    
    textSize(64);
    text(s1, 600, 100);  // Text wraps within text box
    
    textSize(48);
    text(s2, 600, 170);
    
    strokeWeight(2);
    line(390, 110, 810, 110 );
    line(350, 180, 850, 180 );
}
  

void safeNumberInDistanceInt(){
  if(gameState == 1){
    angle= Integer.parseInt(getNumber());
  }
  if(gameState == 2){
    distanceInt1= Integer.parseInt(getNumber());
  }
  if(gameState == 3){
    distanceInt2= Integer.parseInt(getNumber());
  }
}

/*
int calculateAngle(int firstAngle, int secondAngle){
  
  if(portStream != null) {
    // Entspricht der Datenblock dem Format "SxxE\r\n"? Wenn ja, dann weiter
    if (portStream.length() == 6 && portStream.charAt(0) == 'S' && portStream.charAt(3) == 'E') {
      // 2. und 3. Zeichen auslesen
      firstAngle = int(portStream.substring(1,2));   // z.B. bei "S10E" = 1
      secondAngle = int(portStream.substring(2,3));   // z.B. bei "S10E" = 0
    }
  }
  if(firstAngle ==1 || firstAngle ==2 && secondAngle ==1 || secondAngle ==2 && firstAngle !=secondAngle){
    return 10;
  }
  return 0;
}

*/

int calculateResult(int distanceValue1, int distanceValue2, int angle){
  if(angle != 0 && distanceValue1 != 0 && distanceValue2 != 0){
  return int(sqrt(((sq(distanceValue1)) + (sq(distanceValue2))) -(2 * distanceValue1 * distanceValue2 *cos(radians(angle)))));
  }
  return 0;
}


void mousePressed(){
  if(screenState ==0){
    
    if (game.MouseIsOver()) {
      // print some text to the console pane if the button is clicked
      println("Clicked: 1");
      screenState = 1;
    }
    
  }else if(screenState == 1){
    if (home.MouseIsOver()) {
      // print some text to the console pane if the button is clicked
      screenState = 0;
      gameState = 0;
      clearNumber();
    }
    else if (next.MouseIsOver()&& gameState < 4) {
      next();
    }
    else if(back.MouseIsOver()) {
      back();
      
    }
    else if(newGame.MouseIsOver()) {
      if(gameState==maxGameStates){
        newGame();
      }
    }
  }    
  }
  
  
  public void setGameState(int i){
    gameState = i;
  }
  
  void next(){
   
   if(gameState==0){
      clearNumber();
      angleField.turnActive();
     }else if(gameState==1 && next.canBeSelected()){  //&& angle != 0
      angle= Integer.parseInt(getNumber());
      clearNumber();
      distance1.turnActive();
     }else if(gameState==2 && next.canBeSelected()){// && distanceInt1 != 0){
      distanceInt1= Integer.parseInt(getNumber());
      clearNumber();
      distance2.turnActive();
     }else if(gameState==3 && next.canBeSelected()){ // && distanceInt2 != 0){
      distanceInt2= Integer.parseInt(getNumber());
      clearNumber();
      result.turnActive();
     }
     if(gameState < maxGameStates && next.canBeSelected()){
     gameState +=1;
     }
  }
  void back(){
    clearNumber();
      if(gameState==2){
        angle=0;
        distance1.turnInactive();
        distance1.setLabel(distance1Label);
      }else if(gameState==3){
        distanceInt1=0;
        distance2.turnInactive();
        distance2.setLabel(distance2Label);
      }else if(gameState==4){
        distanceInt2=0;
        
      }
    
    if(gameState > 0){
   gameState -=1; 
    }
  }
  void newGame(){
      gameState = 0;
      clearNumber();
      distance1.setLabel(" cm");
      distance2.setLabel(" cm");
      distance1Label = (" cm");
      distance2Label = (" cm");
      
      angle=0;
      distanceInt1=0;
      distanceInt2=0;
      
  }
  
  
  
  int getGameState(){
    return gameState;
  }
  
  void isNumberEmpty(){
    if(getNumber() == "" && gameState >=1 && gameState <= 3){
      next.notSelectable();
      
    }else{
      next.turnSelectable();
    }
    
  }
  /*
  void getRightIconNmae(){
    switch(getRightObject()){
      case "leftTree": 
        return 0;
      case 1: 
        return 10; 
      case 2: 
        return 20;
      case 3: 
        return 30; 
      case 4: 
        return 40; 
      default:           
        return 3000;
    }
  }
  
*/



  