package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

#if desktop
import Discord.DiscordClient;
#end

class WarningState extends MusicBeatState
{
	public static var leftState = false;

	var warningTxt:FlxText;

	override function create()
	{
		warningTxt = new FlxText(0, 0, FlxG.width, '');
		warningTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.RED, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(warningTxt);
		warningTxt.screenCenter();

		warningTxt.text = 'Haha, this is test bud.';

		super.create();
	}

	var canCtrl:Bool = true;

	override function update(elapsed:Float)
	{
		if (canCtrl)
		{
			if (controls.ACCEPT)
			{
				warningTxt.kill();

				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					leftState = true;
					FlxG.switchState(new TitleState());
				});
			}

			if (controls.BACK)
			{
				warningTxt.kill();

				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					#if desktop
					DiscordClient.shutdown();
					Sys.exit(1);
					#end
				});
			}
		}

		super.update(elapsed);
	}
}
