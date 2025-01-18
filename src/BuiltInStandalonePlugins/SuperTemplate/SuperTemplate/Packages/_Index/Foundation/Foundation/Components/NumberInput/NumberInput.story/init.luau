local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.NumberInput);
return {
    summary = "Spinbox", 
    stories = {
        {
            name = "Default", 
            story = function(v4) --[[ Line: 7 ]] --[[ Name: DefaultStory ]]
                -- upvalues: v2 (copy), v3 (copy)
                local l_controls_0 = v4.controls;
                local v6, v7 = v2.useState(0);
                return v2.createElement(v3, {
                    value = v6, 
                    isDisabled = l_controls_0.isDisabled, 
                    isRequired = l_controls_0.isRequired, 
                    onChanged = function(v8) --[[ Line: 12 ]] --[[ Name: handleChange ]]
                        -- upvalues: v7 (copy)
                        print("newValue", v8);
                        v7(v8);
                    end, 
                    formatAsString = function(v9) --[[ Line: 22 ]] --[[ Name: formatAsString ]]
                        return (("%*px"):format(v9));
                    end, 
                    label = l_controls_0.label, 
                    maximum = l_controls_0.maximum, 
                    minimum = l_controls_0.minimum, 
                    step = l_controls_0.step, 
                    hint = l_controls_0.hint, 
                    precision = l_controls_0.precision
                });
            end
        }, 
        {
            name = "Disabled", 
            story = function(_) --[[ Line: 34 ]] --[[ Name: DisabledStory ]]
                -- upvalues: v2 (copy), v3 (copy)
                local v11, v12 = v2.useState(0);
                return v2.createElement(v3, {
                    value = v11, 
                    isDisabled = true, 
                    onChanged = function(v13) --[[ Line: 37 ]] --[[ Name: handleChange ]]
                        -- upvalues: v12 (copy)
                        print("newValue", v13);
                        v12(v13);
                    end, 
                    formatAsString = function(v14) --[[ Line: 46 ]] --[[ Name: formatAsString ]]
                        return (("%*px"):format(v14));
                    end, 
                    label = ""
                });
            end
        }
    }, 
    controls = {
        label = "Label", 
        hint = "Number from -5 to 100", 
        isRequired = {
            v2.None, 
            false, 
            true
        }, 
        isDisabled = false, 
        maximum = 100, 
        minimum = -5, 
        step = 0.2, 
        precision = 2
    }
};