local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.Pill);
local v5 = require(l_script_FirstAncestor_0.Enums.IconPosition);
local function v7(v6) --[[ Line: 9 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.createElement(v4, {
        icon = v6.icon, 
        text = v6.text, 
        onActivated = v6.onActivated, 
        isDisabled = v6.isDisabled, 
        isChecked = v6.isChecked
    });
end;
return {
    summary = "Pill", 
    story = function(v8) --[[ Line: 21 ]] --[[ Name: story ]]
        -- upvalues: v7 (copy)
        return v7({
            icon = if v8.controls.icon ~= "" then {
                name = v8.controls.icon, 
                position = v8.controls.iconPosition
            } else nil, 
            text = v8.controls.text, 
            onActivated = function() --[[ Line: 30 ]] --[[ Name: onActivated ]]
                print("Pill activated");
            end, 
            isDisabled = v8.controls.isDisabled, 
            isChecked = v8.controls.isChecked
        });
    end, 
    controls = {
        icon = {
            "icons/actions/filter", 
            "icons/common/robux", 
            "icons/common/play", 
            ""
        }, 
        iconPosition = v3.values(v5), 
        text = "Filter", 
        isDisabled = false, 
        isChecked = false
    }
};