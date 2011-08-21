package entities
{
    import flash.display.BitmapData;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Image;

    public class Player extends Entity
    {
	private static const 
	    WIDTH:Number = 20,
	    HEIGHT:Number = 20;
	private var 
	    xSpeed:Number = 200,
	    ySpeed:Number = 0,
	    gravity:Number = 1,
	    jumping:Boolean = false;

	public function Player()
	{
	    var img:Image = Image.createCircle(8, 0xFFFFFF);
	    graphic = img;
	    setHitbox(img.width, img.height);
	    type = "player";
	}

	public function init(x:int, y:int):void
	{
	    this.x = x;
	    this.y = y;
	}

	override public function update():void 
	{
	    var moveDistance:Number = xSpeed * FP.elapsed;
	    
	    if (Input.check(Key.D)) {
		x += moveDistance;
		if(collide("level", x, y)) {
		    x -= moveDistance;
		}
	    }
	    if (Input.check(Key.A)) {
		x -= moveDistance;
		if(collide("level", x, y)) {
		    x += moveDistance;
		}
	    }

	    if (Input.pressed(Key.W)) {
		if (!jumping) {
		    jumping = true;
		    ySpeed = 10;
		}
	    }

	    if (jumping) {
		y -= ySpeed;
		ySpeed -= gravity;
		if (collide("level", x, y)) {
		    jumping = false;
		    while(collide("level", x, y)) {
			y -= 1;
		    }
		}
	    }
	    // walking off edges case
	    else if (!collide("level", x, y+1)) {
		jumping = true;
		ySpeed = 0;
	    }
	}
    }
}