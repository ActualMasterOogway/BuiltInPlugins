local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.Style.ColorSystem.StudioColorClasses);
local v2 = require(l_Parent_0.Style.StyleKey);
return function(v3) --[[ Line: 10 ]] --[[ Name: getStudioColorClassTheme ]]
    -- upvalues: v2 (copy), v1 (copy)
    return {
        [v2.BackgroundPaper] = v1.Background.Paper[v3], 
        [v2.BackgroundDefault] = v1.Background.Default[v3], 
        [v2.ForegroundMain] = v1.Foreground.Main[v3], 
        [v2.ForegroundMuted] = v1.Foreground.Muted[v3], 
        [v2.ForegroundContrast] = v1.Foreground.Contrast[v3], 
        [v2.TextPrimary] = v1.Text.Primary[v3], 
        [v2.TextSecondary] = v1.Text.Secondary[v3], 
        [v2.TextContrast] = v1.Text.Contrast[v3], 
        [v2.TextLink] = v1.Text.Link[v3], 
        [v2.TextDisabled] = v1.Text.Disabled[v3], 
        [v2.TextError] = v1.Text.Error[v3], 
        [v2.TextSuccess] = v1.Text.Success[v3], 
        [v2.TextWarning] = v1.Text.Warning[v3], 
        [v2.ErrorMain] = v1.Error.Main[v3], 
        [v2.SuccessMain] = v1.Success.Main[v3], 
        [v2.WarningMain] = v1.Warning.Main[v3], 
        [v2.ActionHover] = v1.Action.Hover[v3], 
        [v2.ActionEnabled] = v1.Action.Enabled[v3], 
        [v2.ActionSelected] = v1.Action.Selected[v3], 
        [v2.ActionActivated] = v1.Action.Activated[v3], 
        [v2.ActionFocusBorder] = v1.Action.FocusBorder[v3], 
        [v2.PrimaryMain] = v1.Primary.Main[v3], 
        [v2.PrimaryStatesHoverBackground] = v1.PrimaryStates.HoverBackground[v3], 
        [v2.SecondaryMain] = v1.Secondary.Main[v3], 
        [v2.SecondaryMuted] = v1.Secondary.Muted[v3], 
        [v2.SecondaryContrast] = v1.Secondary.Contrast[v3], 
        [v2.SecondaryStatesHoverBackground] = v1.SecondaryStates.HoverBackground[v3], 
        [v2.SecondaryStatesHoverOutlineBorder] = v1.SecondaryStates.HoverOutlineBorder[v3], 
        [v2.SecondaryStatesRestingOutlineBorder] = v1.SecondaryStates.RestingOutlineBorder[v3], 
        [v2.AlertBackgroundDefault] = v1.AlertBackground.Default[v3], 
        [v2.AlertBackgroundError] = v1.AlertBackground.Error[v3], 
        [v2.AlertBackgroundInfo] = v1.AlertBackground.Info[v3], 
        [v2.AlertBackgroundSuccess] = v1.AlertBackground.Success[v3], 
        [v2.AlertBackgroundWarning] = v1.AlertBackground.Warning[v3], 
        [v2.OtherFilledInputBackground] = v1.Other.FilledInputBackground[v3], 
        [v2.OtherDivider] = v1.Other.Divider[v3], 
        [v2.ErrorText] = v1.Error.Main[v3], 
        [v2.LinkText] = v1.Text.Link[v3], 
        [v2.LinkTextHover] = v1.Text.LinkHover[v3], 
        [v2.WarningText] = v1.Warning.Main[v3], 
        [v2.MainText] = v1.Text.Primary[v3]
    };
end;