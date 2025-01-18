local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Widget-Thumbstick", {
    BackgroundColor3 = "$ControlActiveSecondaryColor", 
    AnchorPoint = Vector2.new(0.5, 0.5), 
    BackgroundTransparency = 1
}, {
    l_createStyleRule_0(".Active", {
        BackgroundTransparency = 0.7
    }), 
    l_createStyleRule_0("> #Stick", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> #Stick.Hovered", {
        BackgroundColor3 = "$ControlActiveColor", 
        BackgroundTransparency = 0.6
    }), 
    l_createStyleRule_0("> #Stick.Active", {
        BackgroundColor3 = "$ControlActiveColor", 
        BackgroundTransparency = 0.3
    })
});