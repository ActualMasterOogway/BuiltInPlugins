local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Util.Signal);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v5 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v6 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext.useCanUploadBundles);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v8 = {};
local function v9() --[[ Line: 14 ]] --[[ Name: defaultRequestCanUploadBundles ]]
    return {
        type = "allowed"
    };
end;
local function v31(v10) --[[ Line: 20 ]] --[[ Name: MockProvider ]]
    -- upvalues: v2 (copy), v7 (copy), v1 (copy), v6 (copy), v9 (copy), v5 (copy)
    local v11, v12 = v2.useState(if v7() then nil else {});
    local v13, v14 = v2.useState({});
    local v16 = v2.useCallback(function(v15) --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v13 (copy)
        assert(v7(), "getFFlagAvatarPreviewerUseAnyModel() must be enabled");
        return v13[v15];
    end, {
        v13
    });
    local v24 = v2.useCallback(function(v17) --[[ Line: 41 ]]
        -- upvalues: v7 (ref), v14 (copy), v10 (copy), v12 (copy), v1 (ref)
        local function v23() --[[ Line: 42 ]] --[[ Name: setResponses ]]
            -- upvalues: v7 (ref), v14 (ref), v17 (copy), v10 (ref), v12 (ref), v1 (ref)
            if v7() then
                v14(function(v18) --[[ Line: 44 ]]
                    -- upvalues: v17 (ref), v10 (ref)
                    if v18[v17] ~= nil then
                        return v18;
                    else
                        local v19 = v10.createCachedResponse();
                        if v19 == nil then
                            return v18;
                        else
                            local v20 = table.clone(v18);
                            v20[v17] = v19;
                            return v20;
                        end;
                    end;
                end);
                return;
            else
                v12(function(v21) --[[ Line: 60 ]]
                    -- upvalues: v17 (ref), v10 (ref), v1 (ref)
                    if v21[v17] ~= nil then
                        return v21;
                    else
                        local v22 = v10.createCachedResponse();
                        if v22 == nil then
                            return v21;
                        else
                            assert(v22 ~= nil, v1.LUAU_ANALYZE_ERROR);
                            v21 = table.clone(v21);
                            v21[v17] = v22;
                            return v21;
                        end;
                    end;
                end);
                return;
            end;
        end;
        if v10.waitForSignal == nil then
            v23();
            return;
        else
            v10.waitForSignal:Once(v23);
            return;
        end;
    end, {});
    local v25 = v2.useCallback(function() --[[ Line: 86 ]]
        return {
            ok = false, 
            errors = {
                "Not implemented"
            }
        };
    end, {});
    local v26 = v2.useCallback(function() --[[ Line: 95 ]]
        return {
            ok = false, 
            errors = {
                "Not implemented"
            }
        };
    end, {});
    local v27 = v2.useCallback(function() --[[ Line: 102 ]]
        return false;
    end, {});
    local v28, v29 = v6(v10.canUploadBundlesAsync or v9);
    local v30 = {
        cachedResponses = v13, 
        DEPRECATED_cachedResponses = v11, 
        validateBundle = v24, 
        revalidateBundle = v24, 
        calculateScaleToValidateBoundsAsync = v25, 
        preprocessDataAsync = v26, 
        isPreprocessDataCached = v27, 
        findCachedValidationResponse = v16, 
        canUploadBundles = v28, 
        requestCanUploadBundles = v29
    };
    return v2.createElement(v5.Context.Provider, {
        value = v30
    }, v10.children);
end;
v8.AlwaysPassesProvider = function(v32) --[[ Line: 128 ]] --[[ Name: AlwaysPassesProvider ]]
    -- upvalues: v2 (copy), v31 (copy)
    return v2.createElement(v31, {
        waitForSignal = v32.waitForSignal, 
        canUploadBundlesAsync = v32.canUploadBundlesAsync, 
        createCachedResponse = function() --[[ Line: 137 ]] --[[ Name: createCachedResponse ]]
            return {
                completed = true, 
                ugcValidationResponse = {
                    errors = {}, 
                    pieces = {}
                }
            };
        end
    }, v32.children);
end;
v8.AlwaysFailsProvider = function(v33) --[[ Line: 149 ]] --[[ Name: AlwaysFailsProvider ]]
    -- upvalues: v2 (copy), v31 (copy)
    return v2.createElement(v31, {
        createCachedResponse = function() --[[ Line: 153 ]] --[[ Name: createCachedResponse ]]
            return {
                completed = true, 
                ugcValidationResponse = {
                    errors = {
                        {
                            assetType = Enum.AssetType.Head, 
                            error = {
                                type = "message", 
                                message = "Your brain gets smart, but your head gets dumb"
                            }
                        }, 
                        {
                            assetType = nil, 
                            error = {
                                type = "message", 
                                message = "Full body error"
                            }
                        }, 
                        {
                            assetType = Enum.AssetType.LeftArm, 
                            error = {
                                type = "notFound"
                            }
                        }
                    }, 
                    pieces = {}
                }
            };
        end
    }, v33.children);
end;
v8.NeverReturnsProvider = function(v34) --[[ Line: 189 ]] --[[ Name: NeverReturnsProvider ]]
    -- upvalues: v2 (copy), v31 (copy)
    return v2.createElement(v31, {
        createCachedResponse = function() --[[ Line: 193 ]] --[[ Name: createCachedResponse ]]
            return nil;
        end
    }, v34.children);
end;
v8.InProgressProvider = function(v35) --[[ Line: 199 ]] --[[ Name: InProgressProvider ]]
    -- upvalues: v2 (copy), v31 (copy)
    return v2.createElement(v31, {
        createCachedResponse = function() --[[ Line: 203 ]] --[[ Name: createCachedResponse ]]
            return {
                completed = false, 
                ugcValidationResponse = {
                    errors = {}, 
                    pieces = {}
                }
            };
        end
    }, v35.children);
end;
v8.InProgressErrorsProvider = function(v36) --[[ Line: 215 ]] --[[ Name: InProgressErrorsProvider ]]
    -- upvalues: v2 (copy), v31 (copy)
    return v2.createElement(v31, {
        createCachedResponse = function() --[[ Line: 219 ]] --[[ Name: createCachedResponse ]]
            return {
                completed = false, 
                ugcValidationResponse = {
                    errors = {
                        {
                            assetType = Enum.AssetType.Head, 
                            error = {
                                type = "message", 
                                message = "Your brain gets smart, but your head gets dumb"
                            }
                        }
                    }, 
                    pieces = {}
                }
            };
        end
    }, v36.children);
end;
return v8;