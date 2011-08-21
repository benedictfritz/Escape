package entities
{
    import flash.display.BitmapData;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Image;

    public class EscapePlayer extends Entity
    {
	private static const RADIUS:Number = 8;
	private var speed:Number = 300;

	public function EscapePlayer()
	{
	    var img:Image = Image.createCircle(RADIUS, 0xFFFFFF);
	    graphic = img;
	    setHitbox(img.width, img.height);
	    type = "escapePlayer";
	}

	public function init(x:int, y:int):void
	{
	    this.x = x;
	    this.y = y;
	}

	override public function update():void 
	{
	    var moveDistance:Number = speed * FP.elapsed;
	    
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

	    if (Input.check(Key.W)) {
		y -= moveDistance;
		if(collide("level", x, y)) {
		    y += moveDistance;
		}
	    }
	    if (Input.check(Key.S)) {
		y += moveDistance;
		if(collide("level", x, y)) {
		    y -= moveDistance;
		}
	    }
	}
    }
}