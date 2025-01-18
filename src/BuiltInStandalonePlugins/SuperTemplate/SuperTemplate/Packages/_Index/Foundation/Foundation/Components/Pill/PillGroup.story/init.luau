local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Pill);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Enums.FillBehavior);
return {
    summary = "Pill", 
    story = function(_) --[[ Line: 12 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy)
        local v7, v8 = v2.useState("I'm a pill");
        return v2.createElement(v4, {
            tag = "row gap-small wrap auto-y size-full-0"
        }, {
            Pill1 = v2.createElement(v3, {
                icon = "icons/common/robux", 
                text = "I'm a pill", 
                onActivated = function() --[[ Line: 24 ]] --[[ Name: onActivated ]]
                    -- upvalues: v8 (copy)
                    v8("I'm a pill");
                end, 
                isChecked = v7 == "I'm a pill"
            }), 
            Pill2 = v2.createElement(v3, {
                text = "I'm a hard pill to swallow :(", 
                onActivated = function() --[[ Line: 31 ]] --[[ Name: onActivated ]]
                    -- upvalues: v8 (copy)
                    v8("I'm a hard pill to swallow :(");
                end, 
                isChecked = v7 == "I'm a hard pill to swallow :("
            })
        });
    end
};