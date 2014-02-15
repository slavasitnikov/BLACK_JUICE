package;

import flixel.system.scaleModes.FillScaleMode;
import flixel.FlxG;
import flixel.group.FlxGroup;
import Array;
import flixel.FlxState;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	var blocks:Array<String>;
	var player:Player;
	var lvl:Level;
	var chars:FlxGroup;
/**
	 * Function that is called up when to state is created to set it up. 
	 */

	override public function create():Void {
		super.create();

		blocks = [];
		createLvl();

		player = new Player(40);
		FlxG.camera.follow(player);
		add(player);

	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */

	override public function destroy():Void {
		super.destroy();
	}

	private var prevX:Float = -100;

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {

		lvl.collideWithLevel(player);

		if (player.x == prevX) {
			trace("DEAD");
		}

		prevX = player.x;

		super.update();
	}

	private function createLvl():Void {
		for (i in 0...10) {
			blocks[i] = "assets/data/block1.tmx";
		}
		lvl = new Level(blocks);
		add(lvl);
	}

}