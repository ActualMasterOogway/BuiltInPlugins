local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.InputField);
local v4 = require(l_script_FirstAncestor_0.Components.InternalTextInput);
local v5 = require(l_script_FirstAncestor_0.Components.View);
return {
    summary = "Input field", 
    story = function(v6) --[[ Line: 9 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
        local l_controls_0 = v6.controls;
        local v8, v9 = v2.useState("");
        local function v11(v10) --[[ Line: 14 ]] --[[ Name: handleChange ]]
            -- upvalues: v9 (copy)
            v9(v10);
        end;
        return v2.createElement(v5, {
            tag = "col-order-by-name gap-large auto-xy padding-larger"
        }, {
            v2.createElement(v3, {
                label = l_controls_0.label, 
                hint = l_controls_0.hint, 
                input = function(v12) --[[ Line: 24 ]] --[[ Name: input ]]
                    -- upvalues: v2 (ref), v4 (ref), v8 (copy), l_controls_0 (copy), v11 (copy)
                    return v2.createElement(v4, {
                        ref = v12, 
                        text = v8, 
                        hasError = l_controls_0.hasError, 
                        isDisabled = l_controls_0.isDisabled, 
                        onChanged = v11, 
                        placeholder = l_controls_0.placeholder
                    });
                end
            })
        });
    end, 
    controls = {
        label = "Field label", 
        hint = "Hint", 
        hasError = false, 
        isDisabled = false, 
        placeholder = "Placeholder text"
    }
};