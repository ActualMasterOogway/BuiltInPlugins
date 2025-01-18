local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".SplitPane", {}, {
    l_createStyleRule_0(">> .X-Border ", {
        ZIndex = 2
    })
});