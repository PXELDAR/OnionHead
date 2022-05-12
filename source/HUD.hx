import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets;
import flixel.text.FlxText;

class HUD extends FlxTypedGroup<FlxSprite>
{
	// ============================================================================================
	public var score = 0;

	private var _scoreField:FlxText;
	private var _scoreText = "Score: ";

	private final _fontDir = "assets/fonts/Koulen-Regular.ttf";

	// ============================================================================================

	public function new()
	{
		super();

		FlxAssets.FONT_DEFAULT = _fontDir;
		_scoreField = new FlxText(32, 32, 132, _scoreText + Std.string(score), 24);
		_scoreField.scrollFactor.set(0, 0);
		add(_scoreField);
	}

	// ============================================================================================

	public function incrementScore()
	{
		score++;
		_scoreField.text = 'Score: $score';
	}

	// ============================================================================================
}
