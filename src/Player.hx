package;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite {
	private var isJumped:Bool = false;

	public function new(X:Float = 0, Y:Float = 0) {
		super(x, y);
		makeGraphic(16,16, FlxColor.GOLDEN);
		maxVelocity.set(150, 350);
		acceleration.y = 350;
		drag.x = maxVelocity.x * 4;
	}

	override public function update():Void {
		acceleration.x = 0;
		if (FlxG.keys.pressed.LEFT)
		{
			acceleration.x = -maxVelocity.x * 4;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			acceleration.x = maxVelocity.x * 4;
		}
		if (FlxG.keys.pressed.SPACE && velocity.y == 0)
		{
			velocity.y = -maxVelocity.y / 2;
		}
		super.update();
	}
}
