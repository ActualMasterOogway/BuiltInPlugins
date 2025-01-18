local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5) --[[ Line: 15 ]] --[[ Name: TileActions ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, {
        Visible = v5.Visible, 
        LayoutOrder = 3, 
        tag = "auto-y size-full-0 shrink"
    }, v5.children);
end;