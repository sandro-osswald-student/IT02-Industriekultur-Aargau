int screenState = 1;

// Main Menu

Button menu1 = new Button("menu1", 100,100,500,200);
Button menu2 = new Button("menu2", 700,100,500,200);
Button menu3 = new Button("menu3", 100,400,500,200);
Button menu4 = new Button("menu4", 700,400,500,200);

void mainMenu(){
  menu1.Draw();
  menu2.Draw();
  menu3.Draw();
  menu4.Draw(); 
}

//SecondaryMenu

Button menu5 = new Button("menu5",200,200,500,200);


void secondaryMenu(){
  menu5.Draw();
  numInput();
  
}

void drawScreen(){
  if (screenState == 0){
    mainMenu();
  }
  if(screenState == 1){
    secondaryMenu();   
  }
}



void mousePressed(){
  if(screenState ==0){
    
    if (menu1.MouseIsOver()) {
      // print some text to the console pane if the button is clicked
      print("Clicked: 1");
      screenState = 1;
    }
    
  }else if(screenState == 1){
    if (menu5.MouseIsOver()) {
      // print some text to the console pane if the button is clicked
      print("Clicked: 5");
      screenState = 0;
    }
    
    isNumberHit();
    
  }
  
  
  
}
