local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Components.Icon);
local v4 = require(l_script_FirstAncestor_0.Components.Tooltip);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v6) --[[ Line: 16 ]] --[[ Name: Button ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), v3 (copy)
    local l_Item_0 = v6.Item;
    return v2.createElement("TextButton", {
        LayoutOrder = v6.NextOrder(), 
        [v2.Event.Activated] = l_Item_0.OnClick, 
        [v2.Tag] = v1.Styling.joinTags("VPF-Button", l_Item_0.Selected and "VPF-Button--Selected" or "VPF-Button--Unselected")
    }, {
        Tooltip = v2.createElement(v4, {
            Title = l_Item_0.Tooltip, 
            Description = l_Item_0.TooltipDescription
        }), 
        Contents = v2.createElement("Frame", {
            [v2.Tag] = "X-Fill X-PadS"
        }, {
            Icon = v2.createElement(v3, {
                Icon = l_Item_0.Icon
            })
        })
    });
end;