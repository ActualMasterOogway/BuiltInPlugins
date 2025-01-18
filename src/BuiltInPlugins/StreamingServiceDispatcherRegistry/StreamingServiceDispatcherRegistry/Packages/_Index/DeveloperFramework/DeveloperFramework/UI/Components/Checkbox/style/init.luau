local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
return {
    Background = require(l_Parent_0.UI.Components.Image), 
    BackgroundStyle = {
        Image = v1.CheckboxUncheckedImage
    }, 
    [v2.Selected] = {
        BackgroundStyle = {
            Image = v1.CheckboxCheckedImage
        }
    }, 
    [v2.Indeterminate] = {
        BackgroundStyle = {
            Image = v1.CheckboxIndeterminateImage
        }
    }, 
    [v2.Disabled] = {
        BackgroundStyle = {
            Image = v1.CheckboxDisabledImage
        }
    }, 
    ImageSize = UDim2.new(0, 16, 0, 16), 
    Spacing = 6
};