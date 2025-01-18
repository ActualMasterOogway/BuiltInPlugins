local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
local l_Flags_0 = l_Parent_0.Src.Flags;
local v5 = require(l_Flags_0.getFFlagMaterialActionAsTool);
return function(v6) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v2 (copy), l_HttpService_0 (copy), v5 (copy)
    local function _(v7, v8) --[[ Line: 16 ]] --[[ Name: _sendEvent ]]
        -- upvalues: v1 (ref), v6 (copy), v2 (ref), l_HttpService_0 (ref)
        local v9 = v8 or {};
        v9 = v1.Dictionary.join({
            studioSid = v6:GetSessionId(), 
            clientId = v6:GetClientId(), 
            placeId = game.PlaceId
        }, v9);
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("MaterialManager", tostring(v7), l_HttpService_0:JSONEncode(v9)));
        end;
        v6:SendEventDeferred("studio", "MaterialManager", v7, v9);
    end;
    local function _(v11, v12) --[[ Line: 38 ]] --[[ Name: _reportCounter ]]
        -- upvalues: v2 (ref), v6 (copy)
        v12 = v12 or 1;
        if v2.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring(v11), (tostring(v12))));
        end;
        v6:ReportCounter(v11, v12);
    end;
    local function v17(v14, v15, v16) --[[ Line: 52 ]] --[[ Name: _reportInfluxSeries ]]
        -- upvalues: v2 (ref), l_HttpService_0 (ref), v6 (copy)
        v15 = v15 or {};
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s throttlingPercent=%s"):format("MaterialManager", tostring(v14), l_HttpService_0:JSONEncode(v15), (tostring(v16))));
        end;
        v6:ReportInfluxSeries(v14, v15, v16);
    end;
    return {
        newMaterialVariant = function(_, v19, v20) --[[ Line: 70 ]] --[[ Name: newMaterialVariant ]]
            -- upvalues: v17 (copy)
            v17("BaseMaterialForVariant", v19, v20);
        end, 
        newMaterialVariantCounter = function() --[[ Line: 74 ]] --[[ Name: newMaterialVariantCounter ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v21 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("NewMaterialVariantCounter"), (tostring(v21))));
            end;
            v6:ReportCounter("NewMaterialVariantCounter", v21);
        end, 
        showInExplorer = function() --[[ Line: 78 ]] --[[ Name: showInExplorer ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v22 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ShowInExplorer"), (tostring(v22))));
            end;
            v6:ReportCounter("ShowInExplorer", v22);
        end, 
        clickOnCategoriesOpen = function() --[[ Line: 82 ]] --[[ Name: clickOnCategoriesOpen ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v23 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ClickOnCategoriesOpen"), (tostring(v23))));
            end;
            v6:ReportCounter("ClickOnCategoriesOpen", v23);
        end, 
        importTextureMap = function() --[[ Line: 86 ]] --[[ Name: importTextureMap ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v24 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ImportTextureMap"), (tostring(v24))));
            end;
            v6:ReportCounter("ImportTextureMap", v24);
        end, 
        uploadAssetIdTextureMap = function() --[[ Line: 90 ]] --[[ Name: uploadAssetIdTextureMap ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v25 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadAssetIdTextureMap"), (tostring(v25))));
            end;
            v6:ReportCounter("UploadAssetIdTextureMap", v25);
        end, 
        uploadTextureMapSuccess = function() --[[ Line: 94 ]] --[[ Name: uploadTextureMapSuccess ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v26 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadTextureMapSuccess"), (tostring(v26))));
            end;
            v6:ReportCounter("UploadTextureMapSuccess", v26);
        end, 
        deleteMaterialVariant = function() --[[ Line: 98 ]] --[[ Name: deleteMaterialVariant ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v27 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("DeleteMaterialVariant"), (tostring(v27))));
            end;
            v6:ReportCounter("DeleteMaterialVariant", v27);
        end, 
        applyToSelectionButton = function() --[[ Line: 102 ]] --[[ Name: applyToSelectionButton ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v28 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ApplyToSelectionButton"), (tostring(v28))));
            end;
            v6:ReportCounter("ApplyToSelectionButton", v28);
        end, 
        applyToSelectionAction = function() --[[ Line: 106 ]] --[[ Name: applyToSelectionAction ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v29 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ApplyToSelectionAction"), (tostring(v29))));
            end;
            v6:ReportCounter("ApplyToSelectionAction", v29);
        end, 
        materialAsTool = if v5() then nil else function() --[[ Line: 112 ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v30 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("MaterialAsTool"), (tostring(v30))));
            end;
            v6:ReportCounter("MaterialAsTool", v30);
        end, 
        setOverrideToggled = function() --[[ Line: 116 ]] --[[ Name: setOverrideToggled ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v31 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("SetOverrideToggled"), (tostring(v31))));
            end;
            v6:ReportCounter("SetOverrideToggled", v31);
        end, 
        searchBar = function() --[[ Line: 120 ]] --[[ Name: searchBar ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v32 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("SearchBar"), (tostring(v32))));
            end;
            v6:ReportCounter("SearchBar", v32);
        end, 
        importTextureMapError = function() --[[ Line: 124 ]] --[[ Name: importTextureMapError ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v33 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ImportTextureMapError"), (tostring(v33))));
            end;
            v6:ReportCounter("ImportTextureMapError", v33);
        end, 
        uploadFromURLTextureMapError = function() --[[ Line: 128 ]] --[[ Name: uploadFromURLTextureMapError ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v34 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadFromURLTextureMapError"), (tostring(v34))));
            end;
            v6:ReportCounter("UploadFromURLTextureMapError", v34);
        end, 
        uploadTextureMapFromFileError = function() --[[ Line: 132 ]] --[[ Name: uploadTextureMapFromFileError ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v35 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadTextureMapFromFileError"), (tostring(v35))));
            end;
            v6:ReportCounter("UploadTextureMapFromFileError", v35);
        end, 
        uploadTextureMapGeneralError = function() --[[ Line: 136 ]] --[[ Name: uploadTextureMapGeneralError ]]
            -- upvalues: v2 (ref), v6 (copy)
            local v36 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadTextureMapGeneralError"), (tostring(v36))));
            end;
            v6:ReportCounter("UploadTextureMapGeneralError", v36);
        end
    };
end;