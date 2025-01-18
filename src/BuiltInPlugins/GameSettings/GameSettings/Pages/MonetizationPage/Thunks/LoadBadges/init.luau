local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4, v5) --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref)
        local v6 = v4:getState();
        local l_gameId_0 = v6.Metadata.gameId;
        local v8 = nil;
        if not v3 then
            v8 = v6.Settings.Current.badgesCursor;
            if v8 == nil then
                return;
            end;
        end;
        local v9, v10 = v5.monetizationController:getBadges(l_gameId_0, v8);
        local l_Current_0 = v6.Settings.Current;
        if v3 then
            v10 = nil;
        else
            local v12 = v6.Settings.Current.badges and v6.Settings.Current.badges or {};
            v9 = v1.Dictionary.join(v12, v9);
        end;
        l_Current_0 = v1.Dictionary.join(l_Current_0, {
            badgesCursor = v10, 
            badges = v9
        });
        v4:dispatch(v2(l_Current_0));
    end;
end;