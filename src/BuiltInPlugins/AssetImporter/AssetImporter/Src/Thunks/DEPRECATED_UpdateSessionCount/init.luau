local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.DEPRECATED_SetActiveSessionCount);
local v3 = require(l_Actions_0.DEPRECATED_SetSessionCount);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v5 = require(l_script_FirstAncestor_0.Src.Utility.shouldImportItem);
return function(v6, v7) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy)
    return function(v8) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v5 (ref), v7 (copy), v2 (ref), v3 (ref)
        local v9 = if v6 then v5(v6) else false;
        local v10 = if v7 then v5(v7) else false;
        local v11 = v8:getState().Sessions.activeSessionCount or 0;
        local l_sessionCount_0 = v8:getState().Sessions.sessionCount;
        if v9 and not v10 and v11 > 0 then
            v8:dispatch(v2(v11 - 1));
        elseif not v9 and v10 then
            v8:dispatch(v2(v11 + 1));
        end;
        if v6 and not v7 and l_sessionCount_0 > 0 then
            v8:dispatch(v3(l_sessionCount_0 - 1));
            return;
        else
            if not v6 and v7 then
                v8:dispatch(v3(l_sessionCount_0 + 1));
            end;
            return;
        end;
    end;
end;