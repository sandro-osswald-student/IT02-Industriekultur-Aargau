int screenState = 0;  //0 = main menu, 1 = game
int gameState = 0;   //0 = trial, 1 = angle, 2=distance1, 3=distance, 4 = Result
static int maxGameStates = 4;

//input
int angle = 0;
int distanceInt1 = 0;
int distanceInt2 = 0;
int resultInt = 0;

//y position of modell
int modellPositionY = 450;

//object names used in text
String leftObjectName = "(kein Objekt ausgewählt)";
String rightObjectName = "(kein Objekt ausgewählt)";

String angleLabel = " °";
String distance1Label = " cm";
String distance2Label = " cm";

//draws main menu with 4 buttons
void mainMenu(){
  
  game.Draw();
  menu2.notSelectable();  //greyes out unselectable buttons to not confuse test users.
  menu3.notSelectable();
  menu4.notSelectable();
  menu2.Draw();
  menu3.Draw();
  menu4.Draw(); 
}
//draw game screens 
void secondaryMenu(){ 
  fillInputFields();
  
  
  image(dufourMap, (displayWidth /10)*6, 0);  //displays dufour map on right site of screen
  drawTitle();  //draws title text
  drawNavigationList((displayWidth /10)*1 + (displayWidth /20), ((displayHeight/10)*9) -10);  
  
  
  //Textbox
  int x1 = (displayWidth /10)*1;  //200
  int y1 = (displayHeight/10)*3; //400
  int x2 = (displayWidth/10)*4; //800
  int y2 = (displayHeight/10)*4; //400
  
  drawTextBox();
  
  isNumberEmpty();
   
      //draws the four diffrent screens depending on the value in gameState
      
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
    drawInputFields();
    fillInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    String s = "Schritt 2: Trage den an der Wand angezeigten Winkel mit der Tastatur ein.";
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
    drawInputFields();
    fillInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    String s = "Schritt 3: Messe die Distanz vom Bordakreis zu " + leftObjectName + " mit dem am Bordakreis befestigten Messband. Trage die Distanz in ganzen Zentimetern mit der Tastatur ein.";
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
    drawInputFields();
    fillInputFields();
    drawModell((displayWidth /10)*6 + displayWidth /15,modellPositionY);
    drawLines((displayWidth /10)*6 + displayWidth /15,modellPositionY, gameState);
    
    String s = "Schritt 4: Messe die Distanz vom Bordakreis zu " + rightObjectName + " mit dem am Bordakreis befestigten Messband. Trage die Distanz in ganzen Zentimetern mit der Tastatur ein.";
    stroke(30);
    fill(50);
    textAlign(LEFT);
    textSize(32);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    textSize(32);
    isNumberEmpty();
    
  }else if(gameState == 4){
    home.Draw();
    newGame.Draw();
    back.Draw();
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

//draws either main menu or the game Menu depending on value of screenState
void drawScreen(){
  if (screenState == 0){
    mainMenu();
  }
  if(screenState == 1){
    secondaryMenu();   
  }
}

void drawTextBox(){
  noStroke();
  fill(255, 200);
  rect((displayWidth /10)*6 + displayWidth /20, (displayHeight /10)*8, (displayWidth /10)*3, (displayHeight /10)*1);
  fill(69);
  textSize(28);
  textAlign(CENTER);
  text("Schematisches Modell des Bordakreises zur Vermessung  von Distanzen.", 
  (displayWidth /10)*6 + displayWidth /20 + 20, (displayHeight /10)*8+20, (displayWidth /10)*3-40, (displayHeight /10)*1 );
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
    angleField.Draw();
    distance1.Draw();
    distance2.Draw();
    result.Draw();
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
//draws Titel at fixed position
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
  
//takes input value from universal number and saves it into specific value of angle and the two distances
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

//calculates result baseon on input of user
int calculateResult(int distanceValue1, int distanceValue2, int angle){
  if(angle != 0 && distanceValue1 != 0 && distanceValue2 != 0){
  return int(sqrt(((sq(distanceValue1)) + (sq(distanceValue2))) -(2 * distanceValue1 * distanceValue2 *cos(radians(angle)))));
  }
  return 0;
}

//checks if mouse is over button every time mouse is pressed, calls method dependend on which button is pressed
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
  
  //method for next button: activating new input fields and result
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
  
  //method of back button
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
  
  //resets all values when new game button is pressed
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
  //checks if number is empty: used to determine if next can be selected or not
  void isNumberEmpty(){
    
    if(getNumber().length() == 0 && getGameState() > 0){
      next.notSelectable();
      println("not selectable");
    }else{
      println("ist selectable now");
      next.turnSelectable();
    }
    
  }


  