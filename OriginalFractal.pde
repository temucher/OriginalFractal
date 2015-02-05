private double fractionLength = .8; 
private double branchAngle = .6;  
public void setup() {
	size(1000,1000);
}
public void draw() {
	stroke(0);
	noLoop();
	drawFractal(500,800,400, 3*Math.PI/2);
}
public void drawFractal(int x, int y, double branchLength, double angle) {
	int endX = x;
	int endY = y -50;
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	// int endX1 = (int)(branchLength*Math.cos(angle1) + x); 
 //    int endY1 = (int)(branchLength*Math.sin(angle1) + y); 
 //    int endX2 = (int)(branchLength*Math.cos(angle2) + x); 
 //    int endY2 = (int)(branchLength*Math.sin(angle2) + y); 
    //drawing the main stem and the two branching off of it 
	line(x, y, endX, endY);
	line(x,endY, endX-30, endY-20);
	line(x,endY, endX+30, endY - 20);
	//drawing the leaves
	float lHeight = 5;
	float lWidth = 15;
	// float leafX1 = (float)endX1;
	// float leafY1 = (float)endY1;
	// float leafX2 = (float)endX2;
	// float leafY2 = (float)endY2;
	float endX1 = endX -30;
	float endY1 = endY - 20;
	float endX2 = endX + 30;
	float rot1 = (float)Math.PI/4;
	float rot2 = (float)-Math.PI/4;
	for(int leaves = 0; leaves<=3; leaves++) {
		fill(15,128,36);
		//first leaf
		pushMatrix();
		translate(endX1, endY1);
		rotate(rot1);
		ellipse(0, 0, lHeight, lWidth);
		popMatrix();
		//second leaf
		pushMatrix();
		translate(endX2, endY1);
		rotate(rot2);
		ellipse(0, 0, lHeight, lWidth);
		popMatrix();
		//getting ready for the next leaves
		lHeight += lHeight/4;
		lWidth += lWidth/4;
		endX1 +=5;
		endY1 +=5;
		endX2 -=5; 
	}
	if(branchLength >= 20) {
		drawFractal(endX, endY, branchLength, angle);
	}
}
/* Plan:
1.Draw 1 stem, using variables to hold all the coordinates.
2.Draw 2 stems branching off, to the right and left.
3.Add leaves to the stems, using drawLeaves().
4.Add another stem to the first main stem, but make it shorter a shorter length
*/