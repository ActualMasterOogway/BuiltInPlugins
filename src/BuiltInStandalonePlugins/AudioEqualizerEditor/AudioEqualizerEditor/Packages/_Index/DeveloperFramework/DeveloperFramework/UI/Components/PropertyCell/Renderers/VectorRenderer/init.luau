local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.LayoutOrderIterator);
local v5 = require(l_Util_0.numberToString);
local v6 = require(l_Parent_0.Parent.Dash);
local l_copy_0 = v6.copy;
local l_join_0 = v6.join;
local v9 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v10 = require(l_Parent_0.Styling.supportsStyleSheets);
local l_Components_0 = l_Parent_0.UI.Components;
local v12 = require(l_Components_0.Pane);
local v13 = require(l_Parent_0.UI.Components.TextInput);
local v14 = require(l_Components_0.TextLabel);
local v15 = require(l_Parent_0.Util.StyleModifier);
local _ = require(script.Parent.Parent.Types);
return function(v17) --[[ Line: 27 ]] --[[ Name: VectorRenderer ]]
    -- upvalues: v4 (copy), l_TextService_0 (copy), v2 (copy), v14 (copy), v5 (copy), v13 (copy), l_join_0 (copy), l_copy_0 (copy), v10 (copy), v9 (copy), v15 (copy), v12 (copy)
    local l_Schema_0 = v17.Schema;
    local v19 = {};
    local v20 = v4.new();
    local v21 = l_Schema_0.GetComponents(v17.Value);
    local v22 = l_Schema_0.Layout or Enum.FillDirection.Horizontal;
    local l_HasError_0 = v17.HasError;
    local v24 = nil;
    local v25 = #l_Schema_0.Components == 1;
    local v26 = 0;
    for _, v28 in l_Schema_0.Components do
        if v28 ~= "" then
            v26 = math.max(v26, l_TextService_0:GetTextSize(v28, 14, Enum.Font.SourceSans, Vector2.new(1, 1)).X);
        end;
    end;
    v24 = if v25 then UDim2.fromScale(1, 1) else if v22 == Enum.FillDirection.Vertical then UDim2.new(1, -v26 - 5, 0, 24) else UDim2.fromOffset(40, 24);
    for v29, v30 in ipairs(l_Schema_0.Components) do
        local v31 = nil;
        if v30 ~= "" then
            v31 = v2.createElement(v14, {
                AutomaticSize = if v22 == Enum.FillDirection.Vertical then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
                LayoutOrder = v20:getNextOrder(), 
                Size = if v22 == Enum.FillDirection.Vertical then UDim2.new(0, v26, 0, 0) else nil, 
                Style = "Label", 
                Text = v30
            });
        end;
        local v32 = nil;
        v32 = if v25 and l_Schema_0.GetChildren then v21[v29] else if typeof(v21[v29]) ~= "number" then v21[v29] else v5(v21[v29], l_Schema_0.Precision or 2);
        local v36 = v2.createElement(v13, l_join_0({
            Disabled = v17.Disabled, 
            LayoutOrder = v20:getNextOrder(), 
            OnFocusLost = function(v33) --[[ Line: 82 ]] --[[ Name: OnFocusLost ]]
                -- upvalues: v25 (copy), l_Schema_0 (copy), v21 (copy), v29 (copy), l_copy_0 (ref), v17 (copy)
                local v34 = tonumber(v33);
                if v25 and l_Schema_0.GetChildren then
                    v34 = v33;
                end;
                if v21[v29] ~= v34 then
                    local v35 = l_copy_0(v21);
                    v35[v29] = v34;
                    v17.OnChanged(l_Schema_0.GetValue(v35));
                end;
            end, 
            Size = v24, 
            Text = v32
        }, if v10 then {
            [v9.Tag] = if l_HasError_0 then l_Schema_0.ErrorStyle else nil
        } else {
            StyleModifier = if v17.HasError then v15.Error else nil
        }));
        if v22 == Enum.FillDirection.Vertical then
            v19[v29 .. " combined"] = v2.createElement(v12, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v20:getNextOrder(), 
                Layout = Enum.FillDirection.Horizontal, 
                Size = UDim2.new(1, 0, 0, 24), 
                Spacing = 5
            }, {
                Label = v31, 
                Input = v36
            });
        else
            v19[v29 .. " label"] = v31;
            v19[v29 .. " input"] = v36;
        end;
    end;
    return v2.createElement(v12, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = v22, 
        Spacing = 5
    }, v19);
end;