local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v5) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v5 (copy), v2 (ref), v3 (ref), v4 (ref)
        local l_AnimationData_0 = v6:getState().AnimationData;
        local l_SelectedEvents_0 = v6:getState().Status.SelectedEvents;
        if not l_AnimationData_0 then
            return;
        else
            local v9 = v1(l_AnimationData_0);
            local l_Events_0 = v9.Events;
            if l_Events_0 == nil then
                return;
            else
                for v11, _ in pairs(l_SelectedEvents_0) do
                    if v5 and next(v5) then
                        for v13 in v5 do
                            v2.removeEvent(l_Events_0, v11, v13);
                        end;
                    else
                        v2.deleteEvents(l_Events_0, v11);
                    end;
                end;
                v6:dispatch(v3({}));
                v6:dispatch(v4(v9));
                return;
            end;
        end;
    end;
end;