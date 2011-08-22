package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;

    import util.Util;
    import worlds.*;

    public class End extends World
    {
	public function End()
	{
	    Util.addCenteredText("Congratulations.", this, FP.halfHeight - 40, 3);
	    Util.addCenteredText("You made it.", this, FP.halfHeight + 20, 2);
	}

	override public function update():void
	{
	    if (Input.pressed(Key.SPACE))
		FP.world = new Punchline;
	}
    }
}