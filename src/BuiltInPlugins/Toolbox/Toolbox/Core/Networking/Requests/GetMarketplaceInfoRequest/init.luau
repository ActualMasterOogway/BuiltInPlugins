local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.firstToUpper);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.UpdateAssetConfigData);
local v7 = require(l_Parent_0.Core.Types.ConfigTypes);
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local l_HttpService_0 = game:GetService("HttpService");
return function(v11, v12) --[[ Line: 22 ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy), v2 (copy), v5 (copy), v7 (copy), l_Promise_0 (copy), v6 (copy)
    return function(v13) --[[ Line: 23 ]]
        -- upvalues: l_HttpService_0 (ref), v3 (ref), v2 (ref), v5 (ref), v7 (ref), v12 (copy), l_Promise_0 (ref), v11 (copy), v6 (ref)
        local v14 = {};
        local function v20(v15) --[[ Line: 26 ]] --[[ Name: onAssetConfigDataGet ]]
            -- upvalues: l_HttpService_0 (ref), v14 (copy), v3 (ref)
            local l_responseBody_0 = v15.responseBody;
            local v17 = l_HttpService_0:JSONDecode(l_responseBody_0);
            for v18, v19 in pairs(v17.data[1]) do
                v14[v3(v18)] = v19;
            end;
        end;
        local function v22(v21) --[[ Line: 37 ]] --[[ Name: onAssetConfigDataFailed ]]
            -- upvalues: v2 (ref), v13 (copy), v5 (ref), v7 (ref)
            if v2.shouldDebugWarnings() then
                warn("failed with onAssetConfigDataGet in GetMarketplaceInfoRequest");
            end;
            v13:dispatch(v5(v21, v7.NetworkErrors.GET_ASSET_DETAIL_FAILURE));
        end;
        local function v27(v23) --[[ Line: 46 ]] --[[ Name: onPriceDataGet ]]
            -- upvalues: v12 (ref), v14 (copy), v3 (ref)
            local l_responseBody_1 = v23.responseBody;
            if l_responseBody_1 and #l_responseBody_1 > 0 and l_responseBody_1[1].assetId == v12 then
                for v25, v26 in pairs(l_responseBody_1[1]) do
                    v14[v3(v25)] = v26;
                end;
            end;
        end;
        local function v29(v28) --[[ Line: 55 ]] --[[ Name: onPriceDataFailed ]]
            -- upvalues: v2 (ref), v13 (copy), v5 (ref), v7 (ref)
            if v2.shouldDebugWarnings() then
                warn("failed with onPriceDataFailed in GetMarketplaceInfoRequest");
            end;
            v13:dispatch(v5(v28, v7.NetworkErrors.GET_ASSET_DETAIL_FAILURE));
        end;
        local function v32(v30) --[[ Line: 63 ]] --[[ Name: onAssetPermissionsGet ]]
            -- upvalues: v14 (copy)
            local l_responseBody_2 = v30.responseBody;
            if l_responseBody_2 then
                v14.AssetPermissions = l_responseBody_2.results;
            end;
        end;
        local function v34(v33) --[[ Line: 70 ]] --[[ Name: onAssetPermissionsFailed ]]
            -- upvalues: v2 (ref), v13 (copy), v5 (ref), v7 (ref)
            if v2.shouldDebugWarnings() then
                warn("failed with onAssetPermissionsFailed in GetMarketplaceInfoRequest");
            end;
            v13:dispatch(v5(v33, v7.NetworkErrors.GET_ASSET_DETAIL_FAILURE));
        end;
        l_Promise_0.all({
            v11:getDevelopAssetMetadata(v12):andThen(v20, v22), 
            v11:getAssetCreationDetails({
                v12
            }):andThen(v27, v29), 
            v11:getAssetPermissions(v12):andThen(v32, v34)
        }):andThen(function() --[[ Line: 82 ]]
            -- upvalues: v13 (copy), v6 (ref), v14 (copy)
            v13:dispatch(v6(v14));
        end);
    end;
end;