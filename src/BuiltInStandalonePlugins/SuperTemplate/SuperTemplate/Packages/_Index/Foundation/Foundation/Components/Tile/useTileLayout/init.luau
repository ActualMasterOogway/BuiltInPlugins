local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_Parent_0.React);
local v5 = require(script.Parent.TileLayoutContext);
return function() --[[ Line: 22 ]]
    -- upvalues: v4 (copy), v5 (copy)
    return v4.useContext(v5);
end;