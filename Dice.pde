Die[][] dice = new Die[3][3];
void rollAll()
{
	for(int x = 0; x < 3; x++)
		for(int y = 0; y < 3; y++)
			dice[x][y].roll();
}
void drawAll()
{
	for(int x = 0; x < 3; x++)
		for(int y = 0; y < 3; y++)
			dice[x][y].show();
}
int getSum()
{
	int sum = 0;
	for(int x = 0; x < 3; x++)
		for(int y = 0; y < 3; y++)
			sum += dice[x][y].value;
	return sum;
}
String getValues()
{
	String values = "";
	for(int x = 0; x < 3; x++)
		for(int y = 0; y < 3; y++)
		{
			values += "" + dice[x][y].value;
			if(x != 2 || y != 2)
				values += ", ";
		}
	return values;
}
void drawSum()
{
	fill(255);
	rect(20, 370, 340, 25, 10);
	textSize(15);
	fill(0);
	text("Total: " + getSum() + "         Values: " + getValues(), 25, 387);
}
void setup()
{
	size(380, 400);
	for(int x = 0; x < 3; x++)
		for(int y = 0; y < 3; y++)
			dice[x][y] = new Die((20 * (x + 1) + (100 * x)), (20 * (y + 1) + (100 * y)));
	rollAll();
	noLoop();
}
void draw()
{
	background(0);
	drawAll();
	drawSum();
}
void mousePressed()
{
	rollAll();
	redraw();
}
class Die
{
	int posX, posY;
	int value = 0;
	Die(int x, int y) //constructor
	{
		posX = x;
		posY = y;
	}
	void roll()
	{
		value = (int)(Math.random() * 6) + 1;
	}
	void show()
	{
		fill(255);
		rect(posX, posY, 100, 100, 10);
		fill(0);
		switch(value)
		{
		case 1:
			ellipse(posX + 50, posY + 50, 13, 13);
			break;
		case 2:
			ellipse(posX + 25, posY + 25, 13, 13);
			ellipse(posX + 75, posY + 75, 13, 13);
			break;
		case 3:
			ellipse(posX + 25, posY + 25, 13, 13);
			ellipse(posX + 50, posY + 50, 13, 13);
			ellipse(posX + 75, posY + 75, 13, 13);
			break;
		case 4:
			ellipse(posX + 25, posY + 25, 13, 13);
			ellipse(posX + 25, posY + 75, 13, 13);
			ellipse(posX + 75, posY + 25, 13, 13);
			ellipse(posX + 75, posY + 75, 13, 13);
			break;
		case 5:
			ellipse(posX + 25, posY + 25, 13, 13);
			ellipse(posX + 25, posY + 75, 13, 13);
			ellipse(posX + 75, posY + 25, 13, 13);
			ellipse(posX + 75, posY + 75, 13, 13);
			ellipse(posX + 50, posY + 50, 13, 13);
			break;
		case 6:
			ellipse(posX + 25, posY + 25, 13, 13);
			ellipse(posX + 25, posY + 75, 13, 13);
			ellipse(posX + 75, posY + 25, 13, 13);
			ellipse(posX + 75, posY + 75, 13, 13);
			ellipse(posX + 25, posY + 50, 13, 13);
			ellipse(posX + 75, posY + 50, 13, 13);
			break;
		}
	}
}
