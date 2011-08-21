package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import util.Util;
    import entities.*;

    public class WorldTwo extends World
    {
	[Embed(source="ogmo/two.oel", mimeType="application/octet-stream")]
	    private static const MAP_TWO:Class;
	private var player:Player;

	public function WorldTwo()
	{
	}

	override public function begin():void
	{
	    var level:Level = new Level(MAP_TWO);
	    add(level);

	    player = new Player();
	    var levelData:XML;
	    var dataList:XMLList;
	    var dataElement:XML;
	    levelData = level.getLevelData();
	    dataList = levelData.Objects.playerStart;
	    for each(dataElement in dataList) 
	    {
		player.init(int(dataElement.@x), int(dataElement.@y));
	    }
	    add(player);
	}
    }
}