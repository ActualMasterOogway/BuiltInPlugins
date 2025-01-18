local l_Parent_0 = script.Parent.Parent.Parent;
local l_Http_0 = require(l_Parent_0.Packages.Framework).Http;
local v2 = require(l_Parent_0.Src.Actions.LoadLanguagesAndLocalesInfo);
local v3 = require(l_Parent_0.Src.Actions.LoadManageTranslationPermission);
local v4 = require(l_Parent_0.Src.Actions.SetCloudTableId);
local v5 = game:DefineFastFlag("StudioPlat37699UnmoveCreatorInventoryItems", false);
local v6 = {
    owner = true, 
    collaborator = true, 
    translator = true
};
local _ = function(v7, v8) --[[ Line: 21 ]] --[[ Name: getLanguagesAndLocalesInfo ]]
    -- upvalues: v2 (copy)
    return function(v9) --[[ Line: 22 ]]
        -- upvalues: v7 (copy), v2 (ref), v8 (copy)
        v7.Locale.V1.locales():makeRequest():andThen(function(v10) --[[ Line: 24 ]]
            -- upvalues: v9 (copy), v2 (ref)
            local v11 = {};
            local v12 = {};
            for _, v14 in ipairs(v10.responseBody.data) do
                if v14.isEnabledForInGameUgc then
                    v11[v14.locale.language.languageCode] = true;
                end;
            end;
            v12["zh-cjv"] = "zh-hans";
            v9:dispatch(v2(v11, v12));
        end, function() --[[ Line: 35 ]]
            -- upvalues: v8 (ref)
            warn(v8:getText("PluginMetadata", "GetAllLocalesFailed"));
        end);
    end;
end;
local function v23(v16, v17) --[[ Line: 41 ]] --[[ Name: getManageTranslationPermission ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy)
    return function(v18) --[[ Line: 42 ]]
        -- upvalues: v5 (ref), v16 (copy), v3 (ref), v6 (ref), v17 (copy)
        local v19 = nil;
        v19 = if v5 then v16.TranslationRoles.V1.GameLocalizationRoles.Games.CurrentUser.roles(game.GameId) else v16.API.Loc.TranslationRoles(game.GameId);
        v18:dispatch(v3(false));
        return v19:makeRequest():andThen(function(v20) --[[ Line: 54 ]]
            -- upvalues: v6 (ref), v18 (copy), v3 (ref)
            for _, v22 in ipairs(v20.responseBody.data) do
                if v6[v22] then
                    v18:dispatch(v3(true));
                    return true;
                end;
            end;
            return false;
        end, function() --[[ Line: 62 ]]
            -- upvalues: v17 (ref)
            warn(v17:getText("PluginMetadata", "GetPermissionFailedMessage"));
            return false;
        end):await();
    end;
end;
local function _(v24, v25) --[[ Line: 70 ]] --[[ Name: getOrCreateCloudTable ]]
    -- upvalues: l_Http_0 (copy), v4 (copy)
    return function(v26) --[[ Line: 71 ]]
        -- upvalues: v24 (copy), l_Http_0 (ref), v4 (ref), v25 (copy)
        v24.GameInternationalization.V1.AutoLocalization.games(game.GameId):makeRequest():andThen(function(v27) --[[ Line: 73 ]]
            -- upvalues: l_Http_0 (ref), v26 (copy), v4 (ref), v25 (ref)
            if v27 and v27.responseCode == l_Http_0.StatusCodes.OK then
                v26:dispatch(v4(v27.responseBody.autoLocalizationTableId));
                return;
            else
                warn(v25:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                return;
            end;
        end, function() --[[ Line: 79 ]]
            -- upvalues: v25 (ref)
            warn(v25:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
        end);
    end;
end;
return {
    GetAll = function(v29, v30) --[[ Line: 97 ]] --[[ Name: getAll ]]
        -- upvalues: v2 (copy), v5 (copy), v3 (copy), v6 (copy), l_Http_0 (copy), v4 (copy)
        return function(v31) --[[ Line: 98 ]]
            -- upvalues: v29 (copy), v30 (copy), v2 (ref), v5 (ref), v3 (ref), v6 (ref), l_Http_0 (ref), v4 (ref)
            local l_v29_0 = v29;
            local l_v30_0 = v30;
            local l_l_v29_0_0 = l_v29_0 --[[ copy: 4 -> 6 ]];
            local l_l_v30_0_0 = l_v30_0 --[[ copy: 5 -> 7 ]];
            v31:dispatch(function(v36) --[[ Line: 22 ]]
                -- upvalues: l_l_v29_0_0 (copy), v2 (ref), l_l_v30_0_0 (copy)
                l_l_v29_0_0.Locale.V1.locales():makeRequest():andThen(function(v37) --[[ Line: 24 ]]
                    -- upvalues: v36 (copy), v2 (ref)
                    local v38 = {};
                    local v39 = {};
                    for _, v41 in ipairs(v37.responseBody.data) do
                        if v41.isEnabledForInGameUgc then
                            v38[v41.locale.language.languageCode] = true;
                        end;
                    end;
                    v39["zh-cjv"] = "zh-hans";
                    v36:dispatch(v2(v38, v39));
                end, function() --[[ Line: 35 ]]
                    -- upvalues: l_l_v30_0_0 (ref)
                    warn(l_l_v30_0_0:getText("PluginMetadata", "GetAllLocalesFailed"));
                end);
            end);
            if game.GameId ~= 0 then
                l_v29_0 = v29;
                l_v30_0 = v30;
                local l_l_v29_0_1 = l_v29_0 --[[ copy: 4 -> 8 ]];
                local l_l_v30_0_1 = l_v30_0 --[[ copy: 5 -> 9 ]];
                v31:dispatch(function(v44) --[[ Line: 42 ]]
                    -- upvalues: v5 (ref), l_l_v29_0_1 (copy), v3 (ref), v6 (ref), l_l_v30_0_1 (copy)
                    local v45 = nil;
                    v45 = if v5 then l_l_v29_0_1.TranslationRoles.V1.GameLocalizationRoles.Games.CurrentUser.roles(game.GameId) else l_l_v29_0_1.API.Loc.TranslationRoles(game.GameId);
                    v44:dispatch(v3(false));
                    return v45:makeRequest():andThen(function(v46) --[[ Line: 54 ]]
                        -- upvalues: v6 (ref), v44 (copy), v3 (ref)
                        for _, v48 in ipairs(v46.responseBody.data) do
                            if v6[v48] then
                                v44:dispatch(v3(true));
                                return true;
                            end;
                        end;
                        return false;
                    end, function() --[[ Line: 62 ]]
                        -- upvalues: l_l_v30_0_1 (ref)
                        warn(l_l_v30_0_1:getText("PluginMetadata", "GetPermissionFailedMessage"));
                        return false;
                    end):await();
                end);
                l_v29_0 = v29;
                l_v30_0 = v30;
                v31:dispatch(function(v49) --[[ Line: 71 ]]
                    -- upvalues: l_v29_0 (copy), l_Http_0 (ref), v4 (ref), l_v30_0 (copy)
                    l_v29_0.GameInternationalization.V1.AutoLocalization.games(game.GameId):makeRequest():andThen(function(v50) --[[ Line: 73 ]]
                        -- upvalues: l_Http_0 (ref), v49 (copy), v4 (ref), l_v30_0 (ref)
                        if v50 and v50.responseCode == l_Http_0.StatusCodes.OK then
                            v49:dispatch(v4(v50.responseBody.autoLocalizationTableId));
                            return;
                        else
                            warn(l_v30_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                            return;
                        end;
                    end, function() --[[ Line: 79 ]]
                        -- upvalues: l_v30_0 (ref)
                        warn(l_v30_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                    end);
                end);
            end;
        end;
    end, 
    OnGameIdChanged = function(v51, v52) --[[ Line: 85 ]] --[[ Name: onGameIdChanged ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), l_Http_0 (copy)
        return function(v53) --[[ Line: 86 ]]
            -- upvalues: v3 (ref), v4 (ref), v51 (copy), v52 (copy), v5 (ref), v6 (ref), l_Http_0 (ref)
            if game.GameId == 0 then
                v53:dispatch(v3(false));
                v53:dispatch(v4(""));
                return;
            else
                local l_v51_0 = v51;
                local l_v52_0 = v52;
                local l_l_v51_0_0 = l_v51_0 --[[ copy: 4 -> 6 ]];
                local l_l_v52_0_0 = l_v52_0 --[[ copy: 5 -> 7 ]];
                v53:dispatch(function(v58) --[[ Line: 42 ]]
                    -- upvalues: v5 (ref), l_l_v51_0_0 (copy), v3 (ref), v6 (ref), l_l_v52_0_0 (copy)
                    local v59 = nil;
                    v59 = if v5 then l_l_v51_0_0.TranslationRoles.V1.GameLocalizationRoles.Games.CurrentUser.roles(game.GameId) else l_l_v51_0_0.API.Loc.TranslationRoles(game.GameId);
                    v58:dispatch(v3(false));
                    return v59:makeRequest():andThen(function(v60) --[[ Line: 54 ]]
                        -- upvalues: v6 (ref), v58 (copy), v3 (ref)
                        for _, v62 in ipairs(v60.responseBody.data) do
                            if v6[v62] then
                                v58:dispatch(v3(true));
                                return true;
                            end;
                        end;
                        return false;
                    end, function() --[[ Line: 62 ]]
                        -- upvalues: l_l_v52_0_0 (ref)
                        warn(l_l_v52_0_0:getText("PluginMetadata", "GetPermissionFailedMessage"));
                        return false;
                    end):await();
                end);
                l_v51_0 = v51;
                l_v52_0 = v52;
                v53:dispatch(function(v63) --[[ Line: 71 ]]
                    -- upvalues: l_v51_0 (copy), l_Http_0 (ref), v4 (ref), l_v52_0 (copy)
                    l_v51_0.GameInternationalization.V1.AutoLocalization.games(game.GameId):makeRequest():andThen(function(v64) --[[ Line: 73 ]]
                        -- upvalues: l_Http_0 (ref), v63 (copy), v4 (ref), l_v52_0 (ref)
                        if v64 and v64.responseCode == l_Http_0.StatusCodes.OK then
                            v63:dispatch(v4(v64.responseBody.autoLocalizationTableId));
                            return;
                        else
                            warn(l_v52_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                            return;
                        end;
                    end, function() --[[ Line: 79 ]]
                        -- upvalues: l_v52_0 (ref)
                        warn(l_v52_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                    end);
                end);
                return;
            end;
        end;
    end, 
    GetManageTranslationPermission = v23
};