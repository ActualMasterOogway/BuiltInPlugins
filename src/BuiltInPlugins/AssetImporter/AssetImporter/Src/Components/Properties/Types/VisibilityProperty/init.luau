local l_DevFrameworkToggleAllowEyeIcon_0 = game:GetFastFlag("DevFrameworkToggleAllowEyeIcon");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_ToggleButton_0 = v2.UI.ToggleButton;
return function(v6) --[[ Line: 13 ]] --[[ Name: VisibilityProperty ]]
    -- upvalues: l_DevFrameworkToggleAllowEyeIcon_0 (copy), v3 (copy), l_ToggleButton_0 (copy), l_Stylizer_0 (copy)
    if l_DevFrameworkToggleAllowEyeIcon_0 then
        return (v3.createElement(l_ToggleButton_0, {
            OnClick = v6.OnToggleItem, 
            Size = v6.Size, 
            LayoutOrder = v6.LayoutOrder, 
            Selected = v6.Value, 
            Stylizer = l_Stylizer_0, 
            Style = "EyeIcon"
        }));
    else
        return (v3.createElement(l_ToggleButton_0, {
            OnClick = v6.OnToggleItem, 
            Size = v6.Size, 
            LayoutOrder = v6.LayoutOrder, 
            Selected = v6.Value, 
            Stylizer = l_Stylizer_0
        }));
    end;
end;