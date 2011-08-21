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
	private static const
	    ESCAPE_ZONE_WIDTH:Number = 576,
	    ESCAPE_ZONE_HEIGHT:Number = 448,
	    ESCAPE_ZONE_PADDING:Number = 16,
	    SCORE_INCREMENT:Number = 1234567;
	
	[Embed(source="ogmo/escape.oel", mimeType="application/octet-stream")]
	    private static const ESCAPE:Class;
	private var 
	    player:EscapePlayer,
	    score:Score,
	    star:Star;

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

	    score = new Score();
	    dataList = levelData.Objects.score;
	    for each(dataElement in dataList) 
	    {
		score.init(int(dataElement.@x), int(dataElement.@y));
	    }
	    add(score);	    

	    addStar();
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
	
	public function addStar():void
	{
	    star = new Star();
	    var startX:Number = FP.rand(ESCAPE_ZONE_WIDTH - star.width) 
		+ ESCAPE_ZONE_PADDING;
	    var startY:Number = FP.rand(ESCAPE_ZONE_HEIGHT - star.height)
		+ ESCAPE_ZONE_PADDING;
	    star.init(startX, startY);
	    add(star);
	}

	public function incrementScore():void
	{
	    score.incrementScore(SCORE_INCREMENT);
	}
    }
}