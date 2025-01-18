local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v3 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v4 = require(l_Parent_0.Styling.supportsStyleSheets);
local l_Components_0 = l_Parent_0.UI.Components;
local v6 = require(l_Components_0.Breadcrumb);
local _ = require(script.Parent.Parent.Types);
return function(v8) --[[ Line: 16 ]] --[[ Name: BreadcrumbRenderer ]]
    -- upvalues: v1 (copy), v6 (copy), l_join_0 (copy), v4 (copy), v3 (copy)
    local l_Schema_0 = v8.Schema;
    local v10 = v8.ErrorMessage and v8.ErrorMessage ~= "";
    return v1.createElement(v6, l_join_0({
        Delimiters = l_Schema_0.Delimiters, 
        Editing = l_Schema_0.Editing, 
        GetAutocompleteItems = v8.GetAutocompleteItems, 
        GetImageProps = l_Schema_0.GetImageProps, 
        OnPressed = v8.OnPressed, 
        OnDoubleClick = v8.OnDoubleClick, 
        OnEdited = v8.OnChanged, 
        Size = if v8.AutomaticSize then UDim2.new(1, 0, 0, v8.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
        Style = if not v4 and v10 then l_Schema_0.ErrorStyle else nil, 
        Text = v8.Value
    }, if v4 then {
        [v3.Tag] = if v10 then l_Schema_0.ErrorStyle else nil
    } else nil));
end;