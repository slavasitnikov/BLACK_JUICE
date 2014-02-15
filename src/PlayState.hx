package;

import flixel.group.FlxGroup;
import flixel.FlxG;
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

		player = new Player();

		add(player);

	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		super.update();

		lvl.collideWithLevel(player);
	}

	private function createLvl():Void {
		blocks[0] = "assets/data/block1.tmx";
		blocks[1] = "assets/data/block2.tmx";
		lvl = new Level(blocks);
		add(lvl);
	}
}