local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_useState_0 = require(l_script_FirstAncestor_0.Packages.React).useState;
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: useTerrain ]]
    -- upvalues: l_useState_0 (copy)
    local v4 = nil;
    if v2 then
        if v3 then
            return;
        else
            v4 = {};
        end;
    else
        v4 = game.Workspace.Terrain;
    end;
    return (l_useState_0(v4));
end;