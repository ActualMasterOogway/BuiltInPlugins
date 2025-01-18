local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.StyleModifier);
local v3 = require(l_Parent_0.UI.Components.SegmentedButton);
local _ = require(script.Parent.Parent.Types);
return function(v5) --[[ Line: 10 ]] --[[ Name: SingleSelectButtonRenderer ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local l_Schema_0 = v5.Schema;
    local v7 = if v5.HasError then v2.Error else nil;
    return v1.createElement(v3, {
        ButtonWidths = l_Schema_0.ButtonWidths, 
        Disabled = v5.Disabled, 
        IconSize = if v5.Height then UDim2.fromOffset(v5.Height, v5.Height) else nil, 
        Items = l_Schema_0.Items, 
        OnItemActivated = function(v8) --[[ Line: 18 ]] --[[ Name: OnItemActivated ]]
            -- upvalues: v5 (copy)
            v5.OnChanged(v8.Id);
        end, 
        SelectedId = v5.Value, 
        Size = if v5.AutomaticSize then UDim2.new(1, 0, 0, v5.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
        StyleModifier = if v5.Disabled then v2.Disabled else v7
    });
end;