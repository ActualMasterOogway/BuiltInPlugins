local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return v1.Styling.createStyleSheet("CancellableDialog", {
    l_createStyleRule_0("TextLabel", {
        Font = Enum.Font.SourceSans, 
        TextSize = "$NormalTextSize", 
        TextColor3 = "$TextContrast", 
        BackgroundTransparency = "$Transparent", 
        TextXAlignment = Enum.TextXAlignment.Left
    }), 
    l_createStyleRule_0("Frame", {
        BackgroundTransparency = "$Transparent"
    })
}, {
    NormalTextSize = 16, 
    NotTransparent = 0, 
    Transparent = 1, 
    TextDisabledTransparency = 0.5
});