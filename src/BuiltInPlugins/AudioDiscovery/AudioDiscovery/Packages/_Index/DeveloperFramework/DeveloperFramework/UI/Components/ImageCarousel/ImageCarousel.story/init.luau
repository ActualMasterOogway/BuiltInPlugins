local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.ImageCarousel);
local v3 = {
    "rbxasset://textures/ui/common/robux_color@2x.png", 
    "rbxasset://textures/ui/Chat/Chat.png", 
    "rbxasset://textures/ui/Chat/MessageCounter.png"
};
return {
    stories = {
        AutoAdvanceOnHover = v1.createElement(v2, {
            AutoAdvanceTimer = 3000, 
            ImageStrings = v3, 
            Size = UDim2.fromOffset(120, 80)
        }), 
        AutoAdvanceOnHoverAndResetWhenHoveredOff = v1.createElement(v2, {
            AutoAdvanceTimer = 3000, 
            ImageStrings = v3, 
            ResetWhenHoveredOff = true, 
            Size = UDim2.fromOffset(120, 80)
        }), 
        AutoAdvanceOnlyIfNotHovered = v1.createElement(v2, {
            AutoAdvance = true, 
            AutoAdvanceTimer = 3000, 
            ImageStrings = v3, 
            Size = UDim2.fromOffset(120, 80)
        }), 
        AutoAdvanceOnlyIfNotHoveredWithNav = v1.createElement(v2, {
            AutoAdvance = true, 
            AutoAdvanceTimer = 3000, 
            ImageStrings = v3, 
            ShowNavigationOnHover = true, 
            Size = UDim2.fromOffset(120, 80)
        }), 
        AlwaysAutoAdvance = v1.createElement(v2, {
            AutoAdvance = true, 
            AutoAdvanceTimer = 3000, 
            DisableHoverToggle = true, 
            ImageStrings = v3, 
            Size = UDim2.fromOffset(120, 80)
        }), 
        AlwaysAutoAdvanceWithoutAnimations = v1.createElement(v2, {
            AutoAdvance = true, 
            AutoAdvanceTimer = 3000, 
            DisableAnimations = true, 
            DisableHoverToggle = true, 
            ImageStrings = v3, 
            Size = UDim2.fromOffset(120, 80)
        })
    }
};