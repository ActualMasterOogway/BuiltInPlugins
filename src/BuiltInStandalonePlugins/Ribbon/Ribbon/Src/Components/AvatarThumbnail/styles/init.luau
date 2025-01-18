local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddUsernameToRibbonAvatars)();
return l_createStyleRule_0(".Component-AvatarThumbnail", {
    AutoButtonColor = false, 
    Text = ""
}, {
    l_createStyleRule_0(v2 and "> ImageLabel" or "> #Avatar", {
        BorderSizePixel = "$BorderNone", 
        BackgroundColor3 = "$SemanticColorComponentMediaFill"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = "$GlobalRadiusCircle"
        }), 
        l_createStyleRule_0(".XSmall", {
            Size = "$AvatarXS"
        })
    })
});