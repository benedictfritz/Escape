package entities
{
    import flash.utils.ByteArray;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.masks.Grid;
    import net.flashpunk.graphics.Tilemap;
    
    public class Level extends Entity
    {
	private var 
	    tiles:Tilemap,
	    grid:Grid,
	    levelData:XML;
	
	private static const
	    WORLD_WIDTH:Number = FP.width,
	    WORLD_HEIGHT:Number = FP.height,
	    TILE_WIDTH:Number = 16,
	    TILE_HEIGHT:Number = 16;;
	
	[Embed(source="../../assets/png/tiles.png")]
	    private const SPRITETILESET:Class;

	public function Level(xml:Class)
	{
	    tiles = new Tilemap(SPRITETILESET, WORLD_WIDTH, WORLD_HEIGHT, 
				 TILE_WIDTH, TILE_HEIGHT);
	    graphic = tiles;
	    layer = 1;

	    grid = new Grid(WORLD_WIDTH, WORLD_HEIGHT, 
			     TILE_WIDTH, TILE_HEIGHT, 0, 0);
	    mask = grid;

	    type = "level";
	    loadLevel(xml);
	}

	private function loadLevel(xml:Class):void
	{
	    var rawData:ByteArray = new xml;
	    var dataString:String = rawData.readUTFBytes(rawData.length);
	    FP.console.log(dataString);

	    levelData = new XML(dataString);
	    
	    var dataList:XMLList;
	    var dataElement:XML;

	    dataList = levelData.OurTiles.tile;
	    for each(dataElement in dataList)
	    {
		tiles.setTile(int(dataElement.@x)/TILE_WIDTH,
			       int(dataElement.@y)/TILE_HEIGHT,
			       int(dataElement.@tx)/TILE_WIDTH);
		grid.setTile(int(dataElement.@x)/TILE_WIDTH,
			      int(dataElement.@y)/TILE_HEIGHT,
			      int(dataElement.@tx)/TILE_WIDTH == 1);
	    }
	}

	public function getLevelData():XML
	{
	    return levelData;
	}
    }
}