package entities
{
    import flash.display.BitmapData;

    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Text;
    import net.flashpunk.graphics.Image;

    import worlds.*;

    public class Player extends Entity
    {
	private static const 
	    WIDTH:Number = 20,
	    HEIGHT:Number = 20;
	private var 
	    xSpeed:Number = 200,
	    ySpeed:Number = 0,
	    gravity:Number = 1,
	    jumping:Boolean = false,
	    frozen:Boolean = false,
	    frozenTimer:Number = 0,
	    speech:Text,
	    speechArray:Array,
	    speechArrayIndex:Number = 0;


	public function Player()
	{
	    var img:Image = Image.createCircle(8, 0xFFFFFF);
	    graphic = img;
	    setHitbox(img.width, img.height);
	    type = "player";
	    layer = 2;
	    initSpeechArray();
	}

	public function init(x:int, y:int):void
	{
	    this.x = x;
	    this.y = y;
	}

	override public function update():void 
	{
	    if (!frozen) {
		checkKeyPresses();
	    
		var spike:Spike = collide("spike", x, y) as Spike;
		if (spike && !(spike.getCollided())) {
		    spike.hasCollided();
		    addSpeech();
		    frozen = true;
		}
	    }
	    else {
		frozenTimer += FP.elapsed;
		FP.console.log(String(frozenTimer));
		if (frozenTimer > 3) {
		    frozen = false;
		    speech.visible = false;
		    frozenTimer = 0;
		}
	    }
	}

	private function checkKeyPresses():void
	{
	    var moveDistance:Number = xSpeed * FP.elapsed;
	    
	    if (Input.check(Key.D)) {
		x += moveDistance;
		if(collide("level", x, y)) {
		    x -= moveDistance;
		}
	    }
	    if (Input.check(Key.A)) {
		x -= moveDistance;
		if(collide("level", x, y)) {
		    x += moveDistance;
		}
	    }

	    if (Input.pressed(Key.W)) {
		if (!jumping) {
		    jumping = true;
		    ySpeed = 10;
		}
	    }

	    if (jumping) {
		y -= ySpeed;
		ySpeed -= gravity;
		if (collide("level", x, y)) {
		    jumping = false;
		    while(collide("level", x, y)) {
			y -= 1;
		    }
		}
	    }
	    // walking off edges case
	    else if (!collide("level", x, y+1)) {
		jumping = true;
		ySpeed = 0;
	    }
	}

	private function addSpeech():void
	{
	    speech = new Text(speechArray[speechArrayIndex], x - 32, y - 64);
	    speech.color = 0xFFFFFF;
	    world.addGraphic(speech);
	    speechArrayIndex++;
	}

	private function initSpeechArray():void
	{
	    if (FP.world is WorldOne) {
		speechArray = new Array(
					"What is this?",
					"This isn't fun",
					"I should just go back",
					"I just want to escape",
					"This isn't even a game"
					);
	    }
	    else if (FP.world is WorldTwo) {
	    	speechArray = new Array(
	    				"Blabla",
	    				"Blabla",
	    				"Blabla",
	    				"Blabla",
	    				"Blabla"
	    				);
	    }
	}
    }
}