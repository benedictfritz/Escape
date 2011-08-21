package entities
{
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;
	
    import worlds.*;
	
    public class Score extends Entity
    {
	private var 
	    text:Text,
	    score:Number;

	public function Score() 
	{
	    score = 0;

	    Text.size = 32;
	    text = new Text("Score: " + score);
	    text.color = 0xFFFFFF;
	    graphic = text;
	    score = 0;
	}

	public function init(x:Number, y:Number):void
	{
	    this.x = x;
	    this.y = y;
	}

	public function incrementScore(amount:Number):void
	{
	    score += amount;
	}

	override public function update():void
	{
	    Text.size = 32;
	    text = new Text("Score: " + score);
	    text.color = 0xFFFFFF;
	    graphic = text;
	}
    }
}