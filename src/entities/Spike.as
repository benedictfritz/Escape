package entities
{
    import flash.display.BitmapData;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Image;

    public class Spike extends Entity
    {
	[Embed(source = '../../assets/png/spike.png')]
	    private const SPIKE:Class;
	private var exploded:Boolean;

	public function Spike()
	{
	    var img:Image = new Image(SPIKE);
	    graphic = img;
	    setHitbox(img.width, img.height);
	    type = "spike";
	    exploded = false;
	}

	public function init(x:int, y:int):void
	{
	    this.x = x;
	    this.y = y;
	}

	override public function update():void 
	{
	}
	
	public function explode():void
	{
	    if (!exploded) {
		y -= height;
		exploded = true;
	    }
	}
    }
}