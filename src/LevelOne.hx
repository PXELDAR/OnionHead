package;

import flixel.FlxState;

class LevelOne extends LevelState
{
	// ============================================================================================
	private final _playerXPos = 80;
	private final _playerYPos = 670;

	// ============================================================================================
	override public function create()
	{
		super.create();
		_nextLevel = LevelTwo;
		createLevel("levelOne", {x: _playerXPos, y: _playerYPos});
	}

	// ============================================================================================
}
