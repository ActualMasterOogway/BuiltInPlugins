local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 10 ]]
        -- upvalues: v3 (copy), v2 (ref), v1 (ref)
        local l_AnimationData_0 = v4:getState().AnimationData;
        local l_SelectedEvents_0 = v4:getState().Status.SelectedEvents;
        if not l_AnimationData_0 or not l_SelectedEvents_0 then
            return;
        else
            local l_Events_0 = l_AnimationData_0.Events;
            if l_Events_0 == nil then
                return;
            else
                if l_Events_0.Data and l_Events_0.Data[v3] then
                    v4:dispatch(v2(v1.Dictionary.join(l_SelectedEvents_0, {
                        [v3] = v1.None
                    })));
                end;
                return;
            end;
        end;
    end;
end;