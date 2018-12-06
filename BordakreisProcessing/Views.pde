int screenState = 0;
int numberState = 0;

// Main Menu

Button menu1 = new Button("menu1", 100,100,500,200);
Button menu2 = new Button("menu2", 700,100,500,200);
Button menu3 = new Button("menu3", 100,400,500,200);
Button menu4 = new Button("menu4", 700,400,500,200);


int distanceInt1 = 0;
int distanceInt2 = 0;

void mainMenu(){
  menu1.Draw();
  menu2.Draw();
  menu3.Draw();
  menu4.Draw(); 
}

//SecondaryMenu

Button menu5 = new Button("zurück",100,100,200,100);

Button bestaetigen = new Button ("Bestätigen", 800, 100, 200, 100);
InputField winkelField = new InputField("45°", 100, 800, 100, 100);
InputField distance1 = new InputField("0", 250, 800, 150, 100);
InputField distance2 = new InputField("0", 450, 800, 150, 100);



void secondaryMenu(String label1){
  menu5.Draw();
  bestaetigen.Draw();
  drawNumPad();
  drawInputFields();
  fillInputFields();
  text(distanceInt1, 800, 100);
  text(distanceInt2, 800, 200);
  drawModell(100,400);
  drawLines(100,500);
  
}

void drawScreen(String label1){
  if (screenState == 0){
    mainMenu();
  }
  if(screenState == 1){
    secondaryMenu(label1);   
  }
}

void drawInputFields(){
  distance1.Draw();
  distance2.Draw();
  fill(30);
  winkelField.Draw();
  
}

void fillInputFields(){
  if(numberState == 1){
  distance1.setLabel(getNumber());
  distance2.setLabel("0");
  }
  if(numberState == 2){
  distance2.setLabel(getNumber());
  distance1.setLabel("0");
  }
}

void safeNumberInDistanceInt(){
  if(numberState == 1){
    distanceInt1= Integer.parseInt(getNumber());
  }
  if(numberState == 2){
    distanceInt2= Integer.parseInt(getNumber());
  }
}

void mousePressed(){
  if(screenState ==0){
    
    if (menu1.MouseIsOver()) {
      // print some text to the console pane if the button is clicked
      println("Clicked: 1");
      screenState = 1;
    }
    
  }else if(screenState == 1){
    if (menu5.MouseIsOver()) {
      // print some text to the console pane if the button is clicked
      println("Clicked: 5");
      screenState = 0;
    }
    else if(distance1.MouseIsOver()){
      clearNumber();
      numberState = 1;
      if(!distance1.getIsSelected()){
      distance1.changeSelection();
      }
      println("numberState is 0"); 
    }
    else if(distance2.MouseIsOver()){
      clearNumber();
      numberState = 2;
      if(!distance2.getIsSelected()){
      distance2.changeSelection();
      }
      println("numberState is 1"); 
    }
    else if(bestaetigen.MouseIsOver()){
      if(numberState == 1){
        distanceInt1= Integer.parseInt(getNumber());
        numberState = 0;
      }else if(numberState == 2) {
        distanceInt2= Integer.parseInt(getNumber());
        numberState = 0;
      }
      clearNumber();
    }
  }
    
    
    if(numberState != 0){
    isNumberHit();
    }
    
  }
  
  void changeNumberState(int state){
    numberState = state;
  }