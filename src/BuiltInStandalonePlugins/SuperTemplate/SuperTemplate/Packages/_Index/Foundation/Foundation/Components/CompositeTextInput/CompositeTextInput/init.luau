local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.InternalTextInput);
local v5 = require(l_Components_0.InputField);
local v6 = require(l_Components_0.Icon);
local v7 = require(l_Components_0.View);
local v8 = require(l_Components_0.IconButton);
local v9 = require(l_script_FirstAncestor_0.Enums.IconSize);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v16 = {
    width = UDim.new(0, 400)
};
return v2.memo(v2.forwardRef(function(v17, v18) --[[ Line: 64 ]] --[[ Name: TextInput ]]
    -- upvalues: v12 (copy), v16 (copy), v11 (copy), v2 (copy), v5 (copy), v13 (copy), v14 (copy), v4 (copy), v7 (copy), v6 (copy), v9 (copy), v8 (copy)
    local v19 = v12(v17, v16);
    local v20 = v11();
    return v2.createElement(v5, v13(v19, {
        width = v19.width, 
        ref = v18, 
        label = v19.label, 
        size = v14.Small, 
        isRequired = v19.isRequired, 
        hint = v19.hint, 
        textBoxRef = v19.textBoxRef, 
        input = function(v21) --[[ Line: 79 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v4 (ref), v19 (copy), v7 (ref), v6 (ref), v20 (copy), v9 (ref), v8 (ref)
            return v2.createElement(v4, {
                ref = v21, 
                hasError = v19.hasError, 
                isDisabled = v19.isDisabled, 
                text = v19.text, 
                textInputType = v19.textInputType, 
                onChanged = v19.onChanged, 
                onFocus = v19.onFocusGained, 
                placeholder = v19.placeholder, 
                leadingElement = if v19.iconLeading then v2.createElement(v7, {
                    tag = "size-0-full auto-x padding-x-medium row align-y-center"
                }, v2.createElement(v6, {
                    name = v19.iconLeading, 
                    style = v20.Color.Content.Muted, 
                    size = v9.Small
                })) else nil, 
                trailingElement = if v19.iconTrailing then v2.createElement(v7, {
                    tag = "size-0-full auto-x padding-x-medium row align-y-center"
                }, if type(v19.iconTrailing) == "table" and v19.iconTrailing.onActivated then v2.createElement(v8, {
                    onActivated = v19.iconTrailing.onActivated, 
                    isDisabled = v19.isDisabled, 
                    size = v9.Small, 
                    icon = v19.iconTrailing.name
                }) else v2.createElement(v6, {
                    name = if type(v19.iconTrailing) == "table" then v19.iconTrailing.name else v19.iconTrailing, 
                    style = v20.Color.Content.Muted, 
                    size = v9.Small
                })) else nil, 
                tag = "padding-x-xsmall"
            });
        end
    }));
end));