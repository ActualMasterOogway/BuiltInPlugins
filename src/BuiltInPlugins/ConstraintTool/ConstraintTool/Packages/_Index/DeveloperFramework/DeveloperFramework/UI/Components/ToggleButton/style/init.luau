local l_DevFrameworkToggleAllowEyeIcon_0 = game:GetFastFlag("DevFrameworkToggleAllowEyeIcon");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v3 = require(l_Parent_0.Style.StyleKey);
local v4 = require(l_Parent_0.Util.StyleModifier);
local v5 = require(l_Parent_0.UI.Components.Image);
local v6 = {
    Size = UDim2.fromOffset(40, 24), 
    Background = v5, 
    BackgroundStyle = {
        Image = v3.ToggleOffImage
    }, 
    [v4.Selected] = {
        BackgroundStyle = {
            Image = v3.ToggleOnImage
        }
    }, 
    [v4.Disabled] = {
        BackgroundStyle = {
            Image = v3.ToggleDisabledImage
        }
    }, 
    [v4.DisabledAndSelected] = {
        BackgroundStyle = {
            Image = v3.ToggleDisabledAndSelectedImage
        }
    }
};
local v7 = UDim2.new(0, 16, 0, 16);
local v8 = {
    Background = v5, 
    BackgroundStyle = {
        Image = v3.CheckboxUncheckedImage, 
        Size = v7
    }, 
    [v4.Selected] = {
        BackgroundStyle = {
            Image = v3.CheckboxCheckedImage, 
            Size = v7
        }
    }, 
    [v4.Indeterminate] = {
        BackgroundStyle = {
            Image = v3.CheckboxIndeterminateImage, 
            Size = v7
        }
    }, 
    [v4.Disabled] = {
        BackgroundStyle = {
            Image = v3.CheckboxDisabledImage, 
            Size = v7
        }
    }
};
local v9 = UDim2.new(0, 16, 0, 16);
local v10 = {
    Background = v5, 
    BackgroundStyle = {
        Image = v3.EyeIconOffImage, 
        Size = v9
    }, 
    [v4.Selected] = {
        BackgroundStyle = {
            Image = v3.EyeIconOnImage, 
            Size = v9
        }
    }
};
if l_DevFrameworkToggleAllowEyeIcon_0 then
    return l_join_0(v6, {
        ["&Checkbox"] = v8, 
        ["&EyeIcon"] = v10
    });
else
    return l_join_0(v6, {
        ["&Checkbox"] = v8
    });
end;