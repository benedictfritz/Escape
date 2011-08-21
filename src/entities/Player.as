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
	private static const WIDTH:Number = 20;
	private static const HEIGHT:Number = 20;
	private var speed:Number = 200;

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
	    if(collide("level", x, y)) {
		FP.console.log("collide!");
	    }

	    
	    if (Input.check(Key.D)) {
		if (x < FP.width - WIDTH)
		    x += speed * FP.elapsed;
	    }
	    if (Input.check(Key.A)) {
		if (x > 0 + WIDTH)
		    x -= speed * FP.elapsed;
	    }
	    if (Input.check(Key.W)) {
		if (y > 0)
		    y -= speed * FP.elapsed;
	    }
	    if (Input.check(Key.S)) {
		if (y < FP.height - HEIGHT)
		    y += speed * FP.elapsed;
	    }
	}
    }
}