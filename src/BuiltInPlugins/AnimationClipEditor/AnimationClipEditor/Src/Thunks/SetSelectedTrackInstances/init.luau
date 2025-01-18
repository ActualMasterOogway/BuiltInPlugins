local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.RigInfo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v5 = require(l_Actions_0.SetSelectedTracks);
local v6 = require(l_Actions_0.SetSelectedTrackInstances);
local v7 = require(l_Actions_0.SetTopTrackIndex);
return function(v8) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy), v7 (copy)
    return function(v9) --[[ Line: 18 ]]
        -- upvalues: v6 (ref), v8 (copy), v5 (ref), v3 (ref), v7 (ref)
        v9:dispatch(v6(v8));
        local l_Status_0 = v9:getState().Status;
        local l_RootInstance_0 = l_Status_0.RootInstance;
        local l_Tracks_0 = l_Status_0.Tracks;
        if not l_RootInstance_0 then
            return;
        else
            if not v8 or not next(v8) then
                v9:dispatch(v5({}));
            end;
            local l_Parts_0 = v3.getRigInfo(l_RootInstance_0).Parts;
            local v14 = {};
            local v15 = {};
            for _, v17 in ipairs(l_Parts_0) do
                v15[v17] = {
                    v17.Name
                };
            end;
            for _, v19 in v8 do
                local l_BoneRef_0 = v19:FindFirstChild("BoneRef");
                if l_BoneRef_0 then
                    table.insert(v14, v15[l_BoneRef_0.Value]);
                else
                    table.insert(v14, v15[v19]);
                end;
            end;
            local v21 = v14[#v14];
            local v22 = 1;
            if v21 then
                for v23, v24 in l_Tracks_0 do
                    if v24.Name == v21[1] then
                        v22 = v23;
                        break;
                    end;
                end;
            end;
            v9:dispatch(v5(v14));
            v9:dispatch(v7(v22));
            return;
        end;
    end;
end;