package;

import flixel.FlxState;

class LevelTwo extends LevelState
{
	// ============================================================================================
	private final _playerXPos = 80;
	private final _playerYPos = 670;

	// ============================================================================================
	override public function create()
	{
		super.create();
		createLevel("levelTwo", {x: _playerXPos, y: _playerYPos});
	}

	// ============================================================================================
}
