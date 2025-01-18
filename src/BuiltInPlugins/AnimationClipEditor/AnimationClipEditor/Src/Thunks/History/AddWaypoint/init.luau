local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPast);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetFuture);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
return function(v5) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v1 (ref), v4 (ref), v2 (ref), v3 (ref)
        local v7 = v6:getState();
        local v8 = v5 or v7.AnimationData;
        local l_Tracks_0 = v7.Status.Tracks;
        local l_History_0 = v7.History;
        local l_Past_0 = l_History_0.Past;
        if v8 == nil or l_Tracks_0 == nil then
            return;
        else
            l_Past_0 = v1.List.join({
                {
                    AnimationData = v1.Dictionary.join(v8), 
                    Tracks = v1.List.join(l_Tracks_0)
                }
            }, l_Past_0);
            l_Past_0 = v1.List.filter(l_Past_0, function(_, v13) --[[ Line: 34 ]]
                -- upvalues: l_History_0 (copy)
                return v13 <= l_History_0.MaxWaypointSize;
            end);
            v6:dispatch(v4(true));
            v6:dispatch(v2(l_Past_0));
            v6:dispatch(v3({}));
            return;
        end;
    end;
end;