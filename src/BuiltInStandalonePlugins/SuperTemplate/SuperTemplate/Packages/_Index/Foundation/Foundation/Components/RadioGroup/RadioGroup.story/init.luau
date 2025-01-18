local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.RadioGroup);
local v5 = {
    "A", 
    "B", 
    "C", 
    "D", 
    "E"
};
return {
    summary = "Radio Group component", 
    story = function(_) --[[ Line: 11 ]] --[[ Name: Story ]]
        -- upvalues: v3 (copy), v5 (copy), v2 (copy), v4 (copy)
        local v7 = {};
        v3.forEach(v5, function(v8) --[[ Line: 13 ]]
            -- upvalues: v7 (copy), v2 (ref), v4 (ref)
            table.insert(v7, v2.createElement(v4.Item, {
                value = v8, 
                label = "Label " .. v8, 
                isDisabled = v8 == "D"
            }));
        end);
        return v2.createElement(v4.Root, {
            onValueChanged = function(v9) --[[ Line: 25 ]] --[[ Name: onValueChanged ]]
                print("Checking value", v9);
            end
        }, v7);
    end
};