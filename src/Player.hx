package;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite {
	public var maxSpeed:Int = 50;
	public var speedRatio:Float = 10;

	public var jumpRatio:Float = .5;
	public var jumpMax:Int = 200;

	public var doubleJumpRatio:Float = 0.5;
	public var doubleJumpMax:Int = 100;

	private var canJump:Bool;
	private var canDoubleJump:Bool;

	public function new(X:Float = 0, Y:Float = 0) {
		super(x, y);
		makeGraphic(16, 16, FlxColor.GOLDEN);
		maxVelocity.set(maxSpeed, jumpMax + doubleJumpMax);
		acceleration.y = jumpMax;
		drag.x = maxVelocity.x * speedRatio;

	}

	override public function update():Void {
		acceleration.x = maxVelocity.x * speedRatio;

		if (velocity.y == 0) {
			canJump = true;
			canDoubleJump = false;
		}

		if (FlxG.keys.justPressed.UP) {
			if (canJump) {
				trace("JUMP");
				canJump = false;
				canDoubleJump = true;
				velocity.y = -jumpMax * jumpRatio;
			} else if (canDoubleJump) {
				trace("DOUBLE");
				canDoubleJump = false;
				velocity.y = -doubleJumpMax * doubleJumpRatio;
			}
		}
		super.update();
	}
}
