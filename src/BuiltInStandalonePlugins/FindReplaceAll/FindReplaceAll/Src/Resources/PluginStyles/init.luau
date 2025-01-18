local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local v4 = require(l_script_FirstAncestor_0.Src.Resources.StyleConstants);
return l_createStyleSheet_0("FindReplaceAll", {
    l_createStyleRule_0("TextLabel, TextButton, TextBox", {
        Font = v4.defaultFont, 
        TextSize = v4.normalFontSize
    }), 
    l_createStyleRule_0("#MainWidget", {
        BorderSizePixel = 0, 
        BackgroundColor3 = "$BackgroundDefault"
    })
}, {});