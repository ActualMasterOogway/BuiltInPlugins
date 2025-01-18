local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.TextInput);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
local v6 = require(l_script_FirstAncestor_0.Components.Button);
local v7 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
return {
    summary = "Text field", 
    story = function(v8) --[[ Line: 13 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy)
        local l_controls_0 = v8.controls;
        local v10, v11 = v2.useState("");
        local v12 = v2.useRef(nil);
        local function v14(v13) --[[ Line: 20 ]] --[[ Name: handleChange ]]
            -- upvalues: v11 (copy)
            v11(v13);
        end;
        local function v15() --[[ Line: 24 ]] --[[ Name: buttonPress ]]
            print("press!");
        end;
        return v2.createElement(v4, {
            tag = "col gap-large auto-xy padding-xlarge"
        }, {
            TextInput = v2.createElement(v3, {
                LayoutOrder = 1, 
                text = v10, 
                textInputType = if l_controls_0.textInputType == v2.None then nil else l_controls_0.textInputType, 
                hasError = l_controls_0.hasError, 
                isDisabled = l_controls_0.isDisabled, 
                isRequired = l_controls_0.isRequired, 
                onChanged = v14, 
                onFocusGained = function() --[[ Line: 34 ]] --[[ Name: onFocusGained ]]
                    print("focus gained!");
                end, 
                label = l_controls_0.input, 
                hint = if l_controls_0.hint == "" then nil else l_controls_0.hint, 
                placeholder = l_controls_0.placeholder, 
                iconLeading = if l_controls_0.iconLeading == v2.None then nil else l_controls_0.iconLeading, 
                iconTrailing = if l_controls_0.iconTrailing == v2.None then nil else if l_controls_0.trailingButton then {
                    name = l_controls_0.iconTrailing, 
                    onActivated = v15
                } else l_controls_0.iconTrailing, 
                textBoxRef = v12
            }), 
            Output = v2.createElement(v5, {
                LayoutOrder = 2, 
                Text = v10, 
                textStyle = {
                    Color3 = Color3.new(1, 0, 0.5)
                }, 
                tag = "auto-xy"
            }), 
            FocusButton = v2.createElement(v6, {
                LayoutOrder = 3, 
                text = "Focus TextInput", 
                onActivated = function() --[[ Line: 28 ]] --[[ Name: gainFocus ]]
                    -- upvalues: v12 (copy)
                    if v12.current and v12.current.focus then
                        v12.current.focus();
                    end;
                end, 
                variant = v7.Standard
            })
        });
    end, 
    controls = {
        hasError = false, 
        isDisabled = false, 
        isRequired = {
            v2.None, 
            false, 
            true
        }, 
        textInputType = {
            v2.None, 
            Enum.TextInputType.Default, 
            Enum.TextInputType.Password, 
            Enum.TextInputType.Number
        }, 
        input = "Input Label", 
        hint = "Helper text goes here", 
        placeholder = "Placeholder text", 
        iconLeading = {
            "icons/placeholder/placeholderOn_small", 
            "icons/status/private_small", 
            "icons/common/search_small", 
            v2.None
        }, 
        iconTrailing = {
            "icons/placeholder/placeholderOff", 
            "icons/actions/edit/clear_small", 
            "icons/actions/info_small", 
            "icons/actions/viewOn", 
            "icons/actions/viewOff", 
            v2.None
        }, 
        trailingButton = false
    }
};