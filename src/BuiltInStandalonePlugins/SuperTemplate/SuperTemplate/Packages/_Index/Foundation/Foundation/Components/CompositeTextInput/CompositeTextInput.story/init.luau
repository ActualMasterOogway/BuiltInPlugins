local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.CompositeTextInput);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
return {
    summary = "Composite text field", 
    story = function(v6) --[[ Line: 9 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
        local l_controls_0 = v6.controls;
        local v8, v9 = v2.useState("");
        local function v11(v10) --[[ Line: 14 ]] --[[ Name: handleChange ]]
            -- upvalues: v9 (copy)
            v9(v10);
        end;
        local function v12() --[[ Line: 18 ]] --[[ Name: buttonPress ]]
            print("press!");
        end;
        return v2.createElement(v4, {
            tag = "col gap-large auto-xy padding-xlarge"
        }, {
            TextInput = v2.createElement(v3, {
                text = v8, 
                textInputType = if l_controls_0.textInputType == v2.None then nil else l_controls_0.textInputType, 
                hasError = l_controls_0.hasError, 
                isDisabled = l_controls_0.isDisabled, 
                isRequired = l_controls_0.isRequired, 
                onChanged = v11, 
                onFocusGained = function() --[[ Line: 22 ]] --[[ Name: onFocusGained ]]
                    print("focus gained!");
                end, 
                label = l_controls_0.label, 
                hint = if l_controls_0.hint == "" then nil else l_controls_0.hint, 
                placeholder = l_controls_0.placeholder, 
                iconLeading = if l_controls_0.iconLeading == v2.None then nil else l_controls_0.iconLeading, 
                iconTrailing = if l_controls_0.iconTrailing == v2.None then nil else if l_controls_0.trailingButton then {
                    name = l_controls_0.iconTrailing, 
                    onActivated = v12
                } else l_controls_0.iconTrailing
            }), 
            Output = v2.createElement(v5, {
                Text = v8, 
                textStyle = {
                    Color3 = Color3.new(1, 0, 0.5)
                }, 
                tag = "auto-xy"
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
        label = "Input Label", 
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
        textInputType = {
            v2.None, 
            Enum.TextInputType.Default, 
            Enum.TextInputType.Password, 
            Enum.TextInputType.Number
        }, 
        trailingButton = false
    }
};