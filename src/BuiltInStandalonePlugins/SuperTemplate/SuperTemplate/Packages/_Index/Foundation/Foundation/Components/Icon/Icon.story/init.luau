local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Icon);
local v4 = require(l_script_FirstAncestor_0.Enums.IconSize);
return {
    summary = "Icon component for displaying icons", 
    story = function(v5) --[[ Line: 8 ]] --[[ Name: Story ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_controls_0 = v5.controls;
        return v2.createElement(v3, {
            name = l_controls_0.name, 
            size = l_controls_0.size
        });
    end, 
    controls = {
        name = {
            "icons/common/search", 
            "icons/controls/voice/microphone_off_light", 
            "icons/controls/voice/video_on_light"
        }, 
        size = {
            v4.Medium, 
            v4.Small, 
            v4.Large
        }
    }
};