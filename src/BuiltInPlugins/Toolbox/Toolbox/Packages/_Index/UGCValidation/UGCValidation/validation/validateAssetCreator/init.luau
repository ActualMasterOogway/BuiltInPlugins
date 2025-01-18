local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50);
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.APIUtil);
local _ = require(l_Parent_0.util.Types);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = v3.getBaseDomain();
local v7 = string.format("https://apis.%s", v6);
local l_game_FastInt_0 = game:GetFastInt("UGCValidationCanPublishRequestPageSize");
local l_game_FastInt_1 = game:GetFastInt("UGCValidationMaxAssetSizeAllowed");
local v10 = require(l_Parent_0.Constants);
local v11 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v12 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidationAnalytics);
local function _(v14, v15, v16, v17, v18) --[[ Line: 34 ]] --[[ Name: createCanPublishPromise ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy), v10 (copy)
    if #v15 == 0 then
        return v1.resolve();
    else
        return v1.new(function(v19, v20) --[[ Line: 38 ]]
            -- upvalues: l_HttpService_0 (ref), v15 (copy), v16 (copy), v18 (copy), v14 (copy), v10 (ref), v17 (copy)
            local v21 = l_HttpService_0:JSONEncode({
                assetIds = v15, 
                restrictedEntities = v16, 
                universeId = v18
            });
            l_HttpService_0:RequestInternal({
                Url = v14, 
                Method = "POST", 
                Body = v21, 
                Headers = {
                    [v10.ExperienceAuthHeaderKey] = v17, 
                    [v10.ContentType] = v10.ApplicationJson
                }
            }):Start(function(v22, v23) --[[ Line: 55 ]]
                -- upvalues: l_HttpService_0 (ref), v19 (copy), v20 (copy)
                if v22 and v23.StatusCode == 200 then
                    local v24 = l_HttpService_0:JSONDecode(v23.Body);
                    v19(v24);
                    return;
                else
                    v20();
                    return;
                end;
            end);
        end);
    end;
end;
return function(v26, v27) --[[ Line: 67 ]] --[[ Name: validateAssetCreator ]]
    -- upvalues: v7 (copy), v11 (copy), l_game_FastInt_1 (copy), v2 (copy), v12 (copy), l_game_FastInt_0 (copy), v1 (copy), l_HttpService_0 (copy), v10 (copy), v13 (copy)
    local l_isServer_0 = v27.isServer;
    local l_restrictedUserIds_0 = v27.restrictedUserIds;
    local l_token_0 = v27.token;
    local l_universeId_0 = v27.universeId;
    local v32 = v7 .. (l_isServer_0 and "packages-api/v1/rcc/canPublish" or "packages-api/v1/canPublish");
    local v33 = {
        User = {}, 
        Group = {}
    };
    local v34 = v11.new();
    local v35 = {};
    local v36 = {};
    local v37 = 0;
    for _, v39 in ipairs(l_restrictedUserIds_0) do
        v33[v39.creatorType][tonumber(v39.id)] = true;
    end;
    for v40, _ in v26 do
        if not v35[v40] then
            v37 = v37 + 1;
            v35[v40] = true;
        end;
    end;
    if l_game_FastInt_1 < v37 then
        v2.reportFailure(v2.ErrorType.validateAssetCreator_TooManyDependencies, nil, v27);
        return false, {
            "Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
        };
    else
        local v42 = {};
        for v43, _ in v35 do
            if not v12() or v43 ~= 0 then
                table.insert(v42, v43);
                if #v42 >= l_game_FastInt_0 then
                    local l_v42_0 = v42;
                    table.insert(v36, if #l_v42_0 == 0 then v1.resolve() else v1.new(function(v46, v47) --[[ Line: 38 ]]
                        -- upvalues: l_HttpService_0 (ref), l_v42_0 (copy), l_restrictedUserIds_0 (copy), l_universeId_0 (copy), v32 (copy), v10 (ref), l_token_0 (copy)
                        local v48 = l_HttpService_0:JSONEncode({
                            assetIds = l_v42_0, 
                            restrictedEntities = l_restrictedUserIds_0, 
                            universeId = l_universeId_0
                        });
                        l_HttpService_0:RequestInternal({
                            Url = v32, 
                            Method = "POST", 
                            Body = v48, 
                            Headers = {
                                [v10.ExperienceAuthHeaderKey] = l_token_0, 
                                [v10.ContentType] = v10.ApplicationJson
                            }
                        }):Start(function(v49, v50) --[[ Line: 55 ]]
                            -- upvalues: l_HttpService_0 (ref), v46 (copy), v47 (copy)
                            if v49 and v50.StatusCode == 200 then
                                local v51 = l_HttpService_0:JSONDecode(v50.Body);
                                v46(v51);
                                return;
                            else
                                v47();
                                return;
                            end;
                        end);
                    end));
                    v42 = {};
                end;
            end;
        end;
        if #v42 > 0 then
            local l_v42_1 = v42;
            local l_l_v42_1_0 = l_v42_1 --[[ copy: 14 -> 27 ]];
            table.insert(v36, if #l_v42_1 == 0 then v1.resolve() else v1.new(function(v54, v55) --[[ Line: 38 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_v42_1_0 (copy), l_restrictedUserIds_0 (copy), l_universeId_0 (copy), v32 (copy), v10 (ref), l_token_0 (copy)
                local v56 = l_HttpService_0:JSONEncode({
                    assetIds = l_l_v42_1_0, 
                    restrictedEntities = l_restrictedUserIds_0, 
                    universeId = l_universeId_0
                });
                l_HttpService_0:RequestInternal({
                    Url = v32, 
                    Method = "POST", 
                    Body = v56, 
                    Headers = {
                        [v10.ExperienceAuthHeaderKey] = l_token_0, 
                        [v10.ContentType] = v10.ApplicationJson
                    }
                }):Start(function(v57, v58) --[[ Line: 55 ]]
                    -- upvalues: l_HttpService_0 (ref), v54 (copy), v55 (copy)
                    if v57 and v58.StatusCode == 200 then
                        local v59 = l_HttpService_0:JSONDecode(v58.Body);
                        v54(v59);
                        return;
                    else
                        v55();
                        return;
                    end;
                end);
            end));
        end;
        local v60, v61 = v1.all(v36):await();
        if not v60 then
            v2.reportFailure(v2.ErrorType.validateAssetCreator_FailedToLoad, nil, v27);
            return false, {
                "Failed to load detailed information for model assets. Make sure all model assets exist and try again."
            };
        else
            for _, v63 in v61 do
                local l_result_0 = v63.result;
                for v65, v66 in pairs(l_result_0) do
                    if v13() and not v66 then
                        v2.reportFailure(v2.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator, nil, v27);
                    end;
                    local v67 = v26[v65];
                    v34:updateReasons(v66, {
                        (string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", v67.instance:GetFullName(), v67.fieldName, v65))
                    });
                end;
            end;
            return v34:getFinalResults();
        end;
    end;
end;