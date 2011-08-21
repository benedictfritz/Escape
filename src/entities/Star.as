package entities
{
    import flash.display.BitmapData;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Image;

    import worlds.*;

    public class Star extends Entity
    {
	[Embed(source = '../../assets/png/star.png')]
	    private const STAR:Class;
	private var exploded:Boolean;

	public function Star()
	{
	    var img:Image = new Image(STAR);
	    graphic = img;
	    setHitbox(img.width, img.height);
	    type = "star";
	}

	public function init(x:int, y:int):void
	{
	    this.x = x;
	    this.y = y;
	}

	override public function update():void
	{
	    if (collide("escapePlayer", x, y)) {
		EscapeWorld(this.world).addStar();
		EscapeWorld(this.world).removeCompliment();
		EscapeWorld(this.world).addCompliment();
		EscapeWorld(this.world).incrementScore();
		this.world.recycle(this);
	    }
	}
    }
}