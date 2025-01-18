local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v1.ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_IconButton_0 = v1.UI.IconButton;
local l_Pane_0 = v1.UI.Pane;
local _ = v1.Util.StyleModifier;
local l_Toolbar_0 = v3.Toolbar;
return function(v9) --[[ Line: 28 ]] --[[ Name: ConfirmGenerationRenderer ]]
    -- upvalues: l_Localization_0 (copy), v4 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), l_Toolbar_0 (copy)
    local l_Schema_0 = v9.Schema;
    local v11 = l_Localization_0:use();
    local v12 = nil;
    if l_Schema_0.CanConfirm then
        v12 = {
            {
                Type = "Label", 
                Text = v11:getText("Viewport", "ConfirmMessage")
            }, 
            {
                Enabled = not v9.Disabled, 
                OnClick = l_Schema_0.OnClick, 
                Type = "TextButton", 
                Text = v11:getText("Viewport", "Confirm")
            }
        };
    elseif l_Schema_0.CanRegenerate then
        v12 = {
            {
                Type = "Label", 
                Text = v11:getText("Viewport", "RegenerateMessage")
            }, 
            {
                Enabled = not v9.Disabled, 
                OnClick = l_Schema_0.OnRegenerate, 
                Type = "TextButton", 
                Text = v11:getText("Viewport", "Regenerate")
            }
        };
    end;
    return v4.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 32)
    }, {
        Button = if l_Schema_0.CanConfirm then v4.createElement(l_IconButton_0, {
            Disabled = v9.Disabled, 
            OnClick = l_Schema_0.OnClick, 
            Size = UDim2.new(1, 0, 0, 32), 
            Style = if v9.Disabled then nil else "PrimaryBrand", 
            Text = l_Schema_0.Label, 
            TextXAlignment = Enum.TextXAlignment.Center
        }) else nil, 
        Toolbar = if v12 then v4.createElement(l_Toolbar_0, {
            HorizontalItems = v12
        }) else nil
    });
end;