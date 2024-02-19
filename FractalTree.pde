double fractionLength = .8; 
double branchAngle    = .2;  
int    smallestBranch = 15; 

public void setup() {   
	size(640, 480);    
	noLoop(); 
} 
public void draw() {   
	background(0);   
	stroke(255, 0, 0);   
	line(320, 480, 320, 380);   
	
	drawBranches(320, 380, 100, 3 * Math.PI/2);
} 

public void drawBranches(int x,int y, double branchLength, double angle) {   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	
	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);

	stroke((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256))
	line(x, y, endX1, endY1);
	
	stroke((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256))
	line(x, y, endX2, endY2);
	
	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
