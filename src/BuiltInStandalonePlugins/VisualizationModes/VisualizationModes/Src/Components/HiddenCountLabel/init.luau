local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
return function(v3) --[[ Line: 20 ]] --[[ Name: HiddenCountLabel ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy)
    local v4 = l_ContextServices_0.Localization:use();
    return v1.createElement("TextLabel", {
        [v1.Tag] = "VisualizationModes-HiddenCountLabel", 
        LayoutOrder = v3.LayoutOrder, 
        Visible = v3.Visible, 
        Text = v4:getText(v3.AllHidden and "AllHiddenCount" or "HiddenCount", "Text", {
            hidden = v3.HiddenCount
        })
    });
end;