local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.IconButton);
local v5 = require(l_script_FirstAncestor_0.Enums.IconSize);
local function v8(v6) --[[ Line: 10 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_controls_0 = v6.controls;
    return v2.createElement(v4, {
        isDisabled = false, 
        onActivated = function() --[[ Line: 15 ]] --[[ Name: onActivated ]]

        end, 
        size = l_controls_0.size, 
        icon = l_controls_0.name
    });
end;
local v9 = {
    v5.Medium, 
    v5.Small, 
    v5.Large, 
    v5.XLarge, 
    v5.XXLarge
};
return {
    summary = "Icon component for displaying icons", 
    stories = v3.map(v9, function(v10) --[[ Line: 25 ]]
        -- upvalues: v8 (copy)
        return {
            name = v10, 
            story = function(v11) --[[ Line: 28 ]] --[[ Name: story ]]
                -- upvalues: v8 (ref), v10 (copy)
                return v8({
                    controls = {
                        size = v10, 
                        name = v11.controls.name
                    }
                });
            end
        };
    end), 
    controls = {
        name = {
            "icons/common/notificationOff", 
            "icons/common/robux", 
            "icons/common/search_small", 
            "icons/controls/voice/microphone_off_light", 
            "icons/controls/voice/video_on_light"
        }
    }
};