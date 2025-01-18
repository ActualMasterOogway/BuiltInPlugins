local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.ReleaseEditor);
local _ = require(l_Parent_0.Src.Util.AnalyticsGlobals);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return function(v6) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v1 (ref), v5 (copy), v4 (copy)
        v3:Deactivate();
        v6:dispatch(v1());
        v5:cleanup();
        v4:getHandler("ExitScreen")();
        v4:getHandler("SessionEnded")(true);
    end;
end;