local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetClipboard);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v5) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v5 (copy), v2 (ref), v3 (ref), v4 (ref)
        local l_AnimationData_0 = v6:getState().AnimationData;
        local l_SelectedEvents_0 = v6:getState().Status.SelectedEvents;
        if not l_AnimationData_0 or not l_SelectedEvents_0 then
            return;
        else
            local l_Events_0 = l_AnimationData_0.Events;
            if l_Events_0 == nil then
                return;
            else
                if not v1(l_SelectedEvents_0) then
                    local v10 = {};
                    for v11, _ in pairs(l_SelectedEvents_0) do
                        if v5 and next(v5) then
                            v10[v11] = {};
                            for v13 in v5 do
                                v10[v11][v13] = l_Events_0.Data[v11][v13];
                            end;
                        else
                            v10[v11] = v2(l_Events_0.Data[v11]);
                        end;
                    end;
                    v6:dispatch(v3(v10, v4.CLIPBOARD_TYPE.Events));
                end;
                return;
            end;
        end;
    end;
end;