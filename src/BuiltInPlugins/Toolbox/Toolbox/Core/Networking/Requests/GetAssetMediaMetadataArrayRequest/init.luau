local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.createAssetMediaMetadata);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.SetAssetMediaMetadataArray);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v8 = require(l_Requests_0.GetAssetMediaIdsRequest);
local l_HttpService_0 = game:GetService("HttpService");
return function(v10, v11) --[[ Line: 19 ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy), v2 (copy), v5 (copy), v8 (copy), v6 (copy)
    return function(v12) --[[ Line: 20 ]]
        -- upvalues: l_HttpService_0 (ref), v3 (ref), v2 (ref), v5 (ref), v8 (ref), v10 (copy), v11 (copy), v6 (ref)
        local function v19(v13) --[[ Line: 21 ]] --[[ Name: onDevelopAssetMetadataGet ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref)
            if v13 == nil then
                return nil;
            else
                local l_responseBody_0 = v13.responseBody;
                local v15 = l_HttpService_0:JSONDecode(l_responseBody_0);
                local v16 = {};
                for _, v18 in ipairs(v15.data) do
                    table.insert(v16, v3.fromDevelop(v18));
                end;
                return v16;
            end;
        end;
        local function v21(v20) --[[ Line: 37 ]] --[[ Name: onDevelopAssetMetadataFailed ]]
            -- upvalues: v2 (ref), v12 (copy), v5 (ref)
            if v2.shouldDebugWarnings() then
                warn("Failed to get asset media metadata: ", v20);
            end;
            v12:dispatch(v5(v20));
        end;
        return v12:dispatch(v8(v10, v11, true, true)):andThen(function(v22) --[[ Line: 49 ]]
            -- upvalues: v10 (ref)
            if v22 ~= nil and #v22 > 0 then
                return v10:getDevelopAssetMetadata(v22);
            else
                return;
            end;
        end):andThen(v19, v21):andThen(function(v23) --[[ Line: 55 ]]
            -- upvalues: v12 (copy), v6 (ref)
            if v23 ~= nil and #v23 > 0 then
                v12:dispatch(v6(v23));
            end;
        end);
    end;
end;