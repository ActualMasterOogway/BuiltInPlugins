local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v4 = require(l_script_FirstAncestor_0.Components.Empty);
return {
    summary = "Empty component for displaying emptys", 
    story = function(v5) --[[ Line: 10 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v4 (copy)
        local l_controls_0 = v5.controls;
        return v2.createElement(v4, {
            icon = {
                name = l_controls_0.iconName, 
                size = l_controls_0.iconSize
            }, 
            button = if l_controls_0.showButton then {
                onActivated = function() --[[ Line: 20 ]] --[[ Name: onActivated ]]

                end
            } else nil
        });
    end, 
    controls = {
        showButton = false, 
        iconName = {
            "icons/status/oof_xlarge", 
            "icons/status/noconnection_large"
        }, 
        iconSize = {
            v3.XLarge, 
            v3.Large
        }
    }
};