local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local v3 = require(l_Util_0.DebugFlags);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local l_Types_0 = l_Parent_0.Core.Types;
local _ = require(l_Types_0.AssetMediaTypes);
local l_Packages_0 = l_Parent_0.Packages;
local v8 = require(l_Packages_0.Framework);
local v9 = require(l_Packages_0.Dash);
local l_append_0 = v9.append;
local l_findIndex_0 = v9.findIndex;
local l_join_0 = v9.join;
local l_map_0 = v9.map;
local l_Promise_0 = v8.Util.Promise;
return function(v15, v16, v17, v18) --[[ Line: 23 ]]
    -- upvalues: l_map_0 (copy), v3 (copy), v4 (copy), l_findIndex_0 (copy), l_join_0 (copy), v2 (copy), l_append_0 (copy), l_Promise_0 (copy)
    return function(v19) --[[ Line: 29 ]]
        -- upvalues: v17 (copy), l_map_0 (ref), v15 (copy), v16 (copy), v3 (ref), v4 (ref), l_findIndex_0 (ref), l_join_0 (ref), v2 (ref), v18 (copy), l_append_0 (ref), l_Promise_0 (ref)
        local l_ThumbnailIdsToRemove_0 = v17.ThumbnailIdsToRemove;
        local l_ThumbnailFilesToAdd_0 = v17.ThumbnailFilesToAdd;
        local l_ThumbnailOrderToChange_0 = v17.ThumbnailOrderToChange;
        local v23 = {
            Delete = {}, 
            Upload = {}, 
            SetOrder = true, 
            OverallSuccess = true
        };
        local v26 = l_map_0(l_ThumbnailIdsToRemove_0, function(v24) --[[ Line: 43 ]]
            -- upvalues: v15 (ref), v16 (ref), v23 (copy), v3 (ref), v19 (copy), v4 (ref)
            return v15:deleteAssetMedia(v16, v24):andThen(function() --[[ Line: 46 ]]
                -- upvalues: v23 (ref), v24 (copy)
                v23.Delete[v24] = true;
            end):catch(function(v25) --[[ Line: 49 ]]
                -- upvalues: v3 (ref), v24 (copy), v16 (ref), v23 (ref), v19 (ref), v4 (ref)
                if v3.shouldDebugWarnings() then
                    warn("Could not delete asset media id:", v24, "for asset id:", v16, "error:", v25);
                end;
                v23.Delete[v24] = false;
                v23.OverallSuccess = false;
                v19:dispatch(v4(v25));
            end);
        end);
        local v35 = l_map_0(l_ThumbnailFilesToAdd_0, function(v27) --[[ Line: 60 ]]
            -- upvalues: v15 (ref), v16 (ref), l_findIndex_0 (ref), l_ThumbnailOrderToChange_0 (ref), l_join_0 (ref), v23 (copy), v3 (ref), v19 (copy), v4 (ref)
            return v15:postUploadAssetMedia(v16, v27):andThen(function(v28) --[[ Line: 63 ]]
                -- upvalues: v27 (copy), l_findIndex_0 (ref), l_ThumbnailOrderToChange_0 (ref), l_join_0 (ref), v23 (ref)
                local l_v27_TemporaryId_0 = v27:GetTemporaryId();
                local l_targetId_0 = v28.targetId;
                local v32 = l_findIndex_0(l_ThumbnailOrderToChange_0, function(v31) --[[ Line: 66 ]]
                    -- upvalues: l_v27_TemporaryId_0 (copy)
                    return v31 == l_v27_TemporaryId_0;
                end);
                l_ThumbnailOrderToChange_0 = l_join_0(l_ThumbnailOrderToChange_0, {
                    [v32] = l_targetId_0
                });
                v23.Upload[l_targetId_0] = true;
            end):catch(function(v33) --[[ Line: 75 ]]
                -- upvalues: v3 (ref), v27 (copy), v16 (ref), v23 (ref), v19 (ref), v4 (ref)
                if v3.shouldDebugWarnings() then
                    warn("Could not upload asset media:", v27, "for asset id:", v16, "error:", v33);
                end;
                local l_v27_TemporaryId_1 = v27:GetTemporaryId();
                v23.Upload[l_v27_TemporaryId_1] = false;
                v23.OverallSuccess = false;
                v19:dispatch(v4(v33));
            end);
        end);
        local function v37() --[[ Line: 88 ]] --[[ Name: setOrderRequest ]]
            -- upvalues: v15 (ref), v16 (ref), l_ThumbnailOrderToChange_0 (ref), v23 (copy), v2 (ref), v18 (ref), v3 (ref), v19 (copy), v4 (ref)
            return v15:postSetAssetMediaOrder(v16, l_ThumbnailOrderToChange_0):andThen(function() --[[ Line: 93 ]]
                -- upvalues: v23 (ref), v2 (ref), v16 (ref), v18 (ref), l_ThumbnailOrderToChange_0 (ref)
                v23.SetOrder = true;
                v2.AssetMediaItemsUpdated(v16, v18.Value, l_ThumbnailOrderToChange_0);
            end):catch(function(v36) --[[ Line: 98 ]]
                -- upvalues: v3 (ref), l_ThumbnailOrderToChange_0 (ref), v16 (ref), v23 (ref), v19 (ref), v4 (ref)
                if v3.shouldDebugWarnings() then
                    warn("Could not set order for asset media:", l_ThumbnailOrderToChange_0, "for asset id:", v16, "error:", v36);
                end;
                v23.SetOrder = false;
                v23.OverallSuccess = false;
                v19:dispatch(v4(v36));
            end);
        end;
        local v38 = l_append_0(v26, v35);
        local v39 = nil;
        if #v38 == 0 then
            v39 = if #l_ThumbnailOrderToChange_0 == 0 then l_Promise_0.resolve() else v37();
        else
            local v40 = l_Promise_0.all(v38);
            v39 = if #l_ThumbnailOrderToChange_0 == 0 then v40 else v40:andThen(function() --[[ Line: 130 ]]
                -- upvalues: v23 (copy), v37 (copy)
                if v23.OverallSuccess then
                    v37();
                end;
            end);
        end;
        return v39:andThen(function() --[[ Line: 139 ]]
            -- upvalues: v23 (copy)
            return v23;
        end);
    end;
end;