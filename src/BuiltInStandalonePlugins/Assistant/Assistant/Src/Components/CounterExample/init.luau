local l_script_FirstAncestor_0 = script:FindFirstAncestor("Assistant");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
return function(_) --[[ Line: 21 ]] --[[ Name: CounterExample ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy)
    local v4 = l_Localization_0:use();
    local v5, v6 = v1.useState(0);
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-CounterExample X-Fit X-Column"
    }, {
        Label = v1.createElement("TextLabel", {
            Text = v4:getText("CounterExample", "CounterLabel", {
                counter = v5
            })
        }), 
        Button = v1.createElement("TextButton", {
            Text = v4:getText("CounterExample", "Button"), 
            [v1.Event.Activated] = function() --[[ Line: 36 ]]
                -- upvalues: v6 (copy), v5 (copy)
                v6(v5 + 1);
            end
        })
    });
end;