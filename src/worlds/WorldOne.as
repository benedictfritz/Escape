package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import util.Util;
    import entities.*;

    public class WorldOne extends World
    {
	[Embed(source="ogmo/one.oel", mimeType="application/octet-stream")]
	    private static const MAP_ONE:Class;
	private var _player:Player;

	public function WorldOne()
	{
	    add(new Level(MAP_ONE));

	    Util.addCenteredText("Welcome to the new world!", this, 10);
	    _player = new Player();
	    add(_player);
	}
    }
}