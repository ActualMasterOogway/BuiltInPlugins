local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.Button);
local v5 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v6 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v7 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
return {
    summary = "Button", 
    stories = v3.map(v6, function(v8) --[[ Line: 14 ]]
        -- upvalues: v2 (copy), v4 (copy)
        return {
            name = v8, 
            story = function(v9) --[[ Line: 17 ]] --[[ Name: story ]]
                -- upvalues: v2 (ref), v4 (ref), v8 (copy)
                local l_controls_0 = v9.controls;
                return v2.createElement(v4, {
                    icon = if l_controls_0.icon == "" then nil else v9.controls.icon, 
                    text = l_controls_0.text, 
                    variant = v8, 
                    onActivated = function() --[[ Line: 24 ]] --[[ Name: onActivated ]]
                        -- upvalues: v8 (ref)
                        print((("%*Button activated"):format(v8)));
                    end, 
                    isDisabled = l_controls_0.isDisabled, 
                    size = l_controls_0.size, 
                    fillBehavior = if l_controls_0.fillBehavior == v2.None then nil else l_controls_0.fillBehavior, 
                    inputDelay = l_controls_0.inputDelay
                });
            end
        };
    end), 
    controls = {
        icon = {
            "icons/common/search", 
            "icons/common/robux", 
            "icons/common/play", 
            ""
        }, 
        text = "Click me!", 
        size = v3.values(v5), 
        isDisabled = false, 
        fillBehavior = {
            v2.None, 
            v7.Fit, 
            v7.Fill
        }, 
        inputDelay = 0
    }
};