local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetGridVisualization);
return function() --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return function(v2) --[[ Line: 10 ]]
        -- upvalues: v1 (ref)
        local v3 = not v2:getState().Status.VisualizeGrid;
        v2:dispatch(v1(v3));
    end;
end;