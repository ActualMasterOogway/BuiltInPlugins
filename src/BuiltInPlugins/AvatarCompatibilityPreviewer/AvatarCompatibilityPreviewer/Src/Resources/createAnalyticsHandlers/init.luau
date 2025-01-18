local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local v5 = game:DefineFastInt("AvatarPreviewerInfluxSeriesThrottlingPercentage", 0);
local v6 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v7 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v8 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerSendTelemetryCounter);
local v9 = {
    eventName = "SBT_AvatarAutoSetupSucceeded", 
    lastUpdated = {
        2024, 
        11, 
        21
    }, 
    description = "Avatar auto setup succeeded.", 
    links = "https://grafana.rbx.com/d/ae0dljzicfs3kb?from=now-10d", 
    backends = {
        "RobloxTelemetryCounter"
    }
};
local v10 = {
    eventName = "SBT_AvatarPreviewerItemEquipped", 
    lastUpdated = {
        2024, 
        11, 
        21
    }, 
    description = "Avatar previewer equipped an avatar item for testing.", 
    links = "https://grafana.rbx.com/d/ae0dljzicfs3kb?from=now-10d", 
    backends = {
        "RobloxTelemetryCounter"
    }
};
local v11 = {
    eventName = "SBT_AvatarPreviewerPublished", 
    lastUpdated = {
        2024, 
        11, 
        21
    }, 
    description = "Avatar previewer published an asset to the marketplace.", 
    links = "https://grafana.rbx.com/d/ae0dljzicfs3kb?from=now-10d", 
    backends = {
        "RobloxTelemetryCounter"
    }
};
local function v13(v12) --[[ Line: 63 ]] --[[ Name: serializeItemDataForAnalytics ]]
    return {
        paletteKey = v12.palette.Key, 
        source = v12.item.source, 
        serializedValue = if v12.item.source == "builtin" then if v12.palette.Serializer then tostring(v12.palette.Serializer.serialize(v12.item.builtinItem)) else tostring(v12.item.builtinItem) else nil
    };
end;
return function(v14) --[[ Line: 75 ]] --[[ Name: createAnalyticsHandlers ]]
    -- upvalues: v3 (copy), v5 (copy), v7 (copy), v8 (copy), l_TelemetryService_0 (copy), v9 (copy), v13 (copy), v10 (copy), v6 (copy), v11 (copy), l_StudioService_0 (copy)
    local function v18(v15, v16) --[[ Line: 76 ]] --[[ Name: sendEvent ]]
        -- upvalues: v3 (ref), v14 (copy)
        local v17 = v3.join({
            studioSid = v14:GetSessionId(), 
            clientId = v14:GetClientId(), 
            placeId = game.PlaceId
        }, v16);
        v14:SendEventDeferred("studio", "AvatarCompatibilityPreviewer", v15, v17);
    end;
    local function _(v19, v20) --[[ Line: 86 ]] --[[ Name: reportCounter ]]
        -- upvalues: v14 (copy)
        v14:ReportCounter(v19, v20);
    end;
    local function _(v22, v23) --[[ Line: 90 ]] --[[ Name: reportStats ]]
        -- upvalues: v14 (copy)
        v14:ReportStats(v22, v23);
    end;
    local function _(v25, v26) --[[ Line: 94 ]] --[[ Name: reportInfluxSeries ]]
        -- upvalues: v14 (copy), v5 (ref)
        v14:ReportInfluxSeries(v25, v26, v5);
    end;
    return {
        addUserItems = function(_, v29, v30) --[[ Line: 99 ]] --[[ Name: addUserItems ]]
            -- upvalues: v18 (copy)
            v18("AddUserItems", {
                itemsSelected = v29, 
                itemsSucceeded = v30
            });
        end, 
        autoSetupFailure = function(_, v32, v33, v34) --[[ Line: 106 ]] --[[ Name: autoSetupFailure ]]
            -- upvalues: v18 (copy), v7 (ref)
            v18("AutoSetupFailure", {
                assetUrl = v33, 
                assetHash = if v7() then v34 else nil, 
                timeToComplete = v32
            });
        end, 
        autoSetupFinish = function(_, v36, v37, v38) --[[ Line: 114 ]] --[[ Name: autoSetupFinish ]]
            -- upvalues: v18 (copy), v7 (ref), v8 (ref), l_TelemetryService_0 (ref), v9 (ref)
            v18("AutoSetupFinish", {
                assetUrl = v37, 
                assetHash = if v7() then v38 else nil, 
                timeToComplete = v36
            });
            if v8() then
                l_TelemetryService_0:LogCounter(v9);
            end;
        end, 
        autoSetupAssetsGenerated = function(_, v40, v41) --[[ Line: 126 ]] --[[ Name: autoSetupAssetsGenerated ]]
            -- upvalues: v18 (copy)
            v18("AutoSetupAssetsGenerated", {
                inputAssetId = v40, 
                outputAssetIds = table.concat(v41, ",")
            });
        end, 
        bundlesMetadataError = function(_, v43) --[[ Line: 133 ]] --[[ Name: bundlesMetadataError ]]
            -- upvalues: v18 (copy)
            v18("BundlesMetadataError", {
                problem = v43
            });
        end, 
        changedLayers = function() --[[ Line: 139 ]] --[[ Name: changedLayers ]]
            -- upvalues: v18 (copy)
            v18("ChangedLayers");
        end, 
        equipItem = function(_, v45) --[[ Line: 143 ]] --[[ Name: equipItem ]]
            -- upvalues: v18 (copy), v13 (ref), v8 (ref), l_TelemetryService_0 (ref), v10 (ref)
            v18("EquipItem", (v13(v45)));
            if v8() then
                l_TelemetryService_0:LogCounter(v10);
            end;
        end, 
        openPalette = function(_, v47) --[[ Line: 151 ]] --[[ Name: openPalette ]]
            -- upvalues: v18 (copy)
            v18("PaletteOpen", {
                paletteKey = v47
            });
        end, 
        openPlugin = function() --[[ Line: 157 ]] --[[ Name: openPlugin ]]
            -- upvalues: v18 (copy)
            v18("PluginOpen");
        end, 
        openTab = function(_, v49) --[[ Line: 161 ]] --[[ Name: openTab ]]
            -- upvalues: v18 (copy)
            v18("TabOpen", {
                tabKey = v49
            });
        end, 
        publish = function(_, v51) --[[ Line: 167 ]] --[[ Name: publish ]]
            -- upvalues: v6 (ref), v18 (copy), v8 (ref), l_TelemetryService_0 (ref), v11 (ref)
            if v6() then
                v18("Publish", {
                    isAutoSetupped = v51
                });
            else
                v18("Publish");
            end;
            if v8() then
                l_TelemetryService_0:LogCounter(v11);
            end;
        end, 
        selectScreenChoice = function(_, v53) --[[ Line: 181 ]] --[[ Name: selectScreenChoice ]]
            -- upvalues: v18 (copy)
            v18("SelectScreenChoice", {
                choice = v53
            });
        end, 
        sendAutoSetupSurvey = function(_, v55, v56, v57) --[[ Line: 187 ]] --[[ Name: sendAutoSetupSurvey ]]
            -- upvalues: v18 (copy), l_StudioService_0 (ref), v3 (ref)
            v18("AutoSetupSurvey", {
                userId = l_StudioService_0:GetUserId(), 
                rating = v55.rating, 
                message = v55.message, 
                problems = table.concat(v3.keys(v55.problems), ","), 
                inputAssetId = v57, 
                outputAssetIds = table.concat(v56, ",")
            });
        end, 
        setStage = function(_, v59) --[[ Line: 203 ]] --[[ Name: setStage ]]
            -- upvalues: v18 (copy)
            v18("SetStage", {
                stageKey = v59
            });
        end, 
        testInExperience = function() --[[ Line: 209 ]] --[[ Name: testInExperience ]]
            -- upvalues: v18 (copy)
            v18("TestInExperience");
        end, 
        unequipItem = function(_, v61) --[[ Line: 213 ]] --[[ Name: unequipItem ]]
            -- upvalues: v18 (copy), v13 (ref)
            v18("UnequipItem", (v13(v61)));
        end, 
        autoSetupPassedValidation = function() --[[ Line: 217 ]] --[[ Name: autoSetupPassedValidation ]]
            -- upvalues: v14 (copy)
            v14:ReportCounter("AutoSetupPassedValidation", nil);
        end, 
        autoSetupFailedValidation = function() --[[ Line: 221 ]] --[[ Name: autoSetupFailedValidation ]]
            -- upvalues: v14 (copy)
            v14:ReportCounter("AutoSetupFailedValidation", nil);
        end, 
        autoSetupValidationDuration = function(_, v63) --[[ Line: 225 ]] --[[ Name: autoSetupValidationDuration ]]
            -- upvalues: v14 (copy)
            v14:ReportStats("AutoSetupValidationDuration", v63);
        end, 
        autoSetupValidationErrorCount = function(_, v65) --[[ Line: 229 ]] --[[ Name: autoSetupValidationErrorCount ]]
            -- upvalues: v14 (copy)
            v14:ReportStats("AutoSetupValidationErrorCount", v65);
        end, 
        autoSetupValidationError = function(_, v67, v68) --[[ Line: 233 ]] --[[ Name: autoSetupValidationError ]]
            -- upvalues: v14 (copy), v5 (ref)
            local v69 = {
                inputAssetId = v67, 
                errorText = v68
            };
            v14:ReportInfluxSeries("AutoSetupValidationError", v69, v5);
        end
    };
end;