local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetShowFaceControlsEditorPanel);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v2) --[[ Line: 6 ]]
        -- upvalues: v1 (ref)
        local v3 = v2:getState();
        if not v3.Status.RootInstance then
            return;
        else
            local v4 = not v3.Status.ShowFaceControlsEditorPanel;
            v2:dispatch(v1(v4));
            return;
        end;
    end;
end;