local l_FirstAncestor_0 = script.Parent:FindFirstAncestor("Tutorials");
local v1 = require(l_FirstAncestor_0.Src.Flags.getFFlagTutorialsUseLuaRibbon)();
local v2 = require(l_FirstAncestor_0.Src.Flags.getFFlagSpotlightManager)();
local v3 = require(script.Parent.TutorialStep).extend("StartPlaytest");
local v4 = {
    DataModel = "Standalone", 
    PluginType = "Standalone", 
    PluginId = "Ribbon", 
    Category = "Widgets", 
    ItemId = "LeftMezzanine/PlayControls/1"
};
local v5 = {
    PluginId = "QtRibbon", 
    Category = "Widgets", 
    ItemId = "Play"
};
v3.bind = function(v6) --[[ Line: 23 ]] --[[ Name: bind ]]
    -- upvalues: v1 (copy), v4 (copy), v5 (copy), v2 (copy)
    v6.tutorial.startPlaying = function() --[[ Line: 24 ]]
        -- upvalues: v6 (copy)
        v6:complete();
    end;
    v6.tutorial:attachTo(if v1 then {
        TargetWidgetUri = v4, 
        SubjectAnchorPoint = Vector2.new(0, 0), 
        TargetAnchorPoint = Vector2.new(0, 1), 
        Offset = Vector2.new(0, 20)
    } else {
        TargetWidgetUri = v5, 
        SubjectAnchorPoint = Vector2.new(0, 0), 
        TargetAnchorPoint = Vector2.new(0, 1), 
        Offset = Vector2.new(0, 20)
    });
    if v2 then
        v6.tutorial.Spotlight:ApplyHighlightAsync(if v1 then v4 else v5);
    end;
end;
v3.unbind = function(v7) --[[ Line: 45 ]] --[[ Name: unbind ]]
    v7.tutorial.startPlaying = nil;
end;
return v3;