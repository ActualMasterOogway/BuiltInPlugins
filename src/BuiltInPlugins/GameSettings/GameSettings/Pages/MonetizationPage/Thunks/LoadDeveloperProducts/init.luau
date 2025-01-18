local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function() --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v3, v4) --[[ Line: 12 ]]
        -- upvalues: v1 (ref), v2 (ref)
        local v5 = v3:getState();
        local l_gameId_0 = v5.Metadata.gameId;
        local l_devProductsCursor_0 = v5.Settings.Current.devProductsCursor;
        if l_devProductsCursor_0 == nil then
            return;
        else
            local v8, v9 = v4.monetizationController:getDeveloperProducts(l_gameId_0, l_devProductsCursor_0);
            local l_Current_0 = v5.Settings.Current;
            local v11 = v5.Settings.Current.developerProducts and v5.Settings.Current.developerProducts or {};
            l_Current_0 = v1.Dictionary.join(l_Current_0, {
                devProductsCursor = v9, 
                developerProducts = v1.Dictionary.join(v11, v8)
            });
            v3:dispatch(v2(l_Current_0));
            return;
        end;
    end;
end;