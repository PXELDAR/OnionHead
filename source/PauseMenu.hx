import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;

class PauseMenu extends FlxSubState
{
	// ============================================================================================
	private final _controls = Controls.instance;
	private final _backGroundColor = 0x52000000;
	private final _pauseTextSize = 42;
	private final _pauseText = "Game Paused!";
	private var _seconds = 0.0;

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

		FlxG.sound.music.pause();
	}

	// ============================================================================================

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		_seconds += elapsed;

		if (_controls.pause.check() && _seconds > 0.1)
		{
			FlxG.sound.music.play();
			close();
		}
	}

	// ============================================================================================
}
