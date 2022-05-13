import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;

class PauseMenu extends FlxSubState
{
	// ============================================================================================
	private final _backGroundColor = 0x52000000;
	private final _pauseText = "Game Paused!";
	private final _pauseTextSize = 42;

	// ============================================================================================
	public function new()
	{
		super(_backGroundColor);
	}

	// ============================================================================================

	override public function create()
	{
		super.create();
		final pauseField = new FlxText(0, 0, 0, _pauseText, _pauseTextSize);
		pauseField.screenCenter(XY);
		add(pauseField);
	}

	// ============================================================================================

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.sound.music.play();
			close();
		}
	}

	// ============================================================================================
}
