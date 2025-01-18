local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddUsernameToRibbonAvatars)();
return l_createStyleRule_0(".Component-CollaboratorThumbnail", {}, {
    l_createStyleRule_0("> #ActivityRing", {
        AnchorPoint = "$AnchorCenter", 
        Position = "$PositionCenter", 
        Size = UDim2.fromOffset(22, 22)
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = "$GlobalRadiusCircle"
        }), 
        l_createStyleRule_0("> #RingColor", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Thickness = "$BorderMedium"
        })
    }), 
    l_createStyleRule_0(v2 and "> ImageLabel" or ">> #Avatar", {
        AnchorPoint = "$AnchorCenter", 
        BorderSizePixel = "$BorderNone", 
        Position = "$PositionCenter", 
        Size = UDim2.fromOffset(18, 18), 
        BackgroundColor3 = "$SemanticColorComponentMediaFill"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = "$GlobalRadiusCircle"
        }), 
        l_createStyleRule_0(".Idle", {
            Size = "$AvatarXS"
        })
    })
});