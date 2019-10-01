void mouseClicked() {
  clickrow = mouseY/scale;
  clickcol = mouseX/scale;
  prevclickrow = clickrow;
  prevclickcol = clickcol;
  
  if(selected==false) selected=true;
  else if(selected==true && prevclickrow==clickrow && prevclickcol==clickcol) selected=false;
  else if(selected==true && prevclickrow!=clickrow && prevclickcol!=clickcol) selected=true;
  selectedtype=grid[clickrow][clickcol];
  println(clickrow, clickcol);
  
}
