local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v4 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.Icon);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Components.Text);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v12 = require(l_script_FirstAncestor_0.Enums.IconPosition);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v14 = require(l_script_FirstAncestor_0.Enums.CursorType);
local v15 = {
    isDisabled = false, 
    isChecked = false
};
return v2.memo(v2.forwardRef(function(v16, v17) --[[ Line: 44 ]] --[[ Name: Pill ]]
    -- upvalues: v9 (copy), v15 (copy), v3 (copy), v4 (copy), v14 (copy), v2 (copy), v12 (copy), v7 (copy), v10 (copy), v6 (copy), v11 (copy), v8 (copy)
    local v18 = v9(v16, v15);
    local v19 = v3();
    local v20 = v4(v14.SmallPill);
    local v21 = v2.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v18 (copy), v12 (ref)
        if typeof(v18.icon) == "string" then
            return {
                name = v18.icon, 
                position = v12.Left
            };
        else
            return v18.icon;
        end;
    end, {
        v18.icon
    });
    local v22 = if v18.isChecked then v19.Color.ActionSubEmphasis.Foreground else v19.Color.Content.Emphasis;
    return v2.createElement(v7, v10(v18, {
        GroupTransparency = v18.isDisabled and 0.5 or nil, 
        selection = {
            Selectable = not v18.isDisabled, 
            SelectionImageObject = v20
        }, 
        onActivated = v18.onActivated, 
        isDisabled = v18.isDisabled, 
        tag = {
            ["row gap-xsmall size-0-700 padding-medium auto-x align-y-center align-x-center clip radius-circle"] = true, 
            ["bg-action-sub-emphasis"] = v18.isChecked, 
            ["bg-shift-200"] = not v18.isChecked
        }, 
        ref = v17
    }), {
        Icon = if v21 then v2.createElement(v6, {
            name = v21.name, 
            size = v11.Small, 
            style = v22, 
            LayoutOrder = v21.position == v12.Left and 1 or 3
        }) else nil, 
        Text = if v18.text and v18.text ~= "" then v2.createElement(v8, {
            Text = v18.text, 
            textStyle = v22, 
            LayoutOrder = 2, 
            tag = "auto-x size-0-full shrink text-caption-large text-truncate-end"
        }) else nil
    });
end));