local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.SharedFlags.getFFlagSelectRendererOnRenderItem)();
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = require(l_Parent_0.Styling.supportsStyleSheets);
local l_Components_0 = l_Parent_0.UI.Components;
local v7 = require(l_Components_0.SelectInput);
local v8 = require(l_Parent_0.Util.StyleModifier);
local _ = require(script.Parent.Parent.Types);
return function(v10) --[[ Line: 19 ]] --[[ Name: SelectRenderer ]]
    -- upvalues: v1 (copy), v7 (copy), l_join_0 (copy), v2 (copy), v5 (copy), v8 (copy), v4 (copy)
    local l_Schema_0 = v10.Schema;
    local v12 = v10.ErrorMessage and v10.ErrorMessage ~= "";
    return v1.createElement(v7, l_join_0({
        Enabled = not v10.Disabled, 
        Items = l_Schema_0.Items, 
        OnRenderItem = if v2 then v10.OnRenderItem else nil, 
        PlaceholderText = if v2 then v10.PlaceholderText or l_Schema_0.PlaceholderText else nil, 
        SelectedId = v10.Value, 
        Size = if v10.AutomaticSize then UDim2.new(1, 0, 0, v10.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
        StyleModifier = if not v5 and v12 then v8.Error else nil, 
        OnItemActivated = function(v13) --[[ Line: 37 ]] --[[ Name: OnItemActivated ]]
            -- upvalues: v10 (copy)
            v10.OnChanged(v13.Id);
        end
    }, if v5 then {
        [v4.Tag] = if v12 then l_Schema_0.ErrorStyle else nil
    } else nil));
end;