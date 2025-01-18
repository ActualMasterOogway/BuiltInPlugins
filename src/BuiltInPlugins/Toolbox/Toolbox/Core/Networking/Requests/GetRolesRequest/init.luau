local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetAllowedAssetTypes);
local v5 = require(l_Parent_0.Core.Actions.SetAllowedBundleTypes);
local v6 = require(l_Parent_0.Core.Actions.SetTagsMetadata);
local v7 = require(l_Parent_0.Core.Util.DebugFlags);
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), v7 (copy), v3 (copy), l_Promise_0 (copy)
    return function(v9) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v3 (ref), l_Promise_0 (ref)
        if v8 and v8.getMetaData then
            local function v26(v10) --[[ Line: 17 ]]
                -- upvalues: v9 (copy), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref)
                local v11 = if v10.responseBody then v10.responseBody.allowedAssetTypesForRelease else {};
                local v12 = if v10.responseBody then v10.responseBody.allowedAssetTypeForUpload else {};
                local v13 = if v10.responseBody then v10.responseBody.allowedAssetTypesForFree else {};
                v9:dispatch(v4(v11, v12, v13));
                local function v23(v14) --[[ Line: 39 ]]
                    -- upvalues: v9 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref)
                    if v14.responseBody and v14.responseBody.isBundlesControllerEnabled then
                        local v15 = v14.responseBody and v14.responseBody.allowedBundleTypeSettings;
                        v9:dispatch(v5(v15));
                    end;
                    local function v20(v16) --[[ Line: 51 ]]
                        -- upvalues: v9 (ref), v6 (ref)
                        local v17 = v16.responseBody and v16.responseBody.isItemTagsFeatureEnabled == true;
                        local v18 = if v16.responseBody then v16.responseBody.enabledAssetTypes or {} else {};
                        local v19 = if v16.responseBody then v16.responseBody.maximumItemTagsPerItem or 0 else 0;
                        v9:dispatch(v6(v17, v18, v19));
                    end;
                    local function v22(_) --[[ Line: 65 ]]
                        -- upvalues: v7 (ref)
                        if v7.shouldDebugWarnings() then
                            warn("Lua toolbox: Could not get tags metadata");
                        end;
                    end;
                    return v8:getTagsMetadata():andThen(v20, v22);
                end;
                local function v25(_) --[[ Line: 75 ]]
                    -- upvalues: v7 (ref)
                    if v7.shouldDebugWarnings() then
                        warn("Lua toolbox: Could not get bundles metadata");
                    end;
                end;
                return v8:getBundleMetadata():andThen(v23, v25);
            end;
            local function v28(v27) --[[ Line: 85 ]]
                -- upvalues: v7 (ref), v9 (copy), v3 (ref)
                if v7.shouldDebugWarnings() then
                    warn("Lua toolbox: Could not get roleset back-end data");
                end;
                v9:dispatch(v3(v27));
            end;
            return v8:getMetaData():andThen(v26, v28);
        else
            return l_Promise_0.reject();
        end;
    end;
end;