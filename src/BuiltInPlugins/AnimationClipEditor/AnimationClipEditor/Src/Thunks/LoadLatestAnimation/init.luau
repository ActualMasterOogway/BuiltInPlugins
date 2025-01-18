local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetIKEnabled);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetIKMode);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetShowTree);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetPinnedParts);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetClipboard);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.ReleaseEditor);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.AttachEditor);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.LoadAnimation);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetPast);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetFuture);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetLegacyAnimationInstances);
return function(v19, v20) --[[ Line: 25 ]]
    -- upvalues: v3 (copy), l_CollectionService_0 (copy), v13 (copy), v15 (copy), v16 (copy), v17 (copy), v14 (copy), v12 (copy)
    return function(v21) --[[ Line: 26 ]]
        -- upvalues: v3 (ref), v19 (copy), l_CollectionService_0 (ref), v13 (ref), v20 (copy), v15 (ref), v16 (ref), v17 (ref), v14 (ref), v12 (ref)
        local v22 = v3.getAnimSaves(v19);
        if #v22 > 0 then
            table.sort(v22, function(v23, v24) --[[ Line: 30 ]]
                -- upvalues: l_CollectionService_0 (ref)
                local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v23.animation);
                local l_l_CollectionService_0_Tags_1 = l_CollectionService_0:GetTags(v24.animation);
                local v27 = l_l_CollectionService_0_Tags_0[1] and tonumber(l_l_CollectionService_0_Tags_0[1]);
                local v28 = l_l_CollectionService_0_Tags_1[1] and tonumber(l_l_CollectionService_0_Tags_1[1]);
                if not v27 and not v28 then
                    return v23.animation.Name < v24.animation.Name;
                elseif v27 and not v28 then
                    return true;
                elseif v28 and not v27 then
                    return false;
                else
                    return v28 < v27;
                end;
            end);
            v21:dispatch(v13(v22[1].animation.Name, v22[1].isLegacyAnimSaves, v20));
            return;
        else
            v21:dispatch(v15({}));
            v21:dispatch(v16({}));
            v21:dispatch(v17({}));
            v21:dispatch(v14({}));
            v21:dispatch(v12(nil));
            return;
        end;
    end;
end;