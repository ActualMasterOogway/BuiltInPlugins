local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v5 = require(l_script_FirstAncestor_0.Enums.Radius);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v9 = require(l_script_FirstAncestor_0.Components.Icon);
local v10 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = {
    [v4.Small] = v5.Small, 
    [v4.Medium] = v5.Medium, 
    [v4.Large] = v5.Large, 
    [v4.XLarge] = v5.Large, 
    [v4.XXLarge] = v5.Large
};
local v15 = {
    [v4.Small] = "Size_50", 
    [v4.Medium] = "Size_100", 
    [v4.Large] = "Size_150", 
    [v4.XLarge] = "Size_200", 
    [v4.XXLarge] = "Size_250"
};
local v16 = {
    isDisabled = false, 
    size = v4.Medium
};
return v3.memo(v3.forwardRef(function(v17, v18) --[[ Line: 54 ]] --[[ Name: IconButton ]]
    -- upvalues: v13 (copy), v16 (copy), v7 (copy), v14 (copy), v15 (copy), v2 (copy), v8 (copy), v3 (copy), v10 (copy), v12 (copy), v9 (copy)
    local v19 = v13(v17, v16);
    local v20 = v7();
    local v21 = v14[v19.size];
    local v22 = v20.Radius[v21];
    local v23 = v15[v19.size];
    local v24 = if v2.FoundationIconButtonPaddings then UDim.new(0, v20.Size[v23]) else UDim.new(0, v22);
    local v25 = v20.Semantic.Icon.Size[v19.size];
    local v26 = UDim2.fromOffset(v25, v25);
    local v27 = v8({
        radius = UDim.new(0, v22), 
        borderWidth = v20.Stroke.Thicker
    });
    return v3.createElement(v10, v12(v19, {
        onActivated = v19.onActivated, 
        Size = v26 + UDim2.new(v24, v24) + UDim2.new(v24, v24), 
        selection = {
            Selectable = not v19.isDisabled, 
            SelectionImageObject = v27
        }, 
        padding = v24, 
        cornerRadius = UDim.new(0, v22), 
        ref = v18
    }), {
        Icon = v3.createElement(v9, {
            name = v19.icon, 
            size = v19.size, 
            style = if v2.FoundationIconButtonPaddings then v20.Color.Content.Emphasis else nil
        })
    });
end));