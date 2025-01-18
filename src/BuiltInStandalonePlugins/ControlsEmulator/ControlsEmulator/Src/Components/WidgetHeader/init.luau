local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return v1.memo(function(v2) --[[ Line: 16 ]] --[[ Name: WidgetHeader ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-WidgetHeader data-testid=Component-WidgetHeader", 
        LayoutOrder = v2.LayoutOrder
    }, {
        LeftContents = v1.createElement("Frame", {
            [v1.Tag] = "LeftContents"
        }, v2.leftContents), 
        RightContents = v1.createElement("Frame", {
            [v1.Tag] = "RightContents"
        }, v2.rightContents)
    });
end);