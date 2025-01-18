local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v4) --[[ Line: 8 ]] --[[ Name: TextButton ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_Item_0 = v4.Item;
    local v6 = l_Item_0.Enabled ~= false;
    return v2.createElement("TextButton", {
        LayoutOrder = v4.NextOrder(), 
        Text = l_Item_0.Text, 
        [v2.Event.Activated] = if v6 then l_Item_0.OnClick else nil, 
        [v2.Tag] = v1.Styling.joinTags("VPF-TextButton", if v6 then nil else "VPF-TextButton--Disabled")
    });
end;