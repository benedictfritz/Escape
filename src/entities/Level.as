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

	public function Level(xml:Class)
	{
	    type = "level";
	    loadLevel(xml);
	}

	private function loadLevel(xml:Class):void
	{
	    var rawData:ByteArray = new xml;
	    var dataString:String = rawData.readUTFBytes(rawData.length);
	    var xmlData:XML = new XML(dataString);
	    FP.console.log(xmlData);
	}
    }
}