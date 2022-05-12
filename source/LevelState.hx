import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class LevelState extends FlxState
{
	// ============================================================================================
	private var _levelBounds:FlxGroup;
	private var _player:Player;

	private var _platformGroup:FlxTypedGroup<FlxSprite>;
	private var _starGroup:FlxTypedGroup<FlxSprite>;

	private var _score = 0;

	private final _platformSpriteDir = "assets/images/platform.png";
	private final _platformLayer = "platform";

	private final _starSpriteDir = "assets/images/star.png";
	private final _starLayer = "star";

	// ============================================================================================

	override public function create()
	{
		bgColor = 0xffcccccc;
	}

	// ============================================================================================

	private function createLevel(levelName:String, playerPos:{x:Int, y:Int})
	{
		final map = new TiledMap('assets/data/$levelName.tmx');

		createPlatforms(map);
		createStars(map);

		final player = new Player(playerPos.x, playerPos.y);
		add(player);

		_levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	// ============================================================================================

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(_player, _levelBounds);
		FlxG.collide(_player, _platformGroup);
		FlxG.overlap(_player, _starGroup, onOverlapStar);
	}

	// ============================================================================================

	private function createPlatforms(map:TiledMap)
	{
		final platformLayer:TiledObjectLayer = cast(map.getLayer(_platformLayer));
		_platformGroup = new FlxTypedGroup<FlxSprite>();

		for (platform in platformLayer.objects)
		{
			final platformSprite = new FlxSprite(platform.x, platform.y);
			platformSprite.loadGraphic(_platformSpriteDir, false, 400, 32); // actual image size
			platformSprite.immovable = true;
			_platformGroup.add(platformSprite);
		}

		add(_platformGroup);
	}

	// ============================================================================================

	private function createStars(map:TiledMap)
	{
		final starLayer:TiledObjectLayer = cast(map.getLayer(_starLayer));
		_starGroup = new FlxTypedGroup<FlxSprite>();

		for (star in starLayer.objects)
		{
			final starSprite = new FlxSprite(star.x, star.y);
			starSprite.loadGraphic(_starSpriteDir, false, 24, 22); // actual image size
			starSprite.immovable = true;
			_starGroup.add(starSprite);
		}

		add(_starGroup);
	}

	// ============================================================================================

	private function onOverlapStar(_, star:FlxSprite)
	{
		star.kill();
		_score++;
	}

	// ============================================================================================
}
