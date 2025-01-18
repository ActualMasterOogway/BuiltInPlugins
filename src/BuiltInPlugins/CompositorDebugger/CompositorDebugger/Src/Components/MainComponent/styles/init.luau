local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".MainPane", {
    BorderSizePixel = 0
}, {
    l_createStyleRule_0(">> #Toolbar", {
        Size = UDim2.new(1, 0, 0, 24)
    }), 
    l_createStyleRule_0(">> #LayerTree", {
        Size = UDim2.new(1, 0, 1, -24)
    })
});