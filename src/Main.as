package 
{
    import net.flashpunk.Engine;
    import net.flashpunk.FP;
    import worlds.Menu;

    [SWF(width = "640", height = "480")]

	public class Main extends Engine
	{
	    public function Main()
	    {
		super(640, 480, 60);
		FP.world = new Menu;
	    }
	}
}