local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v13) --[[ Line: 23 ]] --[[ Name: ResetCameraButton ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), v5 (copy), v3 (copy), v4 (copy), l_Button_0 (copy), v6 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local v14 = l_Stylizer_0:use("ResetCameraButton");
    local v15 = v2.useContext(if v5() then v3.Context else v4);
    local v16 = UDim.new(0, v14.Spacing);
    return v2.createElement(l_Button_0, {
        AnchorPoint = Vector2.new(1, 0), 
        LayoutOrder = v13.LayoutOrder, 
        OnClick = v15.resetCamera, 
        Style = "Round", 
        Size = if v6() then v14.Size else v14.Size + UDim2.fromOffset(v14.Spacing, v14.Spacing), 
        ZIndex = 2
    }, {
        Spacing = v2.createElement("UIPadding", {
            PaddingLeft = v16, 
            PaddingRight = v16, 
            PaddingTop = v16, 
            PaddingBottom = v16
        }), 
        Icon = v2.createElement(l_Image_0, {
            Image = v14.Image
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = "Reset Camera"
        })
    });
end;