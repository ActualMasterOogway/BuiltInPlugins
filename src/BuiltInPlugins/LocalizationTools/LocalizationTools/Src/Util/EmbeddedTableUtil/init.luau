local l_LocalizationService_0 = game:GetService("LocalizationService");
local v1 = {};
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLocalizedLocalizationToolsErrorsApi");
local v3 = nil;
if l_game_EngineFeature_0 then
    v3 = require(script.Parent.MapEngineErrors);
end;
v1.toggleTextScraperEnabled = function(v4) --[[ Line: 16 ]] --[[ Name: toggleTextScraperEnabled ]]
    -- upvalues: l_LocalizationService_0 (copy)
    if not l_LocalizationService_0.IsTextScraperRunning then
        l_LocalizationService_0:StartTextScraper();
        v4:reportButtonPress("textCapture", "start");
        return;
    else
        l_LocalizationService_0:StopTextScraper();
        v4:reportButtonPress("textCapture", "stop");
        return;
    end;
end;
v1.promptExportToCSVs = function(v5) --[[ Line: 26 ]] --[[ Name: promptExportToCSVs ]]
    -- upvalues: l_LocalizationService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
        -- upvalues: l_LocalizationService_0 (ref)
        return l_LocalizationService_0:PromptExportToCSVs();
    end);
    if l_status_0 then
        v5:reportButtonPress("export", "success");
        return;
    elseif l_result_0 == "No file selected" then
        v5:reportButtonPress("export", "canceled");
        return;
    else
        v5:reportButtonPress("export", "error");
        return;
    end;
end;
v1.promptImportFromCSVs_deprecated = function(v8) --[[ Line: 41 ]] --[[ Name: promptImportFromCSVs_deprecated ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_LocalizationService_0 (copy)
    assert(not l_game_EngineFeature_0, "expected FFlagLocalizedLocalizationToolsErrors to be false");
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 43 ]]
        -- upvalues: l_LocalizationService_0 (ref)
        return l_LocalizationService_0:PromptImportFromCSVs();
    end);
    if l_status_1 then
        v8:reportButtonPress("import", "success");
        return;
    elseif l_result_1 == "No file selected" then
        v8:reportButtonPress("import", "canceled");
        return;
    else
        v8:reportButtonPress("import", "error");
        return;
    end;
end;
v1.promptImportFromCSVs = function(v11, v12) --[[ Line: 57 ]] --[[ Name: promptImportFromCSVs ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_LocalizationService_0 (copy), v3 (ref)
    assert(l_game_EngineFeature_0, "expected FFlagLocalizedLocalizationToolsErrors to be true");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 59 ]]
        -- upvalues: l_LocalizationService_0 (ref)
        return l_LocalizationService_0:PromptImportFromCSVs();
    end);
    if l_status_2 then
        v11:reportButtonPress("import", "success");
        return;
    elseif l_result_2 == "No file selected" then
        v11:reportButtonPress("import", "canceled");
        return;
    else
        warn(v3.getTranslationForEngineError(l_result_2, v12));
        v11:reportButtonPress("import", "error");
        return;
    end;
end;
return v1;