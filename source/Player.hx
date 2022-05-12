import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	// ============================================================================================
	private final _playerSpeed = 100;
	private final _dragForce = 4;
	private final _gravityForce = 600;
	private final _jumpForce = 1.5;

	private final _walkAnimation = "walk";
	private final _idleAnimation = "idle";

	private var _playerSpriteDir = "assets/images/player.png";

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
		final left = FlxG.keys.anyPressed([LEFT, A]);
		final right = FlxG.keys.anyPressed([RIGHT, D]);

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
		final jump = FlxG.keys.anyPressed([UP, W, SPACE]);

		if (jump && isTouching(FlxObject.FLOOR))
		{
			velocity.y = -_gravityForce / _jumpForce;
		}
	}

	// ============================================================================================
}
