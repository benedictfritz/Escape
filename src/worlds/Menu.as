package worlds 
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Text;

    import util.Util;
    import worlds.*;
	
    public class Menu extends World
    {
	private var 
	    titleText:Text,
	    titleTextEntity:Entity,
	    titleScale:Number,
	    startText:Text,
	    startTextEntity:Entity;
		
	public function Menu() 
	{
	    Util.addCenteredText("Escape(ism)", this, 40, 3);
	    Util.addCenteredText("[space] - start", this, FP.halfHeight);
	    Util.addCenteredText("WASD - move", this, FP.halfHeight + 20);
	}
		
	override public function update():void
	{
	    if (Input.pressed(Key.SPACE))
		FP.world = new Instructions;
	}
    }
}