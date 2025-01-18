local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.InternalTextInput);
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.IconButton);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Components.Text);
local v8 = require(l_script_FirstAncestor_0.Enums.IconSize);
return {
    summary = "Internal text input", 
    story = function(v9) --[[ Line: 13 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v6 (copy), v3 (copy), v4 (copy), v8 (copy), v5 (copy), v7 (copy)
        local l_controls_0 = v9.controls;
        local v11, v12 = v2.useState("");
        local function v14(v13) --[[ Line: 18 ]] --[[ Name: handleChange ]]
            -- upvalues: v12 (copy)
            v12(v13);
        end;
        local function v15() --[[ Line: 22 ]] --[[ Name: buttonPress ]]
            print("press!");
        end;
        return v2.createElement(v6, {
            tag = "col gap-large auto-xy padding-larger size-3000"
        }, {
            InternalTextInput = v2.createElement(v3, {
                text = v11, 
                hasError = l_controls_0.hasError, 
                isDisabled = l_controls_0.isDisabled, 
                onChanged = v14, 
                placeholder = l_controls_0.placeholder, 
                leadingElement = if l_controls_0.leadingComponentIcon == v2.None then nil else v2.createElement(v4, {
                    name = l_controls_0.leadingComponentIcon, 
                    size = v8.Small
                }), 
                trailingElement = if l_controls_0.trailingComponentIcon == v2.None then nil else v2.createElement(v5, {
                    onActivated = v15, 
                    isDisabled = l_controls_0.isDisabled, 
                    size = v8.Small, 
                    icon = l_controls_0.trailingComponentIcon
                }), 
                textInputType = if l_controls_0.textInputType == v2.None then nil else l_controls_0.textInputType, 
                LayoutOrder = 1
            }), 
            Output = v2.createElement(v7, {
                Text = v11, 
                textStyle = {
                    Color3 = Color3.new(1, 0, 0.5)
                }, 
                LayoutOrder = 2, 
                tag = "auto-xy"
            })
        });
    end, 
    controls = {
        hasError = false, 
        isDisabled = false, 
        placeholder = "Placeholder text", 
        leadingComponentIcon = {
            "icons/placeholder/placeholderOn_small", 
            "icons/status/private_small", 
            "icons/common/search_small", 
            v2.None
        }, 
        trailingComponentIcon = {
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
        }
    }
};