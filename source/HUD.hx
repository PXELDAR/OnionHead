import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class HUD extends FlxTypedGroup<FlxSprite>
{
	// ============================================================================================
	private var _scoreField:FlxText;
	private var _score = 0;
	private var _scoreText = "Score: ";

	// ============================================================================================

	public function new()
	{
		super();

		_scoreField = new FlxText(0, 0, 0, _scoreText + Std.string(_score));
		_scoreField.scrollFactor.set(0, 0);
		add(_scoreField);
	}

	// ============================================================================================

	public function incrementScore()
	{
		_score++;
		_scoreField.text = 'Score: $_score';
	}

	// ============================================================================================
}
