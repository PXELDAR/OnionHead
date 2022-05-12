import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;

class LevelComplete extends FlxSubState
{
	// ============================================================================================
	public function new()
	{
		super(0x61000000);
	}

	// ============================================================================================

	override public function create()
	{
		super.create();

		final boundingBox = new FlxSprite();
		boundingBox.makeGraphic(460, 200, 0xFF6699ff);
		boundingBox.screenCenter(XY);
		add(boundingBox);

		final levelCompleteField = new FlxText(0, (boundingBox.y + 45), 0, "LEVEL COMPLETE!", 36);
		levelCompleteField.screenCenter(X);
		add(levelCompleteField);

		final subCompleteField = new FlxText(0, (boundingBox.y + 135), 0, "Press SPACE to continue", 18);
		subCompleteField.screenCenter(X);
		add(subCompleteField);
	}

	// ============================================================================================
	// ============================================================================================
}
