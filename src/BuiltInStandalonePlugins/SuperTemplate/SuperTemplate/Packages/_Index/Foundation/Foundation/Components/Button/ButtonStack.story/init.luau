local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.Button);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v7 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v8 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local function v10(v9) --[[ Line: 13 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v5 (copy), v8 (copy), v4 (copy), v7 (copy)
    return v2.createElement(v5, {
        tag = {
            ["row gap-small wrap auto-y size-full-0"] = true, 
            ["fill-x"] = v9.fillBehavior == v8.Fill
        }
    }, {
        Button1 = v2.createElement(v4, {
            icon = "icons/common/robux", 
            text = "BUT WAIT NO CLICK ME!!!", 
            variant = v7.Emphasis, 
            onActivated = function() --[[ Line: 24 ]] --[[ Name: onActivated ]]
                print("PrimaryButton clicked!");
            end, 
            fillBehavior = v9.fillBehavior, 
            size = v9.size
        }), 
        Button2 = v2.createElement(v4, {
            text = v9.text, 
            variant = v7.Standard, 
            onActivated = function() --[[ Line: 33 ]] --[[ Name: onActivated ]]
                print("SecondaryButton clicked!");
            end, 
            fillBehavior = v9.fillBehavior, 
            size = v9.size
        })
    });
end;
return {
    summary = "Button Stack", 
    story = function(v11) --[[ Line: 44 ]] --[[ Name: story ]]
        -- upvalues: v10 (copy)
        return v10({
            text = v11.controls.text, 
            size = v11.controls.size, 
            fillBehavior = v11.controls.fillBehavior
        });
    end, 
    controls = {
        text = "Click me!", 
        size = v3.values(v6), 
        fillBehavior = {
            v8.Fit, 
            v8.Fill
        }
    }
};