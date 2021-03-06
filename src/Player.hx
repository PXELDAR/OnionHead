import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxSound;

class Player extends FlxSprite
{
	// ============================================================================================
	private var _jumpSound:FlxSound;
	private final _controls = Controls.instance;

	private final _playerSpeed = 200;
	private final _dragForce = 4;
	private final _gravityForce = 600;
	private final _jumpForce = 1.2;
	private var _jumpCount = 0;

	private final _walkAnimation = "walk";
	private final _idleAnimation = "idle";
	private final _playerSpriteDir = "assets/images/player.png";
	private final _jumpSoundDir = "assets/sounds/jump.wav";

	// ============================================================================================
	public function new(xPos:Int = 0, yPos:Int = 0)
	{
		super(xPos, yPos);

		loadGraphic(_playerSpriteDir, true, 32, 48);

		drag.x = _playerSpeed * _dragForce;

		animation.add("walk", [0, 1, 2, 3], 12);
		animation.add("idle", [0], 12, false);

		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);

		acceleration.y = _gravityForce / _jumpForce;

		_jumpSound = FlxG.sound.load(_jumpSoundDir);
	}

	// ============================================================================================

	override function update(elapsed:Float)
	{
		checkJump();
		super.update(elapsed);
		checkMovement();
	}

	// ============================================================================================

	private function checkMovement()
	{
		final left = _controls.left.check();
		final right = _controls.right.check();

		if ((left || right) && !(left && right))
		{
			animation.play(_walkAnimation);
		}
		else
		{
			animation.play(_idleAnimation);
		}

		if (right && left)
		{
			velocity.x = 0;
		}
		else if (right)
		{
			velocity.x = _playerSpeed;
			facing = FlxObject.RIGHT;
		}
		else if (left)
		{
			velocity.x = -_playerSpeed;
			facing = FlxObject.LEFT;
		}
	}

	// ============================================================================================

	private function checkJump()
	{
		final jump = _controls.jump.check();

		if (jump && _jumpCount < 2)
		{
			velocity.y = -_gravityForce / _jumpForce;
			_jumpSound.play(true);
			_jumpCount++;
		}

		if (isTouching(FlxObject.FLOOR))
		{
			_jumpCount = 0;
		}
	}

	// ============================================================================================
}
