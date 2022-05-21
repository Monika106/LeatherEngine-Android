package states;

import utilities.Options;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class WarningState extends MusicBeatState
{
    override public function create()
    {
        super.create();

        var text = new FlxText(0,0,0,"Hey! Please Press A Button To start!\nPress A To Start! )", 32);
        text.font = Paths.font("vcr.ttf");
        text.screenCenter();
        text.setBorderStyle(OUTLINE, FlxColor.BLACK, 1.5, 1);
        add(text);

        #if android
        addVirtualPad(NONE, A);
        #end
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if(controls.ACCEPT)
            Options.setData(true, "Warning");
        else if(!controls.ACCEPT && controls.BACK)
            Options.setData(false, "Warning");

        if(controls.BACK)
            FlxG.switchState(new FlashingLightsMenu());
    }
}
