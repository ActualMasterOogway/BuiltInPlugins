local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Components_0 = l_Parent_0.UI.Components;
local v3 = require(l_Components_0.IconButton);
local v4 = require(l_Components_0.Pane);
local l_forEach_0 = require(l_Parent_0.Parent.Dash).forEach;
local _ = require(script.Parent.Parent.Types);
return function(v7) --[[ Line: 14 ]] --[[ Name: ActionsRenderer ]]
    -- upvalues: l_forEach_0 (copy), v1 (copy), v3 (copy), v4 (copy)
    local l_Schema_0 = v7.Schema;
    local v9 = {};
    l_forEach_0(l_Schema_0.Items, function(v10, v11) --[[ Line: 17 ]]
        -- upvalues: v9 (copy), v1 (ref), v3 (ref), v7 (copy)
        v9["Button " .. v11] = v1.createElement(v3, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v11, 
            LeftIcon = v10.Icon, 
            OnClick = function() --[[ Line: 22 ]] --[[ Name: OnClick ]]
                -- upvalues: v7 (ref), v10 (copy)
                v7.OnChanged(v10);
            end, 
            Size = UDim2.fromScale(0, 1), 
            Text = v10.Label, 
            TooltipText = v10.Tooltip
        });
    end);
    return v1.createElement(v4, {
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        Layout = Enum.FillDirection.Horizontal
    }, v9);
end;