local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        __networking = v3
    }, v2));
end;
v2.localeSupportedLocalesGET = function(v4) --[[ Line: 14 ]] --[[ Name: localeSupportedLocalesGET ]]
    return v4.__networking:get("locale", "/v1/locales/supported-locales");
end;
v2.localeLocalesGET = function(v5, v6) --[[ Line: 19 ]] --[[ Name: localeLocalesGET ]]
    return v5.__networking:get("locale", "/v1/locales", {
        Params = {
            displayValueLocale = v6
        }
    });
end;
v2.gameinternationalizationSourceLanguageGamesGET = function(v7, v8) --[[ Line: 28 ]] --[[ Name: gameinternationalizationSourceLanguageGamesGET ]]
    return v7.__networking:get("gameinternationalization", "/v1/source-language/games/" .. v8);
end;
v2.gameinternationalizationSourceLanguageGamesPATCH = function(v9, v10, v11) --[[ Line: 33 ]] --[[ Name: gameinternationalizationSourceLanguageGamesPATCH ]]
    return v9.__networking:patch("gameinternationalization", "/v1/source-language/games/" .. v10, {
        Params = {
            languageCode = v11
        }
    });
end;
v2.localizationtablesAutoLocalizationGamesAutoLocalizationTablePOST = function(v12, v13) --[[ Line: 42 ]] --[[ Name: localizationtablesAutoLocalizationGamesAutoLocalizationTablePOST ]]
    return v12.__networking:post("localizationtables", "/v1/autolocalization/games/" .. v13 .. "/autolocalizationtable", {
        Body = {}
    });
end;
v2.gameinternationalizationAutoLocalizationGamesAutoLocalizationTablePOST = function(v14, v15) --[[ Line: 49 ]] --[[ Name: gameinternationalizationAutoLocalizationGamesAutoLocalizationTablePOST ]]
    return v14.__networking:post("gameinternationalization", "/v1/autolocalization/games/" .. v15 .. "/autolocalizationtable", {
        Body = {}
    });
end;
v2.gameinternationalizationAutoLocalizationGamesSettingsPATCH = function(v16, v17, v18, v19) --[[ Line: 60 ]] --[[ Name: gameinternationalizationAutoLocalizationGamesSettingsPATCH ]]
    return v16.__networking:patch("gameinternationalization", "/v1/autolocalization/games/" .. v17 .. "/settings", {
        Body = {
            isAutolocalizationEnabled = v18, 
            shouldUseLocalizationTable = v19
        }
    });
end;
v2.localizationtablesAutoLocalizationGamesSettingsPATCH = function(v20, v21, v22, v23, v24) --[[ Line: 74 ]] --[[ Name: localizationtablesAutoLocalizationGamesSettingsPATCH ]]
    return v20.__networking:patch("localizationtables", "/v1/autolocalization/games/" .. v21 .. "/settings", {
        Body = {
            shouldUseLocalizationTable = v24, 
            isAutomaticEntriesSettingEnabled = v22, 
            isAutomaticEntriesDeletionsEnabled = v23
        }
    });
end;
v2.gameinternationalizationAutomaticTranslationGamesFeatureStatusGET = function(v25, v26) --[[ Line: 90 ]] --[[ Name: gameinternationalizationAutomaticTranslationGamesFeatureStatusGET ]]
    return v25.__networking:get("gameinternationalization", "/v1/automatic-translation/games/" .. v26 .. "/feature-status");
end;
v2.gameinternationalizationAutomaticTranslationLanguagesTargetLanguagesGET = function(v27, v28) --[[ Line: 95 ]] --[[ Name: gameinternationalizationAutomaticTranslationLanguagesTargetLanguagesGET ]]
    return v27.__networking:get("gameinternationalization", "/v1/automatic-translation/languages/" .. v28 .. "/target-languages");
end;
v2.gameinternationalizationSupportedLanguagesGamesAutomaticTranslationStatusGET = function(v29, v30) --[[ Line: 105 ]] --[[ Name: gameinternationalizationSupportedLanguagesGamesAutomaticTranslationStatusGET ]]
    return v29.__networking:get("gameinternationalization", "/v1/supported-languages/games/" .. v30 .. "/automatic-translation-status");
end;
v2.gameinternationalizationSupportedLanguagesGamesPATCH = function(v31, v32, v33) --[[ Line: 113 ]] --[[ Name: gameinternationalizationSupportedLanguagesGamesPATCH ]]
    return v31.__networking:patch("gameinternationalization", "/v1/supported-languages/games/" .. v32, {
        Body = v33
    });
end;
v2.gameinternationalizationSupportedLanguagesGamesLanguagesAutomaticTranslationStatusPATCH = function(v34, v35, v36) --[[ Line: 120 ]] --[[ Name: gameinternationalizationSupportedLanguagesGamesLanguagesAutomaticTranslationStatusPATCH ]]
    local l___networking_0 = v34.__networking;
    local v38 = {};
    for v39, v40 in pairs(v36) do
        table.insert(v38, (l___networking_0:patch("gameinternationalization", "/v1/supported-languages/games/" .. v35 .. "/languages/" .. v39 .. "/automatic-translation-status", {
            Body = v40
        })));
    end;
    return v38;
end;
v2.getSupportedLanguages = function(v41) --[[ Line: 143 ]] --[[ Name: getSupportedLanguages ]]
    local v42 = v41:localeSupportedLocalesGET():await();
    local v43 = {};
    local l_responseBody_0 = v42.responseBody;
    for _, v46 in pairs(l_responseBody_0.supportedLocales) do
        v43[v46.language.languageCode] = v46.language.nativeName;
    end;
    return v43;
end;
v2.getLanguageCodeToNames = function(v47, v48) --[[ Line: 154 ]] --[[ Name: getLanguageCodeToNames ]]
    local v49 = v47:localeLocalesGET(v48):await();
    local v50 = {};
    for _, v52 in pairs(v49.responseBody.data) do
        local l_languageCode_0 = v52.locale.language.languageCode;
        if v50[l_languageCode_0] == nil then
            v50[l_languageCode_0] = v52.locale.language.name;
        end;
    end;
    return v50;
end;
v2.getSourceLanguage = function(v54, v55) --[[ Line: 167 ]] --[[ Name: getSourceLanguage ]]
    return v54:gameinternationalizationSourceLanguageGamesGET(v55):await().responseBody.languageCode;
end;
v2.setSourceLanguage = function(v56, v57, v58) --[[ Line: 173 ]] --[[ Name: setSourceLanguage ]]
    v56:gameinternationalizationSourceLanguageGamesPATCH(v57, v58):await();
end;
v2.getAutoLocalizationSettings = function(v59, v60) --[[ Line: 177 ]] --[[ Name: getAutoLocalizationSettings ]]
    local l_responseBody_1 = v59:localizationtablesAutoLocalizationGamesAutoLocalizationTablePOST(v60):await().responseBody;
    return l_responseBody_1.isAutomaticEntriesSettingEnabled, l_responseBody_1.isAutomaticEntriesDeletionEnabled, l_responseBody_1.shouldUseLocalizationTable;
end;
v2.getAutoLocalizationSettings_Deprecated = function(v62, v63) --[[ Line: 186 ]] --[[ Name: getAutoLocalizationSettings_Deprecated ]]
    local l_responseBody_2 = v62:gameinternationalizationAutoLocalizationGamesAutoLocalizationTablePOST(v63):await().responseBody;
    return l_responseBody_2.isAutolocalizationEnabled, l_responseBody_2.shouldUseLocalizationTable;
end;
v2.setAutoLocalizationSettings = function(v65, v66, v67, v68, v69) --[[ Line: 193 ]] --[[ Name: setAutoLocalizationSettings ]]
    v65:localizationtablesAutoLocalizationGamesSettingsPATCH(v66, v67, v68, v69):await();
end;
v2.setAutoLocalizationSettings_Deprecated = function(v70, v71, v72, v73) --[[ Line: 207 ]] --[[ Name: setAutoLocalizationSettings_Deprecated ]]
    v70:gameinternationalizationAutoLocalizationGamesSettingsPATCH(v71, v72, v73):await();
end;
v2.getAutoTranslationFeatureStatus = function(v74, v75) --[[ Line: 219 ]] --[[ Name: getAutoTranslationFeatureStatus ]]
    return v74:gameinternationalizationAutomaticTranslationGamesFeatureStatusGET(v75):await().responseBody.isAutomaticTranslationAllowed;
end;
v2.getAutoTranslationTargetLanguages = function(v76, v77) --[[ Line: 225 ]] --[[ Name: getAutoTranslationTargetLanguages ]]
    if not v77 then
        return {};
    else
        local v78 = v76:gameinternationalizationAutomaticTranslationLanguagesTargetLanguagesGET(v77):await();
        local v79 = {};
        for _, v81 in pairs(v78.responseBody.targetLanguages) do
            v79[v81.languageCode] = v81.isAutomaticTranslationAllowed;
        end;
        return v79;
    end;
end;
v2.getAutoTranslationSetings = function(v82, v83) --[[ Line: 240 ]] --[[ Name: getAutoTranslationSetings ]]
    local v84 = v82:gameinternationalizationSupportedLanguagesGamesAutomaticTranslationStatusGET(v83):await();
    local v85 = {};
    for _, v87 in pairs(v84.responseBody.data) do
        v85[v87.languageCode] = v87.isAutomaticTranslationEnabled;
    end;
    return v85;
end;
v2.setAutoTranslationSetings = function(v88, v89, v90) --[[ Line: 250 ]] --[[ Name: setAutoTranslationSetings ]]
    -- upvalues: l_Promise_0 (copy)
    local v91 = {};
    for v92, v93 in pairs(v90) do
        if v93 then
            table.insert(v91, {
                languageCodeType = "Language", 
                languageCode = v92, 
                delete = false
            });
        end;
    end;
    v88:gameinternationalizationSupportedLanguagesGamesPATCH(v89, v91):await();
    local v94 = v88:gameinternationalizationSupportedLanguagesGamesLanguagesAutomaticTranslationStatusPATCH(v89, v90);
    l_Promise_0.all(v94):await();
end;
return v2;