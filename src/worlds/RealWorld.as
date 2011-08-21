package worlds
{
    import net.flashpunk.Sfx;
    import net.flashpunk.World;

    public class RealWorld extends World
    {
	[Embed(source="../../assets/mp3/Real.mp3")]
	    private static var MUSIC:Class;
	private var music:Sfx;

	public function RealWorld()
	{
	}

	override public function begin():void
	{
	    if (!music || !(music.playing)) {
		music = new Sfx(MUSIC);
		music.volume = 0.5;
		music.loop();
	    }
	}

	public function stopMusic():void
	{
	    if (music) {
		music.stop();
	    }
	}
    }
}