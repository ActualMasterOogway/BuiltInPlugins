local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = v1.join;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetFrameBuffer);
local v7 = require(l_Actions_0.SetOverrides);
return (v2.createReducer({
    FrameBuffer = nil, 
    Overrides = {}
}, {
    [v6.name] = function(v8, v9) --[[ Line: 33 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v8, {
            FrameBuffer = v9.frameBuffer
        });
    end, 
    [v7.name] = function(v10, v11) --[[ Line: 38 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v10, {
            Overrides = v11.overrides
        });
    end
}));