local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local _ = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v4) --[[ Line: 14 ]] --[[ Name: Label ]]
    -- upvalues: v2 (copy)
    local l_Item_0 = v4.Item;
    return v2.createElement("TextLabel", {
        LayoutOrder = v4.NextOrder(), 
        Text = l_Item_0.Text, 
        [v2.Tag] = "VPF-Label"
    });
end;