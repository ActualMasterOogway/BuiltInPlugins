local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 15 ]] --[[ Name: VisualizationModeSectionDivider ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = "VisualizationModes-Bottom-Divider", 
        LayoutOrder = v2.LayoutOrder, 
        Visible = v2.Visible
    }, {
        DividerRender = v1.createElement("Frame")
    });
end;