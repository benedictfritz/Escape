package entities
{
    import flash.display.BitmapData;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Emitter;

    public class BloodSpurt extends Entity
    {
	private static const
	    BMP_WIDTH:Number = 3,
	    BMP_HEIGHT:Number = 3;

	private var 
	    emitter:Emitter,
	    hasExploded:Boolean = false,
	    lifeTime:Number = 0;

	public function BloodSpurt()
	{
	    var bmp:BitmapData = 
		new BitmapData(BMP_WIDTH, BMP_HEIGHT, false, 0xff0000);
	    emitter = new Emitter(bmp);
	    emitter.newType("1", [0]);
	    emitter.setMotion("1", 0, 25, 0, 360, 40, 0.2);
	    graphic = emitter;
	}
	
	public function init(x:int, y:int):void
	{
	    this.x = x;
	    this.y = y;
	}

	override public function update():void
	{
	    if (!hasExploded) {
		for (var i:int = 0; i < 200; ++i) {
		    emitter.emit("1", 0, 0);
		}
		hasExploded = true;
	    }
	    else {
		if (emitter.particleCount == 0) {
		    FP.world.recycle(this);
		}
	    }
	}
    }
}