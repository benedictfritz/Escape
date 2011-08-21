package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import util.Util;
    import entities.*;

    public class EscapeWorld extends World
    {
	[Embed(source="ogmo/escape.oel", mimeType="application/octet-stream")]
	    private static const ESCAPE:Class;
	private var player:EscapePlayer;

	public function EscapeWorld()
	{
	}

	override public function begin():void
	{
	    var level:Level = new Level(ESCAPE);
	    add(level);

	    player = new EscapePlayer();
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
	override public function update():void
	{
	    if (player) {
		if (player.x > FP.width) {
		    FP.world = new WorldOne();
		}
	    }
	    super.update();
	}

    }
}