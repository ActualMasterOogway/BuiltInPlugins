local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_RoactStudioWidgets_0 = l_Parent_0.Packages.RoactStudioWidgets;
local v5 = require(l_RoactStudioWidgets_0.ButtonBar);
local v6 = v1.PureComponent:extend(script.Name);
v6.render = function(v7) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_props_0 = v7.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ApplyPreset_0 = l_props_0.ApplyPreset;
    local v11 = l_props_0.Mouse:get();
    local l_Localization_0 = l_props_0.Localization;
    local v13 = {
        {
            Name = l_Localization_0:getText("General", "WorldPresetsClassic"), 
            Enabled = true, 
            ShowPressed = true, 
            Mouse = v11, 
            Value = {
                ToolTip = l_Localization_0:getText("General", "WorldPresetsClassicToolTip"), 
                Preset = {
                    Gravity = 196.2, 
                    JumpPower = 50, 
                    Walkspeed = 16, 
                    MaxSlopeAngle = 89
                }
            }
        }, 
        {
            Name = l_Localization_0:getText("General", "WorldPresetsRealistic"), 
            Enabled = true, 
            ShowPressed = true, 
            Mouse = v11, 
            Value = {
                ToolTip = l_Localization_0:getText("General", "WorldPresetsRealisticToolTip"), 
                Preset = {
                    Gravity = 35, 
                    JumpPower = 13, 
                    Walkspeed = 16
                }
            }
        }, 
        {
            Name = l_Localization_0:getText("General", "WorldPresetsAction"), 
            Enabled = true, 
            ShowPressed = true, 
            Mouse = v11, 
            Value = {
                ToolTip = l_Localization_0:getText("General", "WorldPresetsActionToolTip"), 
                Preset = {
                    Gravity = 75, 
                    JumpPower = 31, 
                    Walkspeed = 18
                }
            }
        }
    };
    return v1.createElement(v5, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Localization_0:getText("General", "TitlePresets"), 
        ButtonClicked = function(v14) --[[ Line: 81 ]] --[[ Name: ButtonClicked ]]
            -- upvalues: l_ApplyPreset_0 (copy)
            l_ApplyPreset_0(v14.Preset);
        end, 
        Buttons = v13
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v6));