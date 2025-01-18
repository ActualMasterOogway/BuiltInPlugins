local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.StyleModifier);
local v3 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkFixAutocompleteDropdownMenuStyle();
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.UI.Components.TextInput);
local _ = require(script.Parent.Parent.Types);
return function(v9) --[[ Line: 20 ]] --[[ Name: TextRenderer ]]
    -- upvalues: v1 (copy), v7 (copy), l_join_0 (copy), v3 (copy), v6 (copy), v2 (copy), v5 (copy)
    local l_Schema_0 = v9.Schema;
    local v11 = v9.HasError or v9.ErrorMessage and v9.ErrorMessage ~= "";
    return v1.createElement(v7, l_join_0({
        AutomaticSize = if v3 then Enum.AutomaticSize.None else nil, 
        Disabled = v9.Disabled, 
        GetAutocompleteItems = v9.GetAutocompleteItems, 
        OnFocused = v9.OnPressed, 
        OnFocusLost = function(v12) --[[ Line: 33 ]] --[[ Name: OnFocusLost ]]
            -- upvalues: v9 (copy)
            if v12 then
                v9.OnChanged(v12);
            end;
        end, 
        PlaceholderText = l_Schema_0.PlaceholderText, 
        Size = if v9.AutomaticSize then UDim2.new(1, 0, 0, v9.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
        Style = if v9.ErrorMessage and v9.ErrorMessage ~= "" then l_Schema_0.ErrorStyle else nil, 
        StyleModifier = if not v6 and v11 then v2.Error else nil, 
        Text = v9.Value
    }, if v6 then {
        [v5.Tag] = if v11 then l_Schema_0.ErrorStyle else nil
    } else nil));
end;