local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Button);
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = {
    icon = {
        name = "icons/status/oof_xlarge", 
        size = v7.Large
    }, 
    text = v10:FormatByKey("CommonUI.Controls.NoResultsFound"), 
    button = {
        icon = "icons/common/refresh", 
        text = v10:FormatByKey("CommonUI.Controls.Action.Refresh"), 
        onActivated = nil
    }
};
return v2.memo(v2.forwardRef(function(v14, v15) --[[ Line: 45 ]] --[[ Name: Empty ]]
    -- upvalues: v9 (copy), v13 (copy), v8 (copy), v2 (copy), v6 (copy), v12 (copy), v4 (copy), v5 (copy), v3 (copy)
    local v16 = v9(v14, v13);
    local v17 = v8();
    return v2.createElement(v6, v12(v16, {
        tag = "auto-xy size-full col align-y-center align-x-center gap-small", 
        ref = v15
    }), {
        Icon = v2.createElement(v4, {
            name = v16.icon.name, 
            size = v16.icon.size, 
            style = v17.Color.Content.Default, 
            LayoutOrder = 1
        }), 
        Text = v2.createElement(v5, {
            Text = v16.text, 
            LayoutOrder = 2, 
            tag = "size-full-0 auto-y text-body-large content-default text-wrap text-align-x-center"
        }), 
        Button = if v16.button and v16.button.onActivated then v2.createElement(v3, {
            text = v16.button.text, 
            icon = v16.button.icon, 
            onActivated = v16.button.onActivated, 
            LayoutOrder = 3
        }) else nil
    });
end));