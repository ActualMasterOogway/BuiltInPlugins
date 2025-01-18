local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Components.TextEntryPrompt);
local l_CaptureFocus_0 = v2.UI.CaptureFocus;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRenameClip);
local v8 = v1.PureComponent:extend("StartScreen");
v8.render = function(v9) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v1 (copy), l_CaptureFocus_0 (copy), v3 (copy)
    local l_Stylizer_0 = v9.props.Stylizer;
    local l_Localization_0 = v9.props.Localization;
    local l_startScreenTheme_0 = l_Stylizer_0.startScreenTheme;
    local l_props_0 = v9.props;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_RootInstance_0 = l_props_0.RootInstance;
    local v17 = if v7() then nil else l_props_0.OnCreateAnimation;
    local _ = l_Stylizer_0.button;
    local l_createElement_0 = v1.createElement;
    local v20 = "Frame";
    local v21 = {
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    };
    local v22 = {};
    local v23 = false;
    if l_RootInstance_0 == nil then
        v23 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = l_Localization_0:getText("Title", "SelectARig"), 
            Font = l_Stylizer_0.font, 
            TextSize = l_startScreenTheme_0.textSize, 
            TextColor3 = l_startScreenTheme_0.textColor, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor
        }, {
            CaptureFocus = v1.createElement(l_CaptureFocus_0)
        });
    end;
    v22.SelectScreen = v23;
    v22.CreateNewPrompt = if v7() then nil else l_RootInstance_0 ~= nil and v1.createElement(v3, {
        PromptText = l_Localization_0:getText("Title", "CreateToStart"), 
        NoticeText = l_Localization_0:getText("Title", "NoAnimationExists_Migrated", {
            rig = l_RootInstance_0.Name
        }), 
        InputText = l_Localization_0:getText("Dialog", "AnimationName"), 
        Text = l_Localization_0:getText("Title", "DefaultAnimationName"), 
        Buttons = {
            {
                Key = true, 
                Text = l_Localization_0:getText("Dialog", "Create"), 
                Style = "RoundPrimary"
            }
        }, 
        OnTextSubmitted = v17
    });
    return l_createElement_0(v20, v21, v22);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8));