local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Dash.join;
local l_UI_0 = v3.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v13 = require(l_Util_0.ScriptReplacement);
local v14 = v1.PureComponent:extend("ScriptLinkCell");
v14.init = function(v15) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy)
    v15.onLinkClick = function() --[[ Line: 41 ]]
        -- upvalues: v15 (copy), v13 (ref)
        local l_Script_0 = v15.props.Value.Script;
        local l_Range_0 = v15.props.Value.Range;
        v13.goToScriptInstance(l_Script_0, l_Range_0);
    end;
end;
v14.render = function(v18) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_LinkText_0 (copy), l_TextLabel_0 (copy), l_Tooltip_0 (copy)
    local _ = v18.state;
    local l_props_0 = v18.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Value_0 = l_props_0.Value;
    if l_Value_0.Range then
        return v1.createElement(l_LinkText_0, {
            Text = l_Localization_0:getText("ScriptPane", "LineColumn", {
                line = l_Value_0.Range.startLine, 
                column = l_Value_0.Range.startCharacter
            }), 
            OnClick = v18.onLinkClick
        });
    else
        return v1.createElement(l_TextLabel_0, {
            Text = l_Value_0.Script:GetFullName(), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Value_0.Script:GetFullName()
            })
        });
    end;
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v14));