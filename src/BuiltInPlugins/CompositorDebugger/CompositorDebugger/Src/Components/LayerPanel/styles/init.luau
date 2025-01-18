local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".LayerPanel", {}, {
    l_createStyleRule_0("> .Panel", {
        Size = UDim2.new(1, 0, 1, -33)
    })
});