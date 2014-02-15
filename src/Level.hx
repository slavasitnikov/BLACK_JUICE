package;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import TiledBlock;

class Level extends FlxGroup {
	private var tiledBlocks:Array<TiledBlock>;

	public function new(blocks:Array<String>) {
		super(blocks.length);
		tiledBlocks = [];
		var offset:Int = 0;
		for(i in 0...blocks.length){
			var block:TiledBlock = new TiledBlock(blocks[i]);
			tiledBlocks[i] = block;
			block.foregroundTiles.setAll("x", offset);
			offset += block.fullWidth;
			add(block.foregroundTiles);
		}

		FlxG.camera.setBounds(0, 0, offset, tiledBlocks[0].fullHeight, true);
	}

	public function collideWithLevel(obj:FlxObject, ?notifyCallback:FlxObject->FlxObject->Void, ?processCallback:FlxObject->FlxObject->Bool):Void {
		for(i in 0...tiledBlocks.length){
			tiledBlocks[i].collideWithLevel(obj, notifyCallback, processCallback);
		}
	}
}
