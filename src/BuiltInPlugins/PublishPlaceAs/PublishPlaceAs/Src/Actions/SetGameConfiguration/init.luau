local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1.assertNullableType(v2, "table", "SetGameConfiguration arg");
    if not v2 then
        local _ = {};
    end;
    return {
        gameConfiguration = {
            optInRegions = v2.optInRegions or {}
        }
    };
end);