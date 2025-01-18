local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.AssertType);
local v2 = require(script.Parent.Action);
local _ = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
return v2(script.Name, function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    v1.assertNullableType(v4, "table", "SetPublishInProgress arg");
    local v5 = v4 or {};
    local l_universe_0 = v5.universe;
    local l_place_0 = v5.place;
    local l_isPublish_0 = v5.isPublish;
    local l_failCount_0 = v5.failCount;
    local l_requestInFlight_0 = v5.requestInFlight;
    return {
        publishInProgress = {
            universe = l_universe_0, 
            place = l_place_0, 
            isPublish = l_isPublish_0, 
            failCount = l_failCount_0, 
            requestInFlight = l_requestInFlight_0
        }
    };
end);