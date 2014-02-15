package;

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

		player = new Player();
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

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		super.update();

		lvl.collideWithLevel(player);
	}

	private function createLvl():Void {
		for(i in 0...10){
			blocks[i] = "assets/data/block1.tmx";
		}
		lvl = new Level(blocks);
		add(lvl);
	}
}