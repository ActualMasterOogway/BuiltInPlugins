local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.StyleModifier);
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.numberToString);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v6 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v7 = require(l_Parent_0.Styling.supportsStyleSheets);
local v8 = require(l_Parent_0.UI.Components.TextInput);
local _ = require(script.Parent.Parent.Types);
return function(v10) --[[ Line: 19 ]] --[[ Name: NumberRenderer ]]
    -- upvalues: v1 (copy), v8 (copy), l_join_0 (copy), v7 (copy), v2 (copy), v4 (copy), v6 (copy)
    local l_Schema_0 = v10.Schema;
    local l_HasError_0 = v10.HasError;
    return v1.createElement(v8, l_join_0({
        Disabled = v10.Disabled, 
        OnFocusLost = function(v13) --[[ Line: 27 ]] --[[ Name: OnFocusLost ]]
            -- upvalues: v10 (copy)
            if v13 then
                v10.OnChanged((tonumber(v13)));
            end;
        end, 
        PlaceholderText = l_Schema_0.PlaceholderText, 
        Size = if v10.AutomaticSize then UDim2.new(1, 0, 0, v10.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
        StyleModifier = if not v7 and l_HasError_0 then v2.Error else nil, 
        Text = v4(v10.Value, l_Schema_0.Precision or 2)
    }, if v7 then {
        [v6.Tag] = if l_HasError_0 then l_Schema_0.ErrorStyle else nil
    } else nil));
end;