local l_COLLAB2699FixSaveChangesLogic_0 = game:GetFastFlag("COLLAB2699FixSaveChangesLogic");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = require(l_Parent_0.Packages.Cryo);
local l_StyleModifier_0 = v4.Util.StyleModifier;
local v11 = require(l_Parent_0.Src.Components.ButtonBar);
local v12 = require(l_Parent_0.Src.Util.Constants);
local v13 = require(l_Parent_0.Src.Selectors.GetHasCollaborators);
local v14 = if l_COLLAB2699FixSaveChangesLogic_0 then require(l_Parent_0.Src.Selectors.GetHasUnsavedChanges) else nil;
local v15 = v2.PureComponent:extend("Footer");
v15.render = function(v16) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_StyleModifier_0 (copy), v2 (copy), v12 (copy), v11 (copy)
    local l_props_0 = v16.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    local l_IsTeamCreateEnabled_0 = l_props_0.IsTeamCreateEnabled;
    local l_HasUnsavedChanges_0 = l_props_0.HasUnsavedChanges;
    local l_HasCollaborators_0 = l_props_0.HasCollaborators;
    local v23 = l_HasUnsavedChanges_0 or not l_IsTeamCreateEnabled_0 and l_HasCollaborators_0;
    local l_OnSavePressed_0 = l_props_0.OnSavePressed;
    local l_OnCancelPressed_0 = l_props_0.OnCancelPressed;
    local v26 = {
        Name = l_Localization_1:getText("Buttons", "Cancel"), 
        OnPressed = function() --[[ Line: 47 ]] --[[ Name: OnPressed ]]
            -- upvalues: l_OnCancelPressed_0 (copy), l_HasUnsavedChanges_0 (copy)
            l_OnCancelPressed_0(l_HasUnsavedChanges_0);
        end, 
        Style = "Cancel"
    };
    local v27 = {
        Name = l_Localization_1:getText("Buttons", "Save"), 
        Default = true, 
        OnPressed = function() --[[ Line: 56 ]] --[[ Name: OnPressed ]]
            -- upvalues: v23 (copy), l_OnSavePressed_0 (copy)
            if v23 then
                l_OnSavePressed_0();
            end;
        end, 
        Style = v23 and "Active" or "Passive", 
        StyleModifier = if not v23 then l_StyleModifier_0.Disabled else nil
    };
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_1.backgroundColor, 
        BorderSizePixel = 1, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 2, 
        BorderColor3 = l_Stylizer_1.footer.border
    }, {
        Gradient = v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.footer.gradientSize), 
            AnchorPoint = Vector2.new(0, 1), 
            Image = v12.GRADIENT_IMAGE, 
            ImageRectSize = v12.GRADIENT_RECT_SIZE, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Stylizer_1.footer.gradient, 
            ImageTransparency = l_Stylizer_1.footer.gradientTransparency, 
            ZIndex = 1
        }), 
        ButtonBar = v2.createElement(v11, {
            ZIndex = 2, 
            Buttons = {
                v26, 
                v27
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    });
end;
v15 = l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v15);
return (v3.connect(function(v28, _) --[[ Line: 100 ]]
    -- upvalues: l_COLLAB2699FixSaveChangesLogic_0 (copy), v14 (copy), v9 (copy), v13 (copy)
    local _ = nil;
    return {
        HasUnsavedChanges = if l_COLLAB2699FixSaveChangesLogic_0 then v14(v28) else if v28.Permissions.NewPermissions then not v9.isEmpty(v28.Permissions.NewPermissions) else false, 
        HasCollaborators = v13(v28)
    };
end, function(_) --[[ Line: 114 ]]

end)(v15));