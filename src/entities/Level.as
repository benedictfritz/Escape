package entities
{
    import flash.utils.ByteArray;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.masks.Grid;
    import net.flashpunk.graphics.Tilemap;
    
    public class Level extends Entity
    {
	private var _tiles:Tilemap;
	private var _grid:Grid;

	[Embed(source="../../assets/png/tiles.png")]
	    private const SPRITE_TILESET:Class;

	public function Level(xml:Class)
	{
	    _tiles = new Tilemap(SPRITE_TILESET, 640, 480, 16, 16);
	    graphic = _tiles;
	    layer = 1;

	    _grid = new Grid(640, 480, 16, 16, 0, 0);
	    mask = _grid;

	    type = "level";
	    loadLevel(xml);
	}

	private function loadLevel(xml:Class):void
	{
	    var rawData:ByteArray = new xml;
	    var dataString:String = rawData.readUTFBytes(rawData.length);

	    FP.log(dataString);
	    
	    var xmlData:XML = new XML(dataString);
	    
	    var dataList:XMLList;
	    var dataElement:XML;

	    dataList = xmlData.OurTiles.rect;
	    for each(dataElement in dataList)
	    {
		_tiles.setTile(int(dataElement.@x)/16, int(dataElement.@y)/16,
			       int(dataElement.@tx)/16);
		FP.console.log("X: " + String(dataElement.@x) +
			       "Y: " + String(dataElement.@y) +
			       "Tile: " + String(int(dataElement.@tx)/16));
	    }
	}
    }
}