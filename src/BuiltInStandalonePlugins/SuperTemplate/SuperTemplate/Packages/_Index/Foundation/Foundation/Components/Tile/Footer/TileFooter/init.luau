local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Enums.FillBehavior);
return function(v5) --[[ Line: 14 ]] --[[ Name: TileFooter ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, {
        LayoutOrder = 2, 
        tag = "size-full-0 auto-y shrink"
    }, v5.children);
end;