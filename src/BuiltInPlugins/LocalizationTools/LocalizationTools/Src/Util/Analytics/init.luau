local l_HttpService_0 = game:GetService("HttpService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Src.Util.RbxEntriesToWebEntries);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_StudioService_0 (copy), v6 (copy)
    local v9 = {
        sender = v7 or l_RbxAnalyticsService_0, 
        context = "localizationPlugin", 
        target = "studio", 
        userId = l_StudioService_0:GetUserId(), 
        logEvents = v8
    };
    setmetatable(v9, v6);
    return v9;
end;
v6.logEvent = function(v10, v11, v12) --[[ Line: 29 ]] --[[ Name: logEvent ]]
    -- upvalues: l_HttpService_0 (copy)
    if v10.logEvents then
        local v13 = l_HttpService_0:JSONEncode(v12);
        print(string.format("Analytics: sendEventDeferred: \"%s\", %s", v11, v13));
    end;
end;
v6.sendEventDeferred = function(v14, v15, v16) --[[ Line: 36 ]] --[[ Name: sendEventDeferred ]]
    -- upvalues: v4 (copy)
    local v17 = v4.Dictionary.join(v16, {
        uid = v14.userId, 
        gameId = game.GameId, 
        placeId = game.PlaceId
    });
    v14.sender:SendEventDeferred(v14.target, v14.context, v15, v17);
    v14:logEvent(v15, v17);
end;
v6.reportButtonPress = function(v18, v19, v20) --[[ Line: 46 ]] --[[ Name: reportButtonPress ]]
    v18:sendEventDeferred("buttonPressed", {
        btnName = v19, 
        status = v20
    });
end;
v6.reportToolOpened = function(v21, v22) --[[ Line: 56 ]] --[[ Name: reportToolOpened ]]
    v21:sendEventDeferred("toolOpened", {
        method = v22
    });
end;
v6.reportUploadPatch = function(v23, v24, v25) --[[ Line: 65 ]] --[[ Name: reportUploadPatch ]]
    v23:sendEventDeferred("logLocalizationPerfStats", {
        btnName = v25, 
        totalRows = v24.totalRows, 
        totalTranslations = v24.totalTranslations, 
        supportedLocales = v24.supportedLocales, 
        unsupportedLocales = v24.unsupportedLocales, 
        numChangedTranslations = v24.numChangedTranslations, 
        numRemovedTranslations = v24.numRemovedTranslations, 
        numAddedTranslations = v24.numAddedTranslations, 
        addedSupportedLanguages = v24.newLanguages
    });
end;
v6.reportDownloadTable = function(v26, v27, v28, v29, v30) --[[ Line: 83 ]] --[[ Name: reportDownloadTable ]]
    -- upvalues: v5 (copy)
    local v31 = v5(v27:GetEntries(), v29, v30);
    v26:sendEventDeferred("logLocalizationPerfStats", {
        btnName = v28, 
        totalRows = v31.totalRows, 
        totalTranslations = v31.totalTranslations, 
        supportedLocales = v31.supportedLocales, 
        unsupportedLocales = v31.unsupportedLocales
    });
end;
v6.reportUploadTable = function(v32, v33, v34) --[[ Line: 99 ]] --[[ Name: reportUploadTable ]]
    v32:sendEventDeferred("logLocalizationPerfStats", {
        btnName = v34, 
        totalRows = v33.totalRows, 
        totalTranslations = v33.totalTranslations, 
        supportedLocales = v33.supportedLocales, 
        unsupportedLocales = v33.unsupportedLocales, 
        numChangedTranslations = v33.numChangedTranslations, 
        numRemovedTranslations = v33.numRemovedTranslations, 
        numAddedTranslations = v33.numAddedTranslations, 
        addedSupportedLanguages = v33.newLanguages
    });
end;
v6.mock = function() --[[ Line: 116 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy)
    local v35 = {
        SendEventDeferred = function() --[[ Line: 118 ]] --[[ Name: SendEventDeferred ]]

        end
    };
    return v6.new(v35);
end;
return v6;