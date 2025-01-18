local _ = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetAnimationData);
local v5 = require(l_Actions_0.SetClipboard);
local v6 = require(l_Actions_0.SetFuture);
local v7 = require(l_Actions_0.SetIKEnabled);
local v8 = require(l_Actions_0.SetIKMode);
local v9 = require(l_Actions_0.SetIsDirty);
local v10 = require(l_Actions_0.SetIsLegacyAnimSaves);
local v11 = require(l_Actions_0.SetLegacyAnimationInstances);
local v12 = require(l_Actions_0.SetPast);
local v13 = require(l_Actions_0.SetPinnedParts);
local v14 = require(l_Actions_0.SetRootInstance);
local v15 = require(l_Actions_0.SetSelectedKeyframes);
local v16 = require(l_Actions_0.SetSelectedTrackInstances);
local v17 = require(l_Actions_0.SetShowTree);
local v18 = require(l_Actions_0.SetStartingPose);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v20 = require(l_Thunks_0.AttachEditor);
local _ = require(l_Thunks_0.Exporting.LoadAnimation);
local v22 = require(l_Thunks_0.LoadAnimationData);
local v23 = require(l_Thunks_0.LoadLatestAnimation);
local v24 = require(l_Thunks_0.ReleaseEditor);
local v25 = require(l_Thunks_0.SortAndSetTracks);
local v26 = require(l_Thunks_0.SetSelectedTracks);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v28 = require(l_Util_0.AnimationData);
local v29 = require(l_Util_0.Constants);
local v30 = require(l_Util_0.RigIK);
local v31 = require(l_Util_0.RigUtils);
local v32 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v33 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRenameClip);
return function(v34, v35, v36) --[[ Line: 41 ]]
    -- upvalues: v24 (copy), v13 (copy), v17 (copy), v7 (copy), v30 (copy), v8 (copy), v29 (copy), v14 (copy), v32 (copy), v26 (copy), v16 (copy), v18 (copy), v31 (copy), v11 (copy), v23 (copy), v33 (copy), v28 (copy), v22 (copy), v9 (copy), v10 (copy), v12 (copy), v6 (copy), v15 (copy), v25 (copy), v4 (copy), v5 (copy), v20 (copy)
    return function(v37) --[[ Line: 42 ]]
        -- upvalues: v24 (ref), v35 (copy), v13 (ref), v17 (ref), v7 (ref), v30 (ref), v34 (copy), v8 (ref), v29 (ref), v14 (ref), v32 (ref), v26 (ref), v16 (ref), v18 (ref), v31 (ref), v11 (ref), v23 (ref), v33 (ref), v28 (ref), v36 (copy), v22 (ref), v9 (ref), v10 (ref), v12 (ref), v6 (ref), v15 (ref), v25 (ref), v4 (ref), v5 (ref), v20 (ref)
        v37:dispatch(v24(v35));
        v37:dispatch(v13({}));
        v37:dispatch(v17(false));
        v37:dispatch(v7(false));
        local v38, v39 = v30.canUseIK(v34);
        v37:dispatch(v8(v39 and v29.IK_MODE.BodyPart or v29.IK_MODE.FullBody));
        v37:dispatch(v14(v34));
        if v32() then
            v37:dispatch(v26({}));
        else
            v37:dispatch(v16({}));
        end;
        if v38 and v39 then
            local v40 = v30.getPoseCFrames(v34);
            v37:dispatch(v18(v40));
        else
            v37:dispatch(v18(nil));
        end;
        local v41 = v31.getAnimSaves(v34);
        if #v41 > 0 then
            local v42 = {};
            for _, v44 in v41 do
                if v44.isLegacyAnimSaves then
                    table.insert(v42, v44);
                end;
            end;
            if #v42 > 0 then
                v37:dispatch(v11(v42));
            else
                v37:dispatch(v23(v34, v35));
            end;
        elseif v33() then
            local v45 = v28.newRigAnimation(v36:getText("Title", "DefaultAnimationName"));
            v37:dispatch(v22(v45, v35));
            v37:dispatch(v9(false));
            v37:dispatch(v10(false));
        else
            v37:dispatch(v12({}));
            v37:dispatch(v6({}));
            v37:dispatch(v15({}));
            v37:dispatch(v25({}));
            v37:dispatch(v4(nil));
        end;
        v37:dispatch(v5({}));
        v37:dispatch(v20(v35));
    end;
end;