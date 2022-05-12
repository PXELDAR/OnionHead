import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;

class LevelComplete extends FlxSubState
{
	// ============================================================================================
	private final _backGroundColor = 0x61000000;

	private final _menuBoxColor = 0xFF6699ff;
	private final _menuBoxXSize = 460;
	private final _menuBoxYSize = 200;

	private final _levelCompleteText = "LEVEL COMPLETE!";
	private final _levelCompleteTextSize = 36;
	private final _levelCompleteTextOffset = 45;

	private final _continueText = "Press SPACE to continue";
	private final _continueTextSize = 18;
	private final _continueTextOffset = 135;

	private var _nextLevel:Class<LevelState>;

	// ============================================================================================
	public function new(nextLevel:Class<LevelState>)
	{
		super(_backGroundColor);
		_nextLevel = nextLevel;
	}

	// ============================================================================================

	override public function create()
	{
		super.create();

		final boundingBox = new FlxSprite();
		boundingBox.makeGraphic(_menuBoxXSize, _menuBoxYSize, _menuBoxColor);
		boundingBox.screenCenter(XY);
		add(boundingBox);

		final levelCompleteField = new FlxText(0, (boundingBox.y + _levelCompleteTextOffset), 0, _levelCompleteText, _levelCompleteTextSize);
		levelCompleteField.screenCenter(X);
		add(levelCompleteField);

		final subCompleteField = new FlxText(0, (boundingBox.y + _continueTextOffset), 0, _continueText, _continueTextSize);
		subCompleteField.screenCenter(X);
		add(subCompleteField);
	}

	// ============================================================================================

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(Type.createInstance(_nextLevel, []));
			close();
		}
	}
}
