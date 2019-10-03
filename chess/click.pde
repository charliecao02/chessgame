void mouseClicked() {
  clickrow = mouseY/scale;
  clickcol = mouseX/scale;
  prevclickrow = clickrow;
  prevclickcol = clickcol;
  if(gridcolor[clickrow][clickcol]!=2) prevcolor=gridcolor[clickrow][clickcol];
  
  if(selected==false) selected=true;
  else if(selected==true && prevclickrow==clickrow && prevclickcol==clickcol) selected=false;
  else if(selected==true && prevclickrow!=clickrow && prevclickcol!=clickcol) selected=true;
  selectedtype=grid[clickrow][clickcol];  
}
