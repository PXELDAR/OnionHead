import flixel.input.actions.FlxAction.FlxActionDigital;

class Controls
{
	// ============================================================================================
	public var left:FlxActionDigital;
	public var right:FlxActionDigital;
	public var jump:FlxActionDigital;
	public var pause:FlxActionDigital;

	public static final instance = new Controls();

	// ============================================================================================

	public function new()
	{
		initializeLeft();
		initializeRight();
		initializeJump();
		initializePause();
	}

	// ============================================================================================

	private function initializeLeft()
	{
		left = new FlxActionDigital();
		left.addKey(LEFT, PRESSED);
		left.addKey(A, PRESSED);
		left.addGamepad(DPAD_LEFT, PRESSED);
		left.addGamepad(LEFT_STICK_DIGITAL_LEFT, PRESSED);
	}

	// ============================================================================================

	private function initializeRight()
	{
		right = new FlxActionDigital();
		right.addKey(RIGHT, PRESSED);
		right.addKey(D, PRESSED);
		right.addGamepad(DPAD_RIGHT, PRESSED);
		right.addGamepad(LEFT_STICK_DIGITAL_RIGHT, PRESSED);
	}

	// ============================================================================================

	private function initializeJump()
	{
		jump = new FlxActionDigital();
		jump.addKey(SPACE, JUST_PRESSED);
		jump.addKey(W, JUST_PRESSED);
		jump.addKey(UP, JUST_PRESSED);
		jump.addGamepad(A, JUST_PRESSED);
	}

	// ============================================================================================

	private function initializePause()
	{
		pause = new FlxActionDigital();
		pause.addKey(ESCAPE, JUST_PRESSED);
		pause.addGamepad(START, JUST_PRESSED);
	}

	// ============================================================================================
}
