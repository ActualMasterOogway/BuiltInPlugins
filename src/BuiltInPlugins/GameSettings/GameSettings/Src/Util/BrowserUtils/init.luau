local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Src.Networking.Http);
local v5 = require(l_Parent_0.Src.Util.Analytics);
local v8 = {
    BuildWatchUrl = function(v6) --[[ Line: 35 ]] --[[ Name: BuildWatchUrl ]]
        return "https://" .. "www.youtube.com" .. string.format("/watch?v=%s", v6);
    end, 
    BuildPlaceSettingsUrl = function(v7) --[[ Line: 39 ]] --[[ Name: BuildPlaceSettingsUrl ]]
        -- upvalues: v4 (copy)
        return v4.BuildRobloxUrl("www", "places/%d/update#", v7);
    end
};
v8.OpenVideo = function(v9) --[[ Line: 43 ]] --[[ Name: OpenVideo ]]
    -- upvalues: v8 (copy), l_GuiService_0 (copy)
    local v10 = v8.BuildWatchUrl(v9);
    l_GuiService_0:OpenBrowserWindow(v10);
end;
v8.OpenPlaceSettings = function(v11) --[[ Line: 48 ]] --[[ Name: OpenPlaceSettings ]]
    -- upvalues: v8 (copy), l_GuiService_0 (copy)
    local v12 = v8.BuildPlaceSettingsUrl(v11);
    l_GuiService_0:OpenBrowserWindow(v12);
end;
v8.OpenLocalizationSettings = function(v13) --[[ Line: 53 ]] --[[ Name: OpenLocalizationSettings ]]
    -- upvalues: v4 (copy), l_GuiService_0 (copy)
    return function() --[[ Line: 54 ]]
        -- upvalues: v4 (ref), v13 (copy), l_GuiService_0 (ref)
        local v14 = v4.BuildRobloxUrl("www", "localization/games/%d/configure", v13);
        l_GuiService_0:OpenBrowserWindow(v14);
    end;
end;
getAdditionalArgs = function() --[[ Line: 62 ]] --[[ Name: getAdditionalArgs ]]
    -- upvalues: l_StudioService_0 (copy)
    return {
        userId = l_StudioService_0:GetUserId(), 
        machineTimeStamp = os.time()
    };
end;
v8.OpenExperienceGuidelines = function() --[[ Line: 70 ]] --[[ Name: OpenExperienceGuidelines ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy), v5 (copy), v4 (copy), l_GuiService_0 (copy)
    assert(l_GameSettingsExperienceGuidelines_0);
    return function() --[[ Line: 72 ]]
        -- upvalues: v5 (ref), v4 (ref), l_GuiService_0 (ref)
        v5.sendEventDeferred("click_learn_more", getAdditionalArgs());
        local v15 = v4.BuildRobloxUrl("create", "docs/production/promotion/experience-guidelines");
        l_GuiService_0:OpenBrowserWindow(v15);
    end;
end;
v8.OpenExperienceQuestionnaire = function(v16) --[[ Line: 80 ]] --[[ Name: OpenExperienceQuestionnaire ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy), v5 (copy), v4 (copy), l_GuiService_0 (copy)
    assert(l_GameSettingsExperienceGuidelines_0);
    return function() --[[ Line: 82 ]]
        -- upvalues: v5 (ref), v4 (ref), v16 (copy), l_GuiService_0 (ref)
        v5.sendEventDeferred("click_experience_questionnaire", getAdditionalArgs());
        local v17 = v4.BuildRobloxUrl("create", "dashboard/creations/experiences/%d/experience-questionnaire", v16);
        l_GuiService_0:OpenBrowserWindow(v17);
    end;
end;
v8.OpenExperienceSettings = function(v18) --[[ Line: 90 ]] --[[ Name: OpenExperienceSettings ]]
    -- upvalues: v4 (copy), l_GuiService_0 (copy)
    return function() --[[ Line: 91 ]]
        -- upvalues: v4 (ref), v18 (copy), l_GuiService_0 (ref)
        local v19 = v4.BuildRobloxUrl("create", "dashboard/creations/experiences/%d/configure", v18);
        l_GuiService_0:OpenBrowserWindow(v19);
    end;
end;
return v8;