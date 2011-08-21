package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.Sfx;
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
	    SCORE_INCREMENT:Number = 1234567,
	    COMPLIMENT_SCALE:Number = 3;
	
	[Embed(source="../../assets/mp3/Escape.mp3")]
	    private static var MUSIC:Class;
	[Embed(source="ogmo/escape.oel", mimeType="application/octet-stream")]
	    private static const ESCAPE:Class;

	private var 
	    player:EscapePlayer,
	    score:Score,
	    star:Star,
	    compliment:Text,
	    complimentArray:Array,
	    music:Sfx;

	public function EscapeWorld()
	{
	    music = new Sfx(MUSIC);
	    music.volume = 0.1;
	    music.loop();
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
	    initComplimentArray();
	}

	override public function update():void
	{
	    if (player) {
		if (player.x > FP.width) {
		    music.stop();
		    FP.world = new WorldOne();
		}
	    }
	    super.update();
	}
	
	public function addStar():void
	{
	    star = new Star();
	    var starX:Number = FP.rand(ESCAPE_ZONE_WIDTH - star.width) 
		+ ESCAPE_ZONE_PADDING;
	    var starY:Number = FP.rand(ESCAPE_ZONE_HEIGHT - star.height)
		+ ESCAPE_ZONE_PADDING;
	    star.init(starX, starY);
	    add(star);
	}

	public function removeCompliment():void
	{
	    if (compliment)
	    	compliment.visible = false;
	}

	public function addCompliment():void
	{
	    var randCompliment:String = 
		String(complimentArray[int(FP.rand(complimentArray.length))]);
	    compliment = new Text(randCompliment);
	    // var complimentX:Number = 
	    // 	FP.rand(ESCAPE_ZONE_WIDTH - compliment.width) 
	    // 	+ ESCAPE_ZONE_PADDING;
	    // var complimentY:Number = 
	    // 	FP.rand(ESCAPE_ZONE_HEIGHT - compliment.height) 
	    // 	+ ESCAPE_ZONE_PADDING;

	    var complimentX:Number = FP.halfWidth - 
		COMPLIMENT_SCALE*(compliment.width/2);
	    var complimentY:Number = FP.halfHeight;
	    compliment = new Text(randCompliment, complimentX, complimentY);
	    compliment.scale = COMPLIMENT_SCALE;
	    compliment.visible = true;
	    // compliment = new Text(randCompliment, complimentX, complimentY);
	    this.addGraphic(compliment);
	}

	public function incrementScore():void
	{
	    score.incrementScore(SCORE_INCREMENT);
	}

	public function initComplimentArray():void
	{
	    complimentArray = new Array(
					"Awesome!",
					"Incredible!",
					"You're the best!",
					"Keep going!",
					"You're a champion!",
					"Marvelous!",
					"Unbelievable!",
					"Unstoppable!",
					"Gee-Wiz!"
					);
	}
    }
}