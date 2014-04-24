#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
}


int dir = 1;    //direction variable

struct Point    //defined class
{                   
  int x;  
  int y;  
};

Point s1 = {2,1};
Point s2 = {2,2};  // points s1-s7 hold the coordinates of the initial.
Point s3 = {2,3};
Point s4 = {2,4};
Point s5 = {2,5};
Point s6 = {2,6};
Point s7 = {3,6};
Point s8 = {4,6};
Point s9 = {5,5};
Point s10 = {4,4};
Point s11 = {3,1};
Point s12 = {4,1};
Point s13 = {5,2};
Point s14 = {3,4};
Point s15 = {5,3};

Point initial[16] = {s1, s2, s3, s4, s5 ,s6, s7, s8, s9, s10, s11, s12, s13, s14,s15};  //array for letter "B"




void loop()                     // run over and over again
{
 drawInitial();
 moveInitial();
 wrapInitial();
 DisplaySlate();
 ClearSlate();
 delay(75);
}

void drawInitial()
{
  for(int i = 0; i < 15; i++)
  {
    DrawPx(initial[i].x, initial[i].y, 15);      //draws initial
  }
}

void moveInitial()              //moves initial according to buttons on keypad
{
  CheckButtonsDown();
  for (int i = 0; i < 16; i++) 
  {
    if (Button_Up) 
    {                              
      initial[i].y = initial[i].y + 1;
    }
    if (Button_Down)
    { 
      initial[i].y = initial[i].y - 1;
    }
    if (Button_Right)
    { 
      initial[i].x = initial[i].x + 1;
    }
    if (Button_Left)
    {  
      initial[i].x = initial[i].x - 1; 
    }
  }  
}

void wrapInitial()        //creates wrap-around borders/limits
{
  for (int i = 0; i < 16; i++)
  {
    if (initial[i].x == -1) 
    {  
      initial[i].x = 7;
    } 
    if (initial[i].x == 8)
    {  
      initial[i].x = 0;
    }
    if (initial[i].y == -1)
    {  
      initial[i].y = 7;
    }
    if (initial[i].y == 8)
    {  
      initial[i].y = 0;
    }
  }
}

