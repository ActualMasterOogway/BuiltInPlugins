local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
return {
    Weight = 5, 
    Background = v1.MainBackground, 
    [v2.Hover] = {
        Background = v1.ButtonHover
    }, 
    [v2.Pressed] = {
        Background = v1.ButtonPressed
    }
};