local l_FirstAncestor_0 = script.Parent:FindFirstAncestor("Tutorials");
local v1 = require(l_FirstAncestor_0.Src.Flags.getFFlagSpotlightManager)();
local v2 = require(script.Parent.TutorialStep).extend("StopPlaytest");
local v3 = {
    DataModel = "Standalone", 
    PluginType = "Standalone", 
    PluginId = "Ribbon", 
    Category = "Widgets", 
    ItemId = "LeftMezzanine/PlayControls/3"
};
v2.bind = function(v4) --[[ Line: 16 ]] --[[ Name: bind ]]
    -- upvalues: v1 (copy), v3 (copy)
    v4.tutorial.stopPlaying = function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy)
        v4:complete();
    end;
    v4.tutorial:resetAttachment();
    if v1 then
        v4.tutorial.Spotlight:ApplyHighlightAsync(v3);
    end;
end;
v2.unbind = function(v5) --[[ Line: 27 ]] --[[ Name: unbind ]]
    v5.tutorial.stopPlaying = nil;
end;
return v2;