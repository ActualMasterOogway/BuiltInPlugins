local v0 = Vector2.new(400, 200);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyledDialog_0 = v5.UI.StyledDialog;
local v7 = require(l_script_FirstAncestor_0.Src.Context.MainProvider);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Theme);
local l_Localization_0 = v5.ContextServices.Localization;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.LocalizedStrings;
local v12 = v2.PureComponent:extend("BlockingDialog");
v12.init = function(v13, v14) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_Localization_0 (copy), v4 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    assert(v14.plugin ~= nil, "BlockingDialog requires a Plugin.");
    v13.theme = v8();
    v13.localization = l_Localization_0.new({
        pluginName = v4.PLUGIN_NAME, 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0
    });
end;
v12.render = function(v15) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v0 (copy), v2 (copy), v7 (copy), l_StyledDialog_0 (copy)
    local l_props_0 = v15.props;
    local l_theme_0 = v15.theme;
    local l_localization_0 = v15.localization;
    local l_plugin_0 = l_props_0.plugin;
    local v20 = l_props_0.TitleKey or "Error";
    local v21 = v3.Dictionary.join(l_props_0, {
        Resizable = false, 
        BorderPadding = 20, 
        ButtonPadding = v4.PROMPT_BUTTON_PADDING, 
        ButtonHeight = v4.PROMPT_BUTTON_SIZE.Y, 
        ButtonWidth = v4.PROMPT_BUTTON_SIZE.X, 
        TextSize = l_theme_0.__calculatedStyle.dialogTheme.textSize, 
        Title = l_localization_0:getText("Title", v20), 
        OnClose = l_props_0.OnClose, 
        OnButtonPressed = l_props_0.OnButtonClicked
    });
    v21.MinContentSize = v21.Size or v0;
    v21.Buttons = v21.Buttons or {
        {
            Key = true, 
            Text = l_localization_0:getText("Dialog", "Ok"), 
            Style = "Round"
        }
    };
    return v2.createElement(v7, {
        theme = l_theme_0, 
        plugin = l_plugin_0, 
        localization = l_localization_0
    }, {
        Dialog = v2.createElement(l_StyledDialog_0, v21)
    });
end;
return v12;