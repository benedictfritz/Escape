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
	private var player:Player;

	public function WorldOne()
	{
	}

	override public function begin():void
	{
	    Util.addCenteredText("Welcome to the new world!", this, 10);

	    var level:Level = new Level(MAP_ONE);
	    add(level);

	    player = new Player();

	    var levelData:XML;
	    var dataList:XMLList;
	    var dataElement:XML;
	    levelData = level.getLevelData();
	    dataList = levelData.Objects.playerStart;
	    for each(dataElement in dataList) 
	    {
		player.init(dataElement.@x, dataElement.@y);
	    }
	    add(player);
	}
    }
}