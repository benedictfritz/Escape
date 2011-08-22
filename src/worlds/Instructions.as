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
	
    public class Instructions extends World
    {
	private var 
	    titleText:Text,
	    titleTextEntity:Entity,
	    titleScale:Number,
	    startText:Text,
	    startTextEntity:Entity;
		
	public function Instructions() 
	{
	    Util.addCenteredText("You need to finish", 
				 this, FP.halfHeight - 20, 2);
	    Util.addCenteredText("this level.", this, FP.halfHeight + 20, 2);
	}
		
	override public function update():void
	{
	    if (Input.pressed(Key.SPACE))
		FP.world = new WorldOne;
	}
    }
}