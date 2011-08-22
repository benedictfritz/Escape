package worlds
{
    // har har punchline har har this game is stupid
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;

    import util.Util;

    public class Punchline extends World
    {
	public function Punchline()
	{
	    // Util.addCenteredText("It really means a lot to me that you took the time to finish this game.", this, FP.halfHeight - 20, 1);
	    Util.addCenteredText("Did you escape?", this, 
				 FP.halfHeight, 1);
	}

	override public function update():void
	{
	    if (Input.pressed(Key.SPACE))
		FP.world = new BlankWorld;
	}
    }

}