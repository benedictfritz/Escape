package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import util.Util;
    import entities.*;

    public class WorldOne extends RealWorld
    {
	[Embed(source="ogmo/one.oel", mimeType="application/octet-stream")]
	    private static const MAP_ONE:Class;
	private var 
	    player:Player,
	    spikes:Array;

	public function WorldOne()
	{
	}

	override public function begin():void
	{
	    super.begin();
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
		player.init(int(dataElement.@x), int(dataElement.@y));
	    }
	    add(player);

	    spikes = new Array();
	    dataList = levelData.Objects.spike;
	    for each(dataElement in dataList)
	    {
		var spike:Spike = new Spike();
		spike.init(int(dataElement.@x), int(dataElement.@y));
		add(spike);
		spikes.push(spike);
	    }

	    dataList = levelData.Objects.escapeSign;
	    for each(dataElement in dataList)
	    {
		var escapeSign:Text = new Text("<- Escape", 
						 int(dataElement.@x),
						 int(dataElement.@y));
		escapeSign.color = 0xee6490;
		addGraphic(escapeSign);
	    }
	}

	override public function update():void
	{
	    var spike:Spike;
	    for each (spike in spikes)
            {
		if (spike.collide("player", spike.x, spike.y - spike.height)) {
		    spike.explode();
		}
	    }
	    if (player) {
		if (player.x > FP.width) {
		    FP.world = new WorldTwo();
		}
		else if (player.x < 0) {
		    super.stopMusic();
		    FP.world = new EscapeWorld();
		}
	    }
	    super.update();
	}
    }
}