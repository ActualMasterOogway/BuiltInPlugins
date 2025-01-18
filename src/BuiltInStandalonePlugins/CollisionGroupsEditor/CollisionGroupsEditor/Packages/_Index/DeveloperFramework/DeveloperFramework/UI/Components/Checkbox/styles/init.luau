local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_SharedFlags_0 = l_Parent_0.SharedFlags;
local v2 = require(l_Parent_0.Styling.createStyleRule);
local l_getFFlagDevFrameworkCheckboxGoodAlignment_0 = l_SharedFlags_0.getFFlagDevFrameworkCheckboxGoodAlignment;
return v2(".Component-Checkbox", {}, {
    v2(">> ImageLabel", {
        Image = "$CheckboxUncheckedImage"
    }), 
    v2(".Checked >> ImageLabel", {
        Image = "$CheckboxCheckedImage"
    }), 
    v2(".Indeterminate >> ImageLabel", {
        Image = "$CheckboxIndeterminateImage"
    }), 
    v2(".Disabled >> ImageLabel", {
        Image = "$CheckboxDisabledImage"
    }), 
    if l_getFFlagDevFrameworkCheckboxGoodAlignment_0 then v2(">> TextLabel :: UIPadding", {
        PaddingTop = UDim.new(0, -2)
    }) else nil
});