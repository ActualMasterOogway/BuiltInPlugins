local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetTracks);
return function(v6, v7, v8) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy), v5 (copy)
    return function(v9) --[[ Line: 19 ]]
        -- upvalues: v1 (ref), v4 (ref), v6 (copy), v2 (ref), v7 (copy), v8 (copy), v3 (ref), v5 (ref)
        local v10 = v9:getState();
        local v11 = v1(v10.Status.Tracks);
        local l_AnimationData_0 = v10.AnimationData;
        local v13 = v4.isChannelAnimation(l_AnimationData_0);
        local l_ipairs_0 = ipairs;
        local v15 = v6 or {};
        for _, v17 in l_ipairs_0(v15) do
            local function v18(v19) --[[ Line: 26 ]] --[[ Name: recurse ]]
                -- upvalues: v13 (copy), v2 (ref), v7 (ref), v8 (ref), v18 (copy)
                if v13 and v19.Components or v19.Type == v2.TRACK_TYPES.CFrame then
                    v19.Expanded = v7;
                    if v8 and v19.Components then
                        for _, v21 in pairs(v19.Components) do
                            v18(v21);
                        end;
                    end;
                end;
            end;
            v18((v3.findTrackEntry(v11, v17)));
        end;
        v9:dispatch(v5(v11));
    end;
end;