int screenState = 0;
int gameState = 0;   //0 = trial, 1 = angle, 
int numberState = 0;  // 0 = none, 1 = angle, 2 = distance 1, 3 = distance 2
static int maxGameStates = 10;

// Main Menu

Button game = new Button("Spiel", 100,100,500,200);
Button menu2 = new Button("menu2", 700,100,500,200);
Button menu3 = new Button("menu3", 100,400,500,200);
Button menu4 = new Button("menu4", 700,400,500,200);

int angle = 0;
int distanceInt1 = 0;
int distanceInt2 = 0;



void mainMenu(){
  game.Draw();
  menu2.Draw();
  menu3.Draw();
  menu4.Draw(); 
}

//SecondaryMenu

Button home = new Button("Home",100,50,200,100);
Button next = new Button("weiter",700,50,200,100);
Button back = new Button("zurück",400,50,200,100);
Button newGame = new Button("wiederholen",700,50,200,100);

InputField angleField = new InputField("", 100, 800, 100, 100);
InputField distance1 = new InputField("", 250, 800, 150, 100);
InputField distance2 = new InputField("", 450, 800, 150, 100);
InputField result = new InputField("", 700, 800, 100, 100);



void secondaryMenu(){
    int x1 = 100;
    int y1 = 200;
    int x2 = 800;
    int y2 = 100;
    
  if(gameState == 0){
    home.Draw();
    next.Draw();
    back.Draw();
    drawModell(100,400);
    drawLines(100,400, gameState);
    fill(189,244,121);
    rect(x1, y1, x2, y2);
    textSize(26);
    String s = "Berechne die Distanz zwischen zweier Objekte. Beleuchte zwei Objekte mit dem Bordakreis um sie auszuwählen";
    fill(50);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    image(BordaGif, 950, 0);
    
    isNumberEmpty();
    
  }else if(gameState == 1){
    home.Draw();
    next.Draw();
    back.Draw();
    drawNumPad();
    drawInputFields();
    fillInputFields();
    drawModell(100,400);
    drawLines(100,400, gameState);
    fill(189,244,121);
    rect(x1, y1, x2, y2);
    textSize(32);
    String s = "Trage den angezeigten Winkel mit den Zahlentasten ein.";
    image(angleImage, 950, 0, 400, 250);
    textAlign(LEFT);
    fill(0);
    text("Winkelanzeige", 950, 280); 
    textAlign(CENTER);
    fill(50);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    isNumberEmpty();
    
  }else if(gameState == 2){
    home.Draw();
    next.Draw();
    back.Draw();
    drawNumPad();
    drawInputFields();
    fillInputFields();
    drawModell(100,400);
    drawLines(100,400, gameState);
    fill(189,244,121);
    rect(x1, y1, x2, y2);
    textSize(32);
    String s = "Messe die Distanz 1 vom Bordakreis zum Objekt und trage sie unten im Feld ein.";
    fill(50);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    isNumberEmpty();
    
  }else if(gameState == 3){
    home.Draw();
    next.Draw();
    back.Draw();
    drawNumPad();
    drawInputFields();
    fillInputFields();
    drawModell(100,400);
    drawLines(100,400, gameState);
    fill(189,244,121);
    rect(x1, y1, x2, y2);
    textSize(32);
    String s = "Messe die Distanz 2 vom Bordakreis zum Objekt und trage sie unten im Feld ein.";
    fill(50);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
    isNumberEmpty();
    
  }else if(gameState == 4){
    home.Draw();
    //next.Draw();
    newGame.Draw();
    back.Draw();
    drawNumPad();
    drawInputFields();
    drawModell(100,400);
    drawLines(100,400, gameState);
    fill(255,202,40);
    rect(x1, y1, x2, y2);
    textSize(32);
    String s = "Lösung: Wurzel aus (" + distanceInt1 + "^2 - 2 * " + distanceInt1 + " * " + distanceInt2 + " * cos(" + angle + ") + " + distanceInt2 + "^2) = " + Integer.toString(calculateResult(distanceInt1, distanceInt2, angle))+" cm";
    fill(0);
    text(s, x1, y1, x2, y2);  // Text wraps within text box
  }else if(gameState == 5){
    home.Draw();
    //next.Draw();
    newGame.Draw();
    back.Draw();
    drawNumPad();
    drawInputFields();
    fillInputFields();
    //text(distanceInt1, 800, 100);
    //text(distanceInt2, 800, 200);
    drawModell(100,400);
    drawLines(100,400, gameState);
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
  
  if(gameState == 1){
      text("Winkel", 140, 780);
      angleField.Draw();
    
  }else if(gameState ==2){
    text("Distanz 1", 300, 780);
    distance1.Draw();
    fill(30);
    text("Winkel", 140, 780);
    angleField.Draw();
    
  }else if(gameState ==3){
    text("Distanz 1", 300, 780);
    text("Distanz 2", 500, 780);
    distance1.Draw();
    distance2.Draw();
    fill(30);
    text("Winkel", 140, 780);
    angleField.Draw();
  }else if(gameState <=4){
    text("Distanz 1", 300, 780);
    text("Distanz 2", 500, 780);
    distance1.Draw();
    distance2.Draw();
    fill(30);
    text("Winkel", 140, 780);
    angleField.Draw();
    text("Resultat", 750, 780);
    result.Draw();
    //angle = calculateAngle(0,0);
    result.setLabel(Integer.toString(calculateResult(distanceInt1, distanceInt2, angle))+" cm");
    println(angle);
  }
}

void fillInputFields(){
  if(numberState == 1){
  angleField.setLabel(getNumber()+ "°");
  drawBlinkingLine(100, 800);
  }
  if(numberState == 2){
  distance1.setLabel(getNumber()+ " cm");
  drawBlinkingLine(250, 800);
  }
  if(numberState == 3){
  distance2.setLabel(getNumber()+ " cm");
  drawBlinkingLine(450, 800);
  }
  
}

void safeNumberInDistanceInt(){
  if(numberState == 1){
    angle= Integer.parseInt(getNumber());
  }
  if(numberState == 2){
    distanceInt1= Integer.parseInt(getNumber());
  }
  if(numberState == 3){
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
  return int(sqrt(sq(distanceValue1) - 2*distanceValue1*distanceValue2*cos(angle) + sq(angle)));
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
      println("Clicked: 5");
      screenState = 0;
      gameState = 0;
      clearNumber();
      distance1.setIsHighlighted(false);
      distance2.setIsHighlighted(false);
      result.setIsHighlighted(false);
      angleField.setIsHighlighted(false);
    }
    else if (next.MouseIsOver()) {
     if(gameState==0){
      next();
      angleField.setIsHighlighted(true);
      clearNumber();
      numberState = 1;
     }else if(gameState==1 && next.canBeSelected()){  //&& angle != 0
      angle= Integer.parseInt(getNumber());
      next();
      numberState = 2;
      distance1.setIsHighlighted(true);
      angleField.setIsHighlighted(false);
      clearNumber();
     }else if(gameState==2 && next.canBeSelected()){// && distanceInt1 != 0){
      distanceInt1= Integer.parseInt(getNumber());
      next();
      numberState = 3;
      distance1.setIsHighlighted(false);
      distance2.setIsHighlighted(true);
      clearNumber();
     }else if(gameState==3 && next.canBeSelected()){ // && distanceInt2 != 0){
       distance2.setIsHighlighted(false);
       result.setIsHighlighted(true);
        distanceInt2= Integer.parseInt(getNumber());
      next();
      numberState = 4;
     
     }
     
    }
    else if(back.MouseIsOver()) {
      back();
      clearNumber();
      if(gameState==1){
        angle=0;
        numberState = 1;
        angleField.setIsHighlighted(true);
        distance1.setIsHighlighted(false);
      }else if(gameState==2){
        distanceInt1=0;
        numberState = 2;
        distance1.setIsHighlighted(true);
        distance2.setIsHighlighted(false);
      }else if(gameState==3){
        distance2.setLabel(getNumber());
        distanceInt2=0;
        distance2.setIsHighlighted(true);
        result.setIsHighlighted(false);
      }
    }
    else if(newGame.MouseIsOver()) {
      gameState = 0;
      clearNumber();
      distance1.setIsHighlighted(false);
      distance2.setIsHighlighted(false);
      result.setIsHighlighted(false);
      angleField.setIsHighlighted(false);
    }
  }
    
    
    if(numberState != 0){
    isNumberHit();
    }
    
  }
  
  void changeNumberState(int state){
    numberState = state;
  }
  
  public void setGameState(int i){
    gameState = i;
  }
  
  void next(){
     //if(gameState < maxGameStates){
   gameState +=1;
    //}
  }
  void back(){
    if(gameState > 0){
   gameState -=1; 
    }
  }
  void newGame(){
      gameState = 0;
      clearNumber();
      distance1.setIsHighlighted(false);
      distance2.setIsHighlighted(false);
      result.setIsHighlighted(false);
      angleField.setIsHighlighted(false);
  }
  
  int getNumberState(){
    return numberState;
  }
  void setNumberState(int numberState){
    this.numberState = numberState;
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
  
  