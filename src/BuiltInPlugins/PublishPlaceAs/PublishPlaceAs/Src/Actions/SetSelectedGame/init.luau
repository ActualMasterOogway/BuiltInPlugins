local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Cryo);
local _ = require(l_Parent_0.Src.Resources.Constants);
local v3 = require(l_Parent_0.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v4) --[[ Line: 9 ]]
    -- upvalues: v3 (copy)
    v3.assertNullableType(v4, "table", "SetSelectedGame arg");
    return {
        selectedGame = v4
    };
end);