local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = v1.useEffect;
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v5 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
return function() --[[ Line: 11 ]] --[[ Name: useMouseDown ]]
    -- upvalues: v5 (copy), l_useState_0 (copy), v4 (copy)
    local v6 = v5:use();
    local v7 = v6:getMouse();
    local v8, v9 = l_useState_0(v6:IsMouseDown());
    v4(v7.Button1Down, function() --[[ Line: 16 ]]
        -- upvalues: v9 (copy)
        v9(true);
    end, {});
    v4(v7.Button1Up, function() --[[ Line: 19 ]]
        -- upvalues: v9 (copy)
        v9(false);
    end, {});
    return v8;
end;