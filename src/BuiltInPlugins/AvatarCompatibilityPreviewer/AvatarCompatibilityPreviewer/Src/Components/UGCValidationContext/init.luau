local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
local v6 = require(script.useCanUploadBundles);
local v7 = require(l_script_FirstAncestor_0.Src.Util.CharacterHashUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerRerunValidation);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_Analytics_0 = v1.ContextServices.Analytics;
local v11 = {
    DEPRECATED_cachedResponses = {}, 
    cachedResponses = {}, 
    validateBundle = v5("validateBundle"), 
    revalidateBundle = v5("revalidateBundle"), 
    findCachedValidationResponse = v5("findCachedValidationResponse"), 
    calculateScaleToValidateBoundsAsync = v5("calculateScaleToValidateBoundsAsync"), 
    preprocessDataAsync = v5("preprocessDataAsync"), 
    isPreprocessDataCached = v5("isPreprocessDataCached"), 
    canUploadBundles = nil, 
    requestCanUploadBundles = v5("requestCanUploadBundles")
};
local v12 = v2.createContext(v11);
return {
    Context = v12, 
    Provider = function(v13) --[[ Line: 62 ]] --[[ Name: Provider ]]
        -- upvalues: l_Analytics_0 (copy), v2 (copy), v4 (copy), v9 (copy), v7 (copy), v3 (copy), v8 (copy), v6 (copy), v12 (copy)
        local v14 = l_Analytics_0:use();
        local v15, v16 = v2.useState({});
        local v17 = v2.useRef({});
        assert(v17.current ~= nil, v4.LUAU_ANALYZE_ERROR);
        local v18, v19 = v2.useState({});
        local v20 = v2.useRef({});
        assert(v20.current ~= nil, v4.LUAU_ANALYZE_ERROR);
        local v21 = v2.useRef(nil);
        local v24 = v2.useCallback(function(v22) --[[ Line: 81 ]]
            -- upvalues: v9 (ref), v7 (ref), v18 (copy)
            assert(v9(), "getFFlagAvatarPreviewerUseAnyModel() must be enabled");
            local v23 = v7.computeHashSerializeContext({
                v22
            }, {
                ignoreUniformScaleChanges = false, 
                ignoreAccessories = true
            });
            return v18[v7.hashCharacter(v22, v23)];
        end, {
            v18
        });
        local v38 = v2.useCallback(function(v25) --[[ Line: 93 ]]
            -- upvalues: v9 (ref), v7 (ref), v20 (copy), v17 (copy), v21 (copy), v3 (ref), v14 (copy), v4 (ref), v19 (copy), v16 (copy)
            local v26 = nil;
            if v9() then
                local v27 = v7.computeHashSerializeContext({
                    v25
                }, {
                    ignoreUniformScaleChanges = false, 
                    ignoreAccessories = true
                });
                v26 = v7.hashCharacter(v25, v27);
                if v20.current[v26] then
                    return;
                else
                    v20.current[v26] = true;
                end;
            elseif v17.current[v25] then
                return;
            else
                v17.current[v25] = true;
            end;
            if v21.current == nil then
                v21.current = v3.util.BundlesMetadata.fetch():andThen(function(v28) --[[ Line: 118 ]]
                    return {
                        type = "success", 
                        metadata = v28
                    };
                end):catch(function(v29) --[[ Line: 124 ]]
                    -- upvalues: v14 (ref)
                    v14:report("bundlesMetadataError", v29);
                    return {
                        type = "error"
                    };
                end);
            end;
            assert(v21.current ~= nil, v4.LUAU_ANALYZE_ERROR);
            v21.current:andThen(function(v30) --[[ Line: 134 ]]
                -- upvalues: v4 (ref), v3 (ref), v25 (copy), v9 (ref), v19 (ref), v26 (ref), v16 (ref)
                if v30.type ~= "success" then
                    return;
                else
                    assert(v30.type == "success", v4.LUAU_ANALYZE_ERROR);
                    local v31 = os.clock();
                    v3.validateBundleReadyForUpload(v25, v30.metadata.allowedBundleTypeSettings, "Body", function(v32) --[[ Line: 146 ]]
                        -- upvalues: v9 (ref), v19 (ref), v26 (ref), v16 (ref), v25 (ref)
                        if v9() then
                            v19(function(v33) --[[ Line: 148 ]]
                                -- upvalues: v26 (ref), v32 (copy)
                                v33 = table.clone(v33);
                                v33[v26] = {
                                    completed = false, 
                                    ugcValidationResponse = v32
                                };
                                return v33;
                            end);
                            return;
                        else
                            v16(function(v34) --[[ Line: 157 ]]
                                -- upvalues: v25 (ref), v32 (copy)
                                v34 = table.clone(v34);
                                v34[v25] = {
                                    completed = false, 
                                    ugcValidationResponse = v32
                                };
                                return v34;
                            end);
                            return;
                        end;
                    end, nil, {
                        skipValidateHSR = true
                    }):andThen(function(v35) --[[ Line: 172 ]]
                        -- upvalues: v9 (ref), v19 (ref), v26 (ref), v31 (copy), v16 (ref), v25 (ref)
                        if v9() then
                            v19(function(v36) --[[ Line: 174 ]]
                                -- upvalues: v26 (ref), v31 (ref), v35 (copy)
                                v36 = table.clone(v36);
                                v36[v26] = {
                                    completed = true, 
                                    duration = os.clock() - v31, 
                                    ugcValidationResponse = v35
                                };
                                return v36;
                            end);
                            return;
                        else
                            v16(function(v37) --[[ Line: 184 ]]
                                -- upvalues: v25 (ref), v31 (ref), v35 (copy)
                                v37 = table.clone(v37);
                                v37[v25] = {
                                    completed = true, 
                                    duration = os.clock() - v31, 
                                    ugcValidationResponse = v35
                                };
                                return v37;
                            end);
                            return;
                        end;
                    end):finally();
                    return;
                end;
            end);
        end, {});
        local v42 = if v8() then v2.useCallback(function(v39) --[[ Line: 200 ]]
            -- upvalues: v9 (ref), v7 (ref), v20 (copy), v38 (copy), v17 (copy)
            if v9() then
                local v40 = v7.computeHashSerializeContext({
                    v39
                }, {
                    ignoreUniformScaleChanges = false, 
                    ignoreAccessories = true
                });
                local v41 = v7.hashCharacter(v39, v40);
                v20.current[v41] = nil;
                v38(v39);
                return;
            else
                v17.current[v39] = nil;
                v38(v39);
                return;
            end;
        end, {
            v38
        }) else nil;
        local v43, v44 = v6(v3.util.canUploadBundlesAsync);
        local v45 = {
            DEPRECATED_cachedResponses = v15, 
            cachedResponses = v18, 
            validateBundle = v38, 
            revalidateBundle = v42, 
            calculateScaleToValidateBoundsAsync = v3.calculateScaleToValidateBoundsAsync, 
            preprocessDataAsync = v3.preprocessDataAsync, 
            isPreprocessDataCached = v3.isPreprocessDataCached, 
            findCachedValidationResponse = v24, 
            canUploadBundles = v43, 
            requestCanUploadBundles = v44
        };
        return v2.createElement(v12.Provider, {
            value = v45
        }, v13.children);
    end
};