local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function(v4) --[[ Line: 12 ]]
    -- upvalues: l_Promise_0 (copy), v1 (copy), v3 (copy)
    return function(v5, v6) --[[ Line: 13 ]]
        -- upvalues: v4 (copy), l_Promise_0 (ref), v1 (ref), v3 (ref)
        local v7 = v5:getState();
        local l_gameId_0 = v7.Metadata.gameId;
        local l_placesIndex_0 = v7.Settings.Current.placesIndex;
        local l_placesPageCursor_0 = v7.Settings.Current.placesPageCursor;
        local l_placesController_0 = v6.placesController;
        if l_placesPageCursor_0 == "" and not v4 then
            return;
        else
            return l_Promise_0.resolve(l_placesController_0:getPlaces(l_gameId_0, l_placesPageCursor_0, l_placesIndex_0)):andThen(function(v12, v13, v14) --[[ Line: 25 ]]
                -- upvalues: v7 (copy), v1 (ref), v5 (copy), v3 (ref)
                if v12 then
                    local l_Current_0 = v7.Settings.Current;
                    local v16 = v7.Settings.Current.places and v7.Settings.Current.places or {};
                    l_Current_0 = v1.Dictionary.join(l_Current_0, {
                        placesPageCursor = v13, 
                        places = v1.Dictionary.join(v16, v12), 
                        placesIndex = v14
                    });
                    v5:dispatch(v3(l_Current_0));
                end;
            end);
        end;
    end;
end;