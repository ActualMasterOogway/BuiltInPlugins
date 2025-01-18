local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Core.Actions.SetUploadFee);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.UploadResult);
local v5 = require(l_Parent_0.Libs.Http.StatusCodes);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.AssetConfigConstants);
local v8 = require(l_Util_0.SerializeInstances);
local v9 = require(l_Util_0.DebugFlags);
local v10 = require(l_Util_0.createMultipartFormDataBody);
local function _() --[[ Line: 19 ]] --[[ Name: createConfigDataTable ]]
    return {
        name = "", 
        description = ""
    };
end;
return function(v12, v13, v14) --[[ Line: 26 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), v9 (copy), v3 (copy), v4 (copy), v5 (copy), v8 (copy), v10 (copy), v7 (copy)
    return function(v15, v16) --[[ Line: 27 ]]
        -- upvalues: l_HttpService_0 (ref), v2 (ref), v9 (ref), v3 (ref), v4 (ref), v5 (ref), v8 (ref), v14 (copy), v12 (copy), v10 (ref), v13 (copy), v7 (ref)
        local function v20(v17) --[[ Line: 28 ]]
            -- upvalues: l_HttpService_0 (ref), v15 (copy), v2 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
                -- upvalues: l_HttpService_0 (ref), v17 (copy)
                return l_HttpService_0:JSONDecode(v17.Body);
            end);
            if l_status_0 and l_result_0.price ~= nil and l_result_0.canAfford ~= nil then
                v15:dispatch(v2(true, l_result_0.price, l_result_0.canAfford));
                return;
            else
                warn("Unexpected AvatarAssetsGetUploadFee response body:", v17.Body);
                v15:dispatch(v2(false));
                return;
            end;
        end;
        local function v22(v21) --[[ Line: 40 ]] --[[ Name: onSerializeFail ]]
            -- upvalues: v9 (ref), v15 (copy), v3 (ref), v4 (ref)
            if v9.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v15:dispatch(v3((tostring(v21))));
            v15:dispatch(v4(false));
        end;
        local function v24(v23) --[[ Line: 49 ]]
            -- upvalues: v5 (ref), v15 (copy), v2 (ref), v3 (ref), v4 (ref)
            if v23.StatusCode == v5.SERVICE_UNAVAILABLE then
                v15:dispatch(v2(false));
                return;
            else
                v15:dispatch(v3(v23.Body));
                v15:dispatch(v4(false));
                return;
            end;
        end;
        return v8(v14, v16.StudioAssetService):andThen(function(v25) --[[ Line: 60 ]]
            -- upvalues: v12 (ref), v10 (ref), v13 (ref), v7 (ref), v20 (copy), v24 (copy)
            local v26 = v12:jsonEncode({
                name = "", 
                description = ""
            });
            local v27 = v10({
                {
                    type = "application/json", 
                    disposition = {
                        name = "config", 
                        filename = "config.json"
                    }, 
                    value = v26
                }, 
                {
                    type = "application/octet-stream", 
                    disposition = {
                        name = "accessory", 
                        filename = "accessory.rbxm"
                    }, 
                    value = v25
                }
            });
            return v12:avatarAssetsGetUploadFee(v13, v27, v7.MULTIPART_FORM_BOUNDARY):andThen(v20, v24);
        end, v22);
    end;
end;