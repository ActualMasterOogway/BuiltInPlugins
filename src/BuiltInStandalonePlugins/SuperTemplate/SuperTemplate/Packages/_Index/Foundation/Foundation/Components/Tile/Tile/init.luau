local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v7 = require(script.Parent.TileLayoutContext);
local v8 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v9 = {
    fillDirection = Enum.FillDirection.Vertical, 
    fillBehavior = v8.Fit, 
    spacing = 0, 
    padding = nil
};
return v2.forwardRef(function(v10, v11) --[[ Line: 38 ]] --[[ Name: Tile ]]
    -- upvalues: v6 (copy), v9 (copy), v2 (copy), v3 (copy), v5 (copy), v7 (copy)
    local v12 = v6(v10, v9);
    return v2.createElement(v3, v5(v12, {
        backgroundStyle = v12.backgroundStyle, 
        Size = v12.Size, 
        onStateChanged = v12.onStateChanged, 
        layout = {
            FillDirection = v12.fillDirection, 
            Padding = UDim.new(0, v12.spacing), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        padding = v12.padding, 
        ref = v11
    }), {
        TileContext = if v12.children then v2.createElement(v7.Provider, {
            value = {
                fillDirection = v12.fillDirection, 
                fillBehavior = v12.fillBehavior, 
                tileSpacing = v12.spacing, 
                tilePadding = v12.padding, 
                hasBackground = v12.backgroundStyle ~= nil
            }
        }, v12.children) else nil
    });
end);