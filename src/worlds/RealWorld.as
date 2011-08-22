package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.Sfx;
    import net.flashpunk.World;

    import entities.BloodSpurt;

    public class RealWorld extends World
    {
	[Embed(source="../../assets/mp3/Real.mp3")]
	    private static var MUSIC:Class;
	public static var music:Sfx;
	private var bloodSpurt:BloodSpurt;

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

	public function addBloodSpurt(x:int, y:int):void
	{
	    bloodSpurt = new BloodSpurt();
	    bloodSpurt.init(x, y);
	    add(bloodSpurt);
	}

    }
}