local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.RigInfo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v5 = require(l_Actions_0.SetSelectedTracks);
local v6 = require(l_Actions_0.SetSelectedTrackInstances);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v8 = require(l_Thunks_0.SortAndSetSelectedTrackInstances);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
return function(v10) --[[ Line: 21 ]]
    -- upvalues: v5 (copy), v3 (copy), v9 (copy), v8 (copy), v6 (copy)
    return function(v11) --[[ Line: 22 ]]
        -- upvalues: v5 (ref), v10 (copy), v3 (ref), v9 (ref), v8 (ref), v6 (ref)
        local l_RootInstance_0 = v11:getState().Status.RootInstance;
        v11:dispatch(v5(v10));
        if not l_RootInstance_0 then
            return;
        else
            local v13 = {};
            local v14 = {};
            local l_Parts_0 = v3.getRigInfo(l_RootInstance_0).Parts;
            for _, v17 in ipairs(l_Parts_0) do
                v14[v17.Name] = v17;
            end;
            if v10 and next(l_Parts_0) then
                for _, v19 in ipairs(v10) do
                    local v20 = v19[1];
                    local v21 = v3.getBoneByName(l_RootInstance_0, v20);
                    if v21 then
                        table.insert(v13, v21);
                    else
                        table.insert(v13, v14[v20]);
                    end;
                end;
            end;
            if v13 and next(v13) then
                if v9() then
                    v11:dispatch(v8(v13));
                    return;
                else
                    v11:dispatch(v6(v13));
                end;
            end;
            return;
        end;
    end;
end;