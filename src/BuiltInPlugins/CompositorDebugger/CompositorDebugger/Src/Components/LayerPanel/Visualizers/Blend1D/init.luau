local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_join_0 = v1.join;
local v4 = require(script.Parent.BlendBase);
local v5 = v2.PureComponent:extend("Blend1DVisualization");
v5.render = function(v6) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), l_join_0 (copy)
    return v2.createElement(v4, l_join_0(v6.props, {
        Show2D = false, 
        ShowTrail = false
    }));
end;
return v5;