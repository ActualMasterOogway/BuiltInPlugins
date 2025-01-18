local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_TranslateGameModeratedErrors_0 = game:GetFastFlag("TranslateGameModeratedErrors");
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_game_FastString_0 = game:GetFastString("StudioGenreOverhaulExplainationLink");
local l_RemoveNoDevicesError_0 = game:GetFastFlag("RemoveNoDevicesError");
local l_CU1320ExperienceGenre_0 = game:GetFastFlag("CU1320ExperienceGenre");
local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("TeamCreateService");
local l_Name_0 = script.Name;
local v10 = {
    Moderated = "ErrorNameModerated", 
    Empty = "ErrorNameEmpty"
};
local v11 = {
    Moderated = "ErrorDescModerated"
};
local v12 = {
    UploadingTooQuickly = "ErrorImageLimit", 
    ImageNotRecognized = "ErrorImageNotRecognized"
};
local v13 = {
    Moderated = "ErrorAltTextModerated"
};
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_1.Packages.Roact);
local v17 = require(l_Parent_1.Packages.RoactRodux);
local v18 = require(l_Parent_1.Packages.Cryo);
local v19 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v19.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v22 = require(l_Parent_1.Src.ContextServices.Dialog);
local v23 = nil;
if l_GameSettingsExperienceGuidelines_0 then
    v23 = require(l_Parent_0.Components.Guidelines);
end;
local l_OpenExperienceSettings_0 = require(l_Parent_1.Src.Util.BrowserUtils).OpenExperienceSettings;
local l_UI_0 = v19.UI;
local l_BulletList_0 = l_UI_0.BulletList;
local l_Separator_0 = l_UI_0.Separator;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_HoverArea_0 = l_UI_0.HoverArea;
local _ = l_UI_0.SelectInput;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithInlineLink_0 = l_UI_0.TextWithInlineLink;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local _ = l_UI_0.Pane;
local l_MultiImagePicker_0 = l_UI_0.MultiImagePicker;
local l_Util_0 = v19.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_deepJoin_0 = l_Util_0.deepJoin;
local v43 = require(l_Parent_1.Src.Components.CheckBoxSet);
local v44 = require(l_Parent_1.Src.Components.UploadableIcon.UploadableIconWidget);
local v45 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v46 = require(l_Parent_1.Src.Components.Dialog.SimpleDialog);
local v47 = require(l_Parent_1.Src.Components.SettingsPages.InsufficientPermissionsPage);
local v48 = require(l_Parent_1.Src.Actions.AddChange);
local v49 = require(l_Parent_1.Src.Actions.AddErrors);
local v50 = require(l_Parent_1.Src.Actions.DiscardError);
local v51 = require(l_Parent_1.Src.Actions.SetCreatorId);
local v52 = require(l_Parent_1.Src.Actions.SetCreatorType);
local v53 = require(l_Parent_1.Src.Util.FileUtils);
local v54 = require(l_Parent_1.Src.Util.DEPRECATED_Constants);
local v55 = require(l_Parent_1.Src.Util.GameSettingsUtilities);
local l_shouldShowDevPublishLocations_0 = v55.shouldShowDevPublishLocations;
local l_getPlayerAppDownloadLink_0 = v55.getPlayerAppDownloadLink;
local l_getOptInLocationsRequirementsLink_0 = v55.getOptInLocationsRequirementsLink;
local l_getSocialMediaReferencesAllowed_0 = v55.getSocialMediaReferencesAllowed;
local l_sendAnalyticsToKibana_0 = v55.sendAnalyticsToKibana;
local l_calculateTextSize_0 = v55.calculateTextSize;
local v62 = require(l_Parent_1.Src.Util.KeyProvider);
local v63 = v62.getOptInLocationsKeyName();
local v64 = v62.getChinaKeyName();
local v65 = v62.getPlayerAcceptanceKeyName();
local v66 = v62.getApprovedKeyName();
local v67 = v62.getInReviewKeyName();
local v68 = v62.getRejectedKeyName();
local v69 = v62.getLuobuStudioDevPublishKeyName();
local v70 = v62.getCheckboxToggleKeyName();
local v71 = v62.getSelectedKeyName();
local v72 = v62.getTermsOfUseDialogKeyName();
local v73 = v62.getButtonClickedKeyName();
local function v117(v74, v75) --[[ Line: 142 ]] --[[ Name: loadSettings ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy), l_CU1320ExperienceGenre_0 (copy), v51 (copy), v52 (copy), l_shouldShowDevPublishLocations_0 (copy), v63 (copy), v65 (copy)
    local l_gameId_0 = v74:getState().Metadata.gameId;
    local l_gameInfoController_0 = v75.gameInfoController;
    local l_gameMetadataController_0 = v75.gameMetadataController;
    local l_policyInfoController_0 = v75.policyInfoController;
    local l_placesController_0 = v75.placesController;
    return {
        function(v81) --[[ Line: 151 ]]
            -- upvalues: l_GameSettingsExperienceGuidelines_0 (ref), l_gameId_0 (copy)
            if l_GameSettingsExperienceGuidelines_0 then
                v81.gameId = l_gameId_0;
            end;
        end, 
        function(v82) --[[ Line: 156 ]]
            -- upvalues: l_gameInfoController_0 (copy), l_gameId_0 (copy)
            v82.name = l_gameInfoController_0:getName(l_gameId_0);
        end, 
        function(v83) --[[ Line: 161 ]]
            -- upvalues: l_gameInfoController_0 (copy), l_gameId_0 (copy)
            v83.description = l_gameInfoController_0:getDescription(l_gameId_0);
        end, 
        function(v84) --[[ Line: 166 ]]
            -- upvalues: l_GameSettingsExperienceGuidelines_0 (ref), l_gameInfoController_0 (copy), l_gameId_0 (copy)
            if l_GameSettingsExperienceGuidelines_0 then
                v84.guidelines = l_gameInfoController_0:getGuidelines(l_gameId_0);
            end;
        end, 
        function(v85) --[[ Line: 173 ]]
            -- upvalues: l_gameInfoController_0 (copy), l_gameId_0 (copy)
            v85.genre = l_gameInfoController_0:getGenre(l_gameId_0);
        end, 
        function(v86) --[[ Line: 178 ]]
            -- upvalues: l_CU1320ExperienceGenre_0 (ref), l_gameInfoController_0 (copy), l_gameId_0 (copy)
            if not l_CU1320ExperienceGenre_0 then
                return nil;
            else
                v86.experienceGenre = l_gameInfoController_0:getExperienceGenre(l_gameId_0);
                return;
            end;
        end, 
        function(v87) --[[ Line: 186 ]]
            -- upvalues: l_gameInfoController_0 (copy), l_gameId_0 (copy)
            local v88 = l_gameInfoController_0:getSupportedDevices(l_gameId_0);
            local v89 = {};
            for _, v91 in ipairs(v88) do
                v89[v91] = true;
            end;
            v87.playableDevices = v89;
        end, 
        function(v92) --[[ Line: 196 ]]
            -- upvalues: l_gameInfoController_0 (copy), l_gameId_0 (copy)
            local v93 = l_gameInfoController_0:getThumbnails(l_gameId_0);
            local v94 = {};
            local v95 = {};
            for _, v97 in pairs(v93) do
                local v98 = tostring(v97.id);
                v94[v98] = v97;
                table.insert(v95, v98);
            end;
            v92.thumbnailOrder = v95;
            v92.thumbnails = v94;
        end, 
        function(v99) --[[ Line: 210 ]]
            -- upvalues: l_gameInfoController_0 (copy), l_gameId_0 (copy)
            local v100, v101 = l_gameInfoController_0:getIcon(l_gameId_0);
            v99.gameIcon = v100 or "None";
            v99.gameIconApproved = v101;
        end, 
        function(_) --[[ Line: 216 ]]
            -- upvalues: l_gameMetadataController_0 (copy), l_gameId_0 (copy), v74 (copy), v51 (ref)
            local v103 = l_gameMetadataController_0:getCreatorId(l_gameId_0);
            v74:dispatch(v51(v103));
        end, 
        function(_) --[[ Line: 221 ]]
            -- upvalues: l_gameMetadataController_0 (copy), l_gameId_0 (copy), v74 (copy), v52 (ref)
            local v105 = l_gameMetadataController_0:getCreatorType(l_gameId_0);
            v74:dispatch(v52(v105));
        end, 
        function(v106) --[[ Line: 226 ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), l_gameInfoController_0 (copy), l_gameId_0 (copy), v63 (ref)
            if l_shouldShowDevPublishLocations_0() then
                local v107 = l_gameInfoController_0:getOptInLocations(l_gameId_0);
                local v108 = {};
                if v107 == nil or next(v107) == nil then
                    v108 = {
                        China = {
                            status = "Unknown", 
                            selected = false
                        }
                    };
                else
                    for _, v110 in pairs(v107) do
                        local l_region_0 = v110.region;
                        local v112 = {
                            status = v110.status
                        };
                        local v113 = false;
                        if v110.status ~= "Removed" then
                            v113 = v110.status ~= "Unknown";
                        end;
                        v112.selected = v113;
                        v108[l_region_0] = v112;
                    end;
                end;
                v106[v63] = v108;
            end;
        end, 
        function(v114) --[[ Line: 265 ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v65 (ref), l_policyInfoController_0 (copy)
            if l_shouldShowDevPublishLocations_0() then
                v114[v65] = l_policyInfoController_0:getPlayerAcceptances();
            end;
        end, 
        function(v115) --[[ Line: 270 ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), l_gameMetadataController_0 (copy), l_gameId_0 (copy), l_placesController_0 (copy)
            if l_shouldShowDevPublishLocations_0() then
                local v116 = l_gameMetadataController_0:getRootPlace(l_gameId_0);
                v115.publishedVersions = l_placesController_0:getAssetPublishedVersions(v116);
            end;
        end
    };
end;
local function v173(v118, v119) --[[ Line: 279 ]] --[[ Name: saveSettings ]]
    -- upvalues: v49 (copy), l_TranslateGameModeratedErrors_0 (copy), v18 (copy), v48 (copy), l_shouldShowDevPublishLocations_0 (copy), v63 (copy)
    local v120 = v118:getState();
    local l_gameId_1 = v120.Metadata.gameId;
    local l_gameInfoController_1 = v119.gameInfoController;
    local l_localization_0 = v119.localization;
    return {
        function() --[[ Line: 286 ]]
            -- upvalues: v120 (copy), l_gameInfoController_1 (copy), l_gameId_1 (copy), v118 (copy), v49 (ref), l_TranslateGameModeratedErrors_0 (ref), l_localization_0 (copy)
            local l_name_0 = v120.Settings.Changed.name;
            if l_name_0 ~= nil then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 290 ]]
                    -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), l_name_0 (copy)
                    l_gameInfoController_1:setName(l_gameId_1, l_name_0);
                end);
                if not l_status_0 then
                    if l_result_0 == l_gameInfoController_1.NameModerated then
                        v118:dispatch(v49({
                            name = "Moderated"
                        }));
                    end;
                    if l_TranslateGameModeratedErrors_0 then
                        error(l_localization_0:getText("General", "GameNameWasModerated"));
                        return;
                    else
                        error("Game name was moderated");
                    end;
                end;
            end;
        end, 
        function() --[[ Line: 307 ]]
            -- upvalues: v120 (copy), l_gameInfoController_1 (copy), l_gameId_1 (copy), v118 (copy), v49 (ref), l_TranslateGameModeratedErrors_0 (ref), l_localization_0 (copy)
            local l_description_0 = v120.Settings.Changed.description;
            if l_description_0 ~= nil then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 311 ]]
                    -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), l_description_0 (copy)
                    l_gameInfoController_1:setDescription(l_gameId_1, l_description_0);
                end);
                if not l_status_1 then
                    if l_result_1 == l_gameInfoController_1.DescriptionModerated then
                        v118:dispatch(v49({
                            description = "Moderated"
                        }));
                    end;
                    if l_TranslateGameModeratedErrors_0 then
                        error(l_localization_0:getText("General", "GameDescriptionWasModerated"));
                        return;
                    else
                        error("Game description was moderated");
                    end;
                end;
            end;
        end, 
        function() --[[ Line: 328 ]]
            -- upvalues: v120 (copy), l_gameInfoController_1 (copy), l_gameId_1 (copy)
            local l_genre_0 = v120.Settings.Changed.genre;
            if l_genre_0 ~= nil then
                l_gameInfoController_1:setGenre(l_gameId_1, l_genre_0);
            end;
        end, 
        function() --[[ Line: 335 ]]
            -- upvalues: v120 (copy), l_gameInfoController_1 (copy), l_gameId_1 (copy)
            local l_playableDevices_0 = v120.Settings.Changed.playableDevices;
            if l_playableDevices_0 ~= nil then
                local v132 = {};
                for v133, v134 in pairs(l_playableDevices_0) do
                    if v134 then
                        table.insert(v132, v133);
                    end;
                end;
                l_gameInfoController_1:setSupportedDevices(l_gameId_1, v132);
            end;
        end, 
        function(_) --[[ Line: 349 ]]
            -- upvalues: v120 (copy), l_gameInfoController_1 (copy), l_gameId_1 (copy), v18 (ref), v118 (copy), v49 (ref), v48 (ref)
            local l_thumbnails_0 = v120.Settings.Current.thumbnails;
            local l_thumbnails_1 = v120.Settings.Changed.thumbnails;
            local l_thumbnailOrder_0 = v120.Settings.Current.thumbnailOrder;
            local l_thumbnailOrder_1 = v120.Settings.Changed.thumbnailOrder;
            if l_thumbnails_1 ~= nil or l_thumbnailOrder_1 ~= nil then
                local v140 = nil;
                do
                    local l_v140_0 = v140;
                    if l_thumbnails_0 and l_thumbnails_1 then
                        local v142 = {};
                        local v143 = {};
                        local v144 = {};
                        for v145 in pairs(l_thumbnails_0) do
                            if l_thumbnails_1[v145] == nil then
                                table.insert(v143, (tonumber(v145)));
                            end;
                        end;
                        for v146, v147 in pairs(l_thumbnails_1) do
                            if l_thumbnails_0[v146] == nil then
                                table.insert(v142, v147.asset);
                                if v147.altText ~= "" then
                                    v144[v146] = v147.altText;
                                end;
                            elseif l_thumbnails_0[v146].altText ~= v147.altText then
                                v144[v146] = v147.altText;
                            end;
                        end;
                        local v148 = 0;
                        do
                            local l_v148_0 = v148;
                            if #v143 > 0 then
                                l_v148_0 = l_v148_0 + 1;
                                coroutine.wrap(function() --[[ Line: 382 ]]
                                    -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), v143 (copy), l_v140_0 (ref), l_v148_0 (ref)
                                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 383 ]]
                                        -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), v143 (ref)
                                        l_gameInfoController_1:removeThumbnails(l_gameId_1, v143);
                                    end);
                                    if not l_status_2 then
                                        l_v140_0 = l_result_2;
                                    end;
                                    l_v148_0 = l_v148_0 - 1;
                                end)();
                            end;
                            if #v142 > 0 then
                                l_v148_0 = l_v148_0 + 1;
                                coroutine.wrap(function() --[[ Line: 395 ]]
                                    -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), v142 (copy), v18 (ref), l_thumbnailOrder_1 (ref), v144 (copy), l_v140_0 (ref), l_v148_0 (ref)
                                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 396 ]]
                                        -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), v142 (ref)
                                        return l_gameInfoController_1:addThumbnails(l_gameId_1, v142);
                                    end);
                                    if l_status_3 then
                                        for v154, v155 in pairs(l_result_3) do
                                            local l_v154_TemporaryId_0 = v154:GetTemporaryId();
                                            local v157 = v18.List.find(l_thumbnailOrder_1, l_v154_TemporaryId_0);
                                            l_thumbnailOrder_1 = v18.Dictionary.join(l_thumbnailOrder_1, {
                                                [v157] = v155
                                            });
                                            if v144[l_v154_TemporaryId_0] ~= nil then
                                                local v158 = v144[l_v154_TemporaryId_0];
                                                v144[l_v154_TemporaryId_0] = nil;
                                                v144[v155] = v158;
                                            end;
                                        end;
                                    else
                                        l_v140_0 = l_result_3;
                                    end;
                                    l_v148_0 = l_v148_0 - 1;
                                end)();
                            end;
                            while l_v148_0 > 0 do
                                wait();
                            end;
                            local v159 = nil;
                            for v160, v161 in pairs(v144) do
                                l_v148_0 = l_v148_0 + 1;
                                coroutine.wrap(function() --[[ Line: 427 ]]
                                    -- upvalues: v160 (copy), v161 (copy), l_gameInfoController_1 (ref), l_gameId_1 (ref), v159 (ref), v120 (ref), v118 (ref), v49 (ref), l_v140_0 (ref), l_v148_0 (ref)
                                    local v162 = {
                                        MediaAssetId = v160, 
                                        MediaAssetAltText = v161
                                    };
                                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 429 ]]
                                        -- upvalues: l_gameInfoController_1 (ref), l_gameId_1 (ref), v162 (copy)
                                        return l_gameInfoController_1:updateThumbnailAltText(l_gameId_1, v162);
                                    end);
                                    if l_status_4 then
                                        if l_result_4 ~= nil and l_result_4.MediaAssetAltText ~= v161 then
                                            if v159 == nil then
                                                v159 = table.clone(v120.Settings.Changed.thumbnails);
                                            end;
                                            v159[v160].altText = l_result_4.MediaAssetAltText;
                                        end;
                                    elseif l_result_4 == l_gameInfoController_1.AltTextModerated then
                                        v118:dispatch(v49({
                                            altText = {
                                                ThumbnailId = v160, 
                                                Error = "Moderated"
                                            }
                                        }));
                                        l_v140_0 = "Thumbnail alt text was moderated";
                                    end;
                                    l_v148_0 = l_v148_0 - 1;
                                end)();
                            end;
                            while l_v148_0 > 0 do
                                wait();
                            end;
                            if v159 ~= nil then
                                v118:dispatch(v48("thumbnails", v159));
                            end;
                        end;
                    end;
                    if l_thumbnailOrder_0 ~= l_thumbnailOrder_1 and l_thumbnailOrder_1 ~= nil then
                        for v165, v166 in pairs(l_thumbnailOrder_1) do
                            l_thumbnailOrder_1 = v18.Dictionary.join(l_thumbnailOrder_1, {
                                [v165] = tonumber(v166)
                            });
                        end;
                        l_gameInfoController_1:setThumbnailsOrder(l_gameId_1, l_thumbnailOrder_1);
                    end;
                    if l_v140_0 then
                        error(l_v140_0);
                    end;
                end;
            end;
        end, 
        function() --[[ Line: 478 ]]
            -- upvalues: v120 (copy), l_gameInfoController_1 (copy), l_gameId_1 (copy)
            local l_gameIcon_0 = v120.Settings.Changed.gameIcon;
            if l_gameIcon_0 ~= nil then
                l_gameInfoController_1:setIcon(l_gameId_1, l_gameIcon_0);
            end;
        end, 
        function() --[[ Line: 485 ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v120 (copy), v63 (ref), l_gameInfoController_1 (copy), l_gameId_1 (copy)
            if l_shouldShowDevPublishLocations_0() then
                local v168 = v120.Settings.Changed[v63];
                if v168 ~= nil then
                    local v169 = {};
                    local v170 = {};
                    for v171, v172 in pairs(v168) do
                        if v172.selected then
                            table.insert(v169, v171);
                        else
                            table.insert(v170, v171);
                        end;
                    end;
                    l_gameInfoController_1:setOptInLocations(l_gameId_1, v169, v170);
                end;
            end;
        end
    };
end;
local function v177(v174, v175) --[[ Line: 508 ]] --[[ Name: loadValuesToProps ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy), l_shouldShowDevPublishLocations_0 (copy), v63 (copy), v65 (copy), l_RemoveNoDevicesError_0 (copy)
    local l_Errors_0 = v175.Settings.Errors;
    return {
        GameId = if l_GameSettingsExperienceGuidelines_0 then v174("gameId") else nil, 
        Name = v174("name"), 
        Guidelines = if l_GameSettingsExperienceGuidelines_0 then v174("guidelines") else nil, 
        Description = v174("description"), 
        ExperienceGenre = v174("experienceGenre"), 
        Genre = v174("genre"), 
        Devices = v174("playableDevices"), 
        Thumbnails = v174("thumbnails"), 
        ThumbnailOrder = v174("thumbnailOrder"), 
        GameIcon = v174("gameIcon"), 
        OptInLocations = l_shouldShowDevPublishLocations_0() and v174(v63) or nil, 
        PlayerAcceptance = l_shouldShowDevPublishLocations_0() and v174(v65) or nil, 
        PublishedVersions = l_shouldShowDevPublishLocations_0() and v174("publishedVersions") or nil, 
        NameError = l_Errors_0.name, 
        DescriptionError = l_Errors_0.description, 
        DevicesError = if l_RemoveNoDevicesError_0 then nil else l_Errors_0.playableDevices, 
        ThumbnailsError = l_Errors_0.thumbnails, 
        AltTextError = l_Errors_0.altText, 
        GameIconError = l_Errors_0.gameIcon, 
        IsCurrentlyActive = v175.Settings.Current.isActive, 
        OwnerId = v175.GameOwnerMetadata.creatorId, 
        OwnerType = v175.GameOwnerMetadata.creatorType
    };
end;
local function v197(v178, v179) --[[ Line: 544 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v50 (copy), v48 (copy), v18 (copy), v54 (copy), v49 (copy), l_RemoveNoDevicesError_0 (copy), l_shouldShowDevPublishLocations_0 (copy), v63 (copy)
    return {
        ThumbnailsChanged = function(v180) --[[ Line: 546 ]] --[[ Name: ThumbnailsChanged ]]
            -- upvalues: v179 (copy), v50 (ref), v48 (ref), v18 (ref), v54 (ref), v49 (ref)
            v179(v50("altText"));
            v179(v48("thumbnails", v180));
            if #v18.Dictionary.keys(v180) > v54.MAX_THUMBNAILS then
                v179(v49({
                    thumbnails = "TooMany"
                }));
            end;
        end, 
        GenreChanged = v178("genre"), 
        NameChanged = function(v181) --[[ Line: 557 ]] --[[ Name: NameChanged ]]
            -- upvalues: v179 (copy), v48 (ref), v49 (ref)
            v179(v48("name", v181));
            local v182 = utf8.len(v181);
            if v182 == 0 or string.len((string.gsub(v181, " ", ""))) == 0 then
                v179(v49({
                    name = "Empty"
                }));
                return;
            else
                if v182 > 50 then
                    v179(v49({
                        name = "TooLong"
                    }));
                end;
                return;
            end;
        end, 
        DescriptionChanged = function(v183) --[[ Line: 566 ]] --[[ Name: DescriptionChanged ]]
            -- upvalues: v179 (copy), v48 (ref), v49 (ref)
            v179(v48("description", v183));
            if utf8.len(v183) > 1000 then
                v179(v49({
                    description = "TooLong"
                }));
            end;
        end, 
        DevicesChanged = function(v184) --[[ Line: 573 ]] --[[ Name: DevicesChanged ]]
            -- upvalues: v179 (copy), v48 (ref), l_RemoveNoDevicesError_0 (ref), v49 (ref)
            v179(v48("playableDevices", v184));
            for _, v186 in pairs(v184) do
                if v186 then
                    return;
                end;
            end;
            if not l_RemoveNoDevicesError_0 then
                v179(v49({
                    playableDevices = "NoDevices"
                }));
            end;
        end, 
        OptInLocationsChanged = function(v187) --[[ Line: 584 ]] --[[ Name: OptInLocationsChanged ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v179 (copy), v48 (ref), v63 (ref)
            if l_shouldShowDevPublishLocations_0() then
                v179(v48(v63, v187));
            end;
        end, 
        GameIconChanged = v178("gameIcon"), 
        AddThumbnails = function(v188, v189, v190) --[[ Line: 592 ]]
            -- upvalues: v18 (ref), v179 (copy), v48 (ref), v54 (ref), v49 (ref)
            local v191 = v18.Dictionary.join(v189, {});
            local v192 = v18.List.join(v190, {});
            for _, v194 in pairs(v188) do
                local l_v194_TemporaryId_0 = v194:GetTemporaryId();
                table.insert(v192, l_v194_TemporaryId_0);
                v191[l_v194_TemporaryId_0] = {
                    asset = v194, 
                    tempId = l_v194_TemporaryId_0
                };
            end;
            v179(v48("thumbnails", v191));
            v179(v48("thumbnailOrder", v192));
            if #v192 > v54.MAX_THUMBNAILS then
                v179(v49({
                    thumbnails = "TooMany"
                }));
            end;
        end, 
        ThumbnailOrderChanged = function(v196) --[[ Line: 610 ]]
            -- upvalues: v179 (copy), v48 (ref), v54 (ref), v49 (ref)
            v179(v48("thumbnailOrder", v196));
            if #v196 > v54.MAX_THUMBNAILS then
                v179(v49({
                    thumbnails = "TooMany"
                }));
            end;
        end
    };
end;
local v198 = v16.PureComponent:extend(script.Name);
v198.hasPermissionToEdit = function(v199) --[[ Line: 622 ]] --[[ Name: hasPermissionToEdit ]]
    -- upvalues: l_StudioService_0 (copy)
    local l_props_0 = v199.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local v203 = true;
    if l_OwnerType_0 ~= Enum.CreatorType.Group then
        v203 = l_OwnerId_0 == l_StudioService_0:GetUserId();
    end;
    return v203;
end;
local function _(v204) --[[ Line: 631 ]] --[[ Name: publishedVersionExists ]]
    if not v204.data or next(v204.data) == nil then
        return false;
    else
        return true;
    end;
end;
v198.init = function(v206) --[[ Line: 638 ]] --[[ Name: init ]]
    -- upvalues: v53 (copy), v63 (copy), v66 (copy), v67 (copy), v68 (copy), l_StyleModifier_0 (copy), v16 (copy), l_getOptInLocationsRequirementsLink_0 (copy), v64 (copy), l_GuiService_0 (copy), l_calculateTextSize_0 (copy), l_shouldShowDevPublishLocations_0 (copy), l_LayoutOrderIterator_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_Image_0 (copy)
    v206.state = {};
    v206.addIcons = function() --[[ Line: 641 ]]
        -- upvalues: v206 (copy), v53 (ref)
        local l_props_1 = v206.props;
        local v208 = v53.PromptForGameIcon(v206, l_props_1.Localization);
        if v208 then
            v206.props.GameIconChanged(v208);
        end;
    end;
    v206.addThumbnails = function() --[[ Line: 650 ]]
        -- upvalues: v206 (copy), v53 (ref)
        local l_props_2 = v206.props;
        local v210 = v53.PromptForThumbnails(v206, l_props_2.Localization, l_props_2.Dialog.showDialog);
        if v210 then
            v206.props.AddThumbnails(v210, l_props_2.Thumbnails, l_props_2.ThumbnailOrder);
        end;
    end;
    v206.getModerationStatus = function(v211, v212, v213) --[[ Line: 659 ]]
        -- upvalues: v63 (ref), v66 (ref), v67 (ref), v68 (ref)
        local l_Stylizer_0 = v211.props.Stylizer;
        local l_Localization_0 = v211.props.Localization;
        local v216 = l_Localization_0:getText(v63, "Status");
        local l_TextColor3_0 = l_Stylizer_0.fontStyle.Subtitle.TextColor3;
        local v218 = true;
        if v213 == v66 then
            local v219 = v213 .. v212;
            v216 = v216 .. l_Localization_0:getText(v63, v219);
        elseif v213 == v67 then
            v216 = v216 .. l_Localization_0:getText(v63, v67);
        elseif v213 == v68 then
            l_TextColor3_0 = l_Stylizer_0.fontStyle.Error.TextColor3;
            v216 = v216 .. l_Localization_0:getText(v63, v213);
        else
            v218 = false;
        end;
        return {
            statusText = v216, 
            textColor = l_TextColor3_0, 
            show = v218
        };
    end;
    v206.onMouseEnter = function() --[[ Line: 686 ]]
        -- upvalues: v206 (copy), l_StyleModifier_0 (ref)
        if v206.state.StyleModifier == nil then
            v206:setState({
                StyleModifier = l_StyleModifier_0.Hover
            });
        end;
    end;
    v206.onMouseLeave = function() --[[ Line: 694 ]]
        -- upvalues: v206 (copy), l_StyleModifier_0 (ref), v16 (ref)
        if v206.state.StyleModifier == l_StyleModifier_0.Hover then
            v206:setState({
                StyleModifier = v16.None
            });
        end;
    end;
    v206.getOptInLocationsRequirementsLink = function() --[[ Line: 702 ]]
        -- upvalues: v206 (copy), l_getOptInLocationsRequirementsLink_0 (ref), v64 (ref), l_GuiService_0 (ref)
        local l_PublishedVersions_0 = v206.props.PublishedVersions;
        if if l_PublishedVersions_0.data then next(l_PublishedVersions_0.data) ~= nil else false then
            l_PublishedVersions_0 = l_getOptInLocationsRequirementsLink_0(v64);
            l_GuiService_0:OpenBrowserWindow(l_PublishedVersions_0);
        end;
    end;
    v206.createOptInLocationBoxes = function(v221, v222) --[[ Line: 710 ]]
        -- upvalues: v63 (ref), l_calculateTextSize_0 (ref), l_shouldShowDevPublishLocations_0 (ref), l_LayoutOrderIterator_0 (ref), v16 (ref), l_TextLabel_0 (ref), l_LinkText_0 (ref), l_Image_0 (ref)
        local l_props_3 = v221.props;
        local l_Localization_1 = v221.props.Localization;
        local l_Stylizer_1 = v221.props.Stylizer;
        local v226 = l_props_3[v63];
        local l_PublishedVersions_1 = l_props_3.PublishedVersions;
        local v228 = if l_PublishedVersions_1.data then next(l_PublishedVersions_1.data) ~= nil else false;
        l_PublishedVersions_1 = l_calculateTextSize_0(l_Localization_1:getText(v63, "RequirementsLinkText"), 14, "SourceSans");
        local v229 = {};
        local v230 = not v228;
        for v231, v232 in pairs(v226) do
            local l_status_5 = v232.status;
            local l_selected_0 = v232.selected;
            local v235 = v221:getModerationStatus(v231, l_status_5);
            local v236 = l_shouldShowDevPublishLocations_0() and l_LayoutOrderIterator_0.new() or nil;
            table.insert(v229, {
                Id = v231, 
                Title = l_Localization_1:getText("General", "Location" .. v231), 
                Selected = l_selected_0, 
                LinkTextFrame = v16.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = v222:getNextOrder(), 
                    Position = UDim2.new(0, 0, 0, l_Stylizer_1.requirementsLink.paddingY), 
                    Size = UDim2.new(1, l_Stylizer_1.extraOptInInfo.length, 0, l_Stylizer_1.extraOptInInfo.height)
                }, {
                    UILayout = v16.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, l_Stylizer_1.extraOptInInfo.padding), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    StatusRequirements = v16.createElement("Frame", {
                        BorderSizePixel = 0, 
                        LayoutOrder = v222:getNextOrder()
                    }, {
                        UILayout = v16.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, l_Stylizer_1.requirementsLink.paddingX), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        ModerationStatus = v235.show and v16.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Stylizer_1.fontStyle.Subtext.Font, 
                            LayoutOrder = -1, 
                            Size = UDim2.new(0, l_calculateTextSize_0(v235.statusText, l_Stylizer_1.fontStyle.Subtext.TextSize, l_Stylizer_1.fontStyle.Subtext.Font).X, 0, l_Stylizer_1.fontStyle.Subtext.TextSize), 
                            Text = v235.statusText, 
                            TextColor3 = v235.textColor, 
                            TextSize = l_Stylizer_1.fontStyle.Subtext.TextSize, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }) or nil, 
                        RequirementsFrame = v16.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v222:getNextOrder(), 
                            Size = UDim2.new(0, l_Stylizer_1.requirementsLink.length, 0, l_Stylizer_1.requirementsLink.height)
                        }, {
                            LinkTextLabel = v16.createElement(l_TextLabel_0, {
                                Position = UDim2.new(0, l_PublishedVersions_1.X, 0, 0), 
                                Size = UDim2.new(1, -l_PublishedVersions_1.X, 1, 0), 
                                Style = "Body", 
                                Text = l_Localization_1:getText(v63, "ChinaRequirements"), 
                                TextTransparency = not v228 and 0.5 or nil, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Top
                            }), 
                            RequirementsLinkText = v16.createElement(l_LinkText_0, {
                                OnClick = v221.getOptInLocationsRequirementsLink, 
                                Size = UDim2.new(0, l_PublishedVersions_1.X, 0, l_PublishedVersions_1.Y), 
                                Style = "Body", 
                                Text = l_Localization_1:getText(v63, "RequirementsLinkText")
                            })
                        })
                    }), 
                    Warning = v230 and v16.createElement("Frame", {
                        BorderSizePixel = 0, 
                        LayoutOrder = v222:getNextOrder()
                    }, {
                        UILayout = v16.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, l_Stylizer_1.optInWarning.padding), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Image = v16.createElement(l_Image_0, {
                            LayoutOrder = v236:getNextOrder(), 
                            Size = UDim2.fromOffset(l_Stylizer_1.optInWarning.size, l_Stylizer_1.optInWarning.size), 
                            Style = "WarningStyle"
                        }), 
                        Text = v16.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Stylizer_1.fontStyle.Smaller.Font, 
                            LayoutOrder = v236:getNextOrder(), 
                            Size = UDim2.new(0, l_calculateTextSize_0(l_Localization_1:getText(v63, "SavedGameWarning"), l_Stylizer_1.fontStyle.Smaller.TextSize, l_Stylizer_1.fontStyle.Smaller.Font).X, 0, l_Stylizer_1.fontStyle.Smaller.TextSize), 
                            Text = l_Localization_1:getText(v63, "SavedGameWarning"), 
                            TextColor3 = l_Stylizer_1.fontStyle.Header.TextColor3, 
                            TextTransparency = l_Stylizer_1.optInWarning.transparency, 
                            TextSize = l_Stylizer_1.fontStyle.Smaller.TextSize, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    }) or nil
                })
            });
            v230 = false;
        end;
        return v229;
    end;
end;
v198.render = function(v237) --[[ Line: 848 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v16 (copy), v47 (copy), l_shouldShowDevPublishLocations_0 (copy), v63 (copy), l_CU1320ExperienceGenre_0 (copy), l_getSocialMediaReferencesAllowed_0 (copy), l_BulletList_0 (copy), v54 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), l_RemoveNoDevicesError_0 (copy), l_TitledFrame_0 (copy), l_TextInput_0 (copy), l_Separator_0 (copy), l_GameSettingsExperienceGuidelines_0 (copy), v23 (ref), v44 (copy), l_MultiImagePicker_0 (copy), l_TextLabel_0 (copy), l_calculateTextSize_0 (copy), l_TextWithInlineLink_0 (copy), l_OpenExperienceSettings_0 (copy), v18 (copy), l_GuiService_0 (copy), l_game_FastString_0 (copy), v43 (copy), l_getPlayerAppDownloadLink_0 (copy), v64 (copy), v46 (copy), v73 (copy), l_sendAnalyticsToKibana_0 (copy), v69 (copy), l_game_FastInt_0 (copy), v72 (copy), l_deepJoin_0 (copy), v71 (copy), v70 (copy), l_Image_0 (copy), l_Tooltip_0 (copy), l_HoverArea_0 (copy), v45 (copy), v117 (copy), v173 (copy), l_Name_0 (copy)
    local l_Localization_2 = v237.props.Localization;
    local l_Stylizer_2 = v237.props.Stylizer;
    local v240 = l_LayoutOrderIterator_0.new();
    local function v274() --[[ Line: 854 ]] --[[ Name: createChildren ]]
        -- upvalues: v237 (copy), v16 (ref), v47 (ref), l_shouldShowDevPublishLocations_0 (ref), v63 (ref), l_Localization_2 (copy), l_CU1320ExperienceGenre_0 (ref), l_getSocialMediaReferencesAllowed_0 (ref), l_BulletList_0 (ref), v54 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref), l_RemoveNoDevicesError_0 (ref), l_TitledFrame_0 (ref), v240 (copy), l_TextInput_0 (ref), l_Separator_0 (ref), l_GameSettingsExperienceGuidelines_0 (ref), v23 (ref), v44 (ref), l_MultiImagePicker_0 (ref), l_TextLabel_0 (ref), l_Stylizer_2 (copy), l_calculateTextSize_0 (ref), l_TextWithInlineLink_0 (ref), l_OpenExperienceSettings_0 (ref), v18 (ref), l_GuiService_0 (ref), l_game_FastString_0 (ref), v43 (ref), l_getPlayerAppDownloadLink_0 (ref), v64 (ref), v46 (ref), v73 (ref), l_sendAnalyticsToKibana_0 (ref), v69 (ref), l_game_FastInt_0 (ref), v72 (ref), l_deepJoin_0 (ref), v71 (ref), v70 (ref), l_Image_0 (ref), l_Tooltip_0 (ref), l_HoverArea_0 (ref)
        local v241 = false;
        if not v237:hasPermissionToEdit() then
            return {
                InsufficientPermission = v16.createElement(v47)
            };
        else
            local l_props_4 = v237.props;
            local l_Devices_0 = l_props_4.Devices;
            local l_Dialog_0 = l_props_4.Dialog;
            local v245 = nil;
            local v246 = nil;
            local v247 = nil;
            if l_shouldShowDevPublishLocations_0() then
                v245 = l_props_4[v63];
                v246 = l_props_4.PlayerAcceptance and l_props_4.PlayerAcceptance or nil;
                local l_PublishedVersions_2 = l_props_4.PublishedVersions;
                v247 = if l_PublishedVersions_2.data then next(l_PublishedVersions_2.data) ~= nil else false;
            end;
            local _ = {
                {
                    Id = "All", 
                    Label = l_Localization_2:getText("General", "GenreAll")
                }, 
                {
                    Id = "Adventure", 
                    Label = l_Localization_2:getText("General", "GenreAdventure")
                }, 
                {
                    Id = "Tutorial", 
                    Label = l_Localization_2:getText("General", "GenreBuilding")
                }, 
                {
                    Id = "Funny", 
                    Label = l_Localization_2:getText("General", "GenreComedy")
                }, 
                {
                    Id = "Ninja", 
                    Label = l_Localization_2:getText("General", "GenreFighting")
                }, 
                {
                    Id = "FPS", 
                    Label = l_Localization_2:getText("General", "GenreFPS")
                }, 
                {
                    Id = "Scary", 
                    Label = l_Localization_2:getText("General", "GenreHorror")
                }, 
                {
                    Id = "Fantasy", 
                    Label = l_Localization_2:getText("General", "GenreMedieval")
                }, 
                {
                    Id = "War", 
                    Label = l_Localization_2:getText("General", "GenreMilitary")
                }, 
                {
                    Id = "Pirate", 
                    Label = l_Localization_2:getText("General", "GenreNaval")
                }, 
                {
                    Id = "RPG", 
                    Label = l_Localization_2:getText("General", "GenreRPG")
                }, 
                {
                    Id = "SciFi", 
                    Label = l_Localization_2:getText("General", "GenreSciFi")
                }, 
                {
                    Id = "Sports", 
                    Label = l_Localization_2:getText("General", "GenreSports")
                }, 
                {
                    Id = "TownAndCity", 
                    Label = l_Localization_2:getText("General", "GenreTownAndCity")
                }, 
                {
                    Id = "WildWest", 
                    Label = l_Localization_2:getText("General", "GenreWestern")
                }
            };
            local v250 = nil;
            if l_CU1320ExperienceGenre_0 then
                local l_status_6, l_result_5 = pcall(GetExperienceGenreString, l_Localization_2, l_props_4.ExperienceGenre);
                if l_status_6 then
                    v250 = l_result_5;
                else
                    warn("Error calling GetExperienceGenreString: " .. tostring(l_result_5));
                    v250 = nil;
                end;
            else
                v250 = nil;
            end;
            local v253 = l_getSocialMediaReferencesAllowed_0();
            local v254 = v16.createElement(l_BulletList_0, {
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Items = {
                    if v253 then l_Localization_2:getText("General", "ThumbnailsLimit", {
                        maxThumbnails = v54.MAX_THUMBNAILS
                    }) else l_Localization_2:getText("General", "ThumbnailsLimitLuobu", {
                        maxThumbnails = v54.MAX_THUMBNAILS
                    }), 
                    l_Localization_2:getText("General", "ThumbnailsHint", {
                        fileTypes = table.concat(v54.IMAGE_TYPES, ", ")
                    }), 
                    l_Localization_2:getText("General", "ThumbnailsModeration")
                }
            });
            local v255 = nil;
            if l_props_4.NameError and v10[l_props_4.NameError] then
                v255 = l_Localization_2:getText("General", v10[l_props_4.NameError]);
            end;
            local v256 = nil;
            if l_props_4.DescriptionError and v11[l_props_4.DescriptionError] then
                v256 = l_Localization_2:getText("General", v11[l_props_4.DescriptionError]);
            end;
            local v257 = nil;
            if l_props_4.GameIconError and v12[l_props_4.GameIconError] then
                v257 = l_Localization_2:getText("General", v12[l_props_4.GameIconError]);
            end;
            local v258 = nil;
            if l_props_4.ThumbnailsError and v12[l_props_4.ThumbnailsError] then
                v258 = l_Localization_2:getText("General", v12[l_props_4.ThumbnailsError]);
            end;
            local v259 = nil;
            if l_props_4.AltTextError and l_props_4.AltTextError.Error and v13[l_props_4.AltTextError.Error] then
                v259 = l_Localization_2:getText("General", v13[l_props_4.AltTextError.Error]);
            end;
            local v260 = nil;
            if not l_RemoveNoDevicesError_0 and l_props_4.DevicesError then
                v260 = l_Localization_2:getText("General", "ErrorNoDevices");
            end;
            local v263 = {
                Name = v16.createElement(l_TitledFrame_0, {
                    LayoutOrder = v240:getNextOrder(), 
                    Title = l_Localization_2:getText("General", "TitleName")
                }, {
                    TextBox = v16.createElement(l_TextInput_0, {
                        Disabled = l_props_4.Name == nil, 
                        ErrorText = v255, 
                        MaxLength = 50, 
                        OnTextChanged = l_props_4.NameChanged, 
                        Text = l_props_4.Name or ""
                    })
                }), 
                Description = v16.createElement(l_TitledFrame_0, {
                    LayoutOrder = v240:getNextOrder(), 
                    Title = l_Localization_2:getText("General", "TitleDescription")
                }, {
                    TextBox = v16.createElement(l_TextInput_0, {
                        Disabled = l_props_4.Description == nil, 
                        ErrorText = v256, 
                        MaxLength = 1000, 
                        MultiLine = true, 
                        OnTextChanged = l_props_4.DescriptionChanged, 
                        Height = 130, 
                        Text = l_props_4.Description or ""
                    })
                }), 
                Separator = v16.createElement(l_Separator_0, {
                    LayoutOrder = v240:getNextOrder()
                }), 
                Guidelines = if l_GameSettingsExperienceGuidelines_0 then v16.createElement(v23, {
                    LayoutOrder = v240:getNextOrder(), 
                    GameGuideline = l_props_4.Guidelines, 
                    GameId = l_props_4.GameId
                }) else nil, 
                Separator2 = if l_GameSettingsExperienceGuidelines_0 then v16.createElement(l_Separator_0, {
                    LayoutOrder = v240:getNextOrder()
                }) else nil, 
                Icon = v16.createElement(v44, {
                    Title = l_Localization_2:getText("General", "TitleGameIcon"), 
                    LayoutOrder = v240:getNextOrder(), 
                    Enabled = l_props_4.GameIcon ~= nil, 
                    Icon = l_props_4.GameIcon, 
                    TutorialEnabled = true, 
                    AddIcon = v237.addIcons, 
                    ErrorMessage = v257
                }), 
                Separator3 = v16.createElement(l_Separator_0, {
                    LayoutOrder = v240:getNextOrder()
                }), 
                Thumbnails = v16.createElement(l_MultiImagePicker_0, {
                    LayoutOrder = v240:getNextOrder(), 
                    Enabled = l_props_4.Thumbnails ~= nil, 
                    Thumbnails = l_props_4.Thumbnails, 
                    Order = l_props_4.ThumbnailOrder, 
                    Notes = v254, 
                    IsVideoAllowed = v253, 
                    AddThumbnail = v237.addThumbnails, 
                    ErrorMessage = v258, 
                    ThumbnailsChanged = l_props_4.ThumbnailsChanged, 
                    ThumbnailOrderChanged = l_props_4.ThumbnailOrderChanged, 
                    AltTextError = {
                        ThumbnailId = if l_props_4.AltTextError then l_props_4.AltTextError.ThumbnailId else nil, 
                        ErrorMessage = v259
                    }
                }), 
                Separator4 = v16.createElement(l_Separator_0, {
                    LayoutOrder = v240:getNextOrder()
                }), 
                Genre = if l_CU1320ExperienceGenre_0 then v16.createElement(l_TitledFrame_0, {
                    LayoutOrder = v240:getNextOrder(), 
                    Title = l_Localization_2:getText("General", "TitleGenre")
                }, {
                    ExperienceGenre = v16.createElement(l_TextLabel_0, {
                        Font = l_Stylizer_2.fontStyle.Normal.Font, 
                        LayoutOrder = v240:getNextOrder(), 
                        Size = UDim2.new(0, l_calculateTextSize_0(v250, l_Stylizer_2.fontStyle.Normal.TextSize, l_Stylizer_2.fontStyle.Normal.Font).X, 0, l_Stylizer_2.fontStyle.Normal.TextSize), 
                        Text = v250, 
                        TextColor3 = l_Stylizer_2.fontStyle.Normal.TextColor3, 
                        TextSize = l_Stylizer_2.fontStyle.Normal.TextSize, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    GenreHelperText = v16.createElement(l_TextWithInlineLink_0, {
                        OnLinkClicked = function() --[[ Line: 1061 ]] --[[ Name: OnLinkClicked ]]
                            -- upvalues: l_OpenExperienceSettings_0 (ref), l_props_4 (copy)
                            l_OpenExperienceSettings_0(l_props_4.GameId)();
                        end, 
                        LayoutOrder = v240:getNextOrder(), 
                        Text = l_Localization_2:getText("GenreSettings", "GenreManageMessage", {
                            link = l_Localization_2:getText("GenreSettings", "GenreClickHereLink")
                        }), 
                        LinkText = l_Localization_2:getText("GenreSettings", "GenreClickHereLink"), 
                        LinkPlaceholder = l_Localization_2:getText("GenreSettings", "GenreClickHereLink"), 
                        MaxWidth = l_Stylizer_2.textWithInlineLink.maxWidth, 
                        TextProps = v18.Dictionary.join(l_Stylizer_2.fontStyle.Smaller, {
                            BackgroundTransparency = 1, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        TextWrapped = true, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    })
                }) else v16.createElement(l_TitledFrame_0, {
                    LayoutOrder = v240:getNextOrder(), 
                    Title = l_Localization_2:getText("General", "TitleGenre")
                }, {
                    Body = v16.createElement(l_TextWithInlineLink_0, {
                        OnLinkClicked = function() --[[ Line: 1084 ]] --[[ Name: OnLinkClicked ]]
                            -- upvalues: l_GuiService_0 (ref), l_game_FastString_0 (ref)
                            l_GuiService_0:OpenBrowserWindow(l_game_FastString_0);
                        end, 
                        Text = l_Localization_2:getText("General", "GenreReplacementMessage"), 
                        LinkText = l_Localization_2:getText("General", "GenreOverhaulMessageLink"), 
                        LinkPlaceholder = "[link]", 
                        MaxWidth = l_Stylizer_2.textWithInlineLink.maxWidth, 
                        TextProps = v18.Dictionary.join(l_Stylizer_2.fontStyle.Smaller, {
                            BackgroundTransparency = 1, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        TextWrapped = true, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    })
                }), 
                Separator5 = v16.createElement(l_Separator_0, {
                    LayoutOrder = v240:getNextOrder()
                }), 
                Devices = v16.createElement(v43, {
                    Title = l_Localization_2:getText("General", "TitleDevices"), 
                    LayoutOrder = v240:getNextOrder(), 
                    Boxes = {
                        {
                            Id = "Computer", 
                            Title = l_Localization_2:getText("General", "DeviceComputer"), 
                            Selected = if l_Devices_0 then l_Devices_0.Computer else false
                        }, 
                        {
                            Id = "Phone", 
                            Title = l_Localization_2:getText("General", "DevicePhone"), 
                            Selected = if l_Devices_0 then l_Devices_0.Phone else false
                        }, 
                        {
                            Id = "Tablet", 
                            Title = l_Localization_2:getText("General", "DeviceTablet"), 
                            Selected = if l_Devices_0 then l_Devices_0.Tablet else false
                        }, 
                        {
                            Id = "Console", 
                            Title = l_Localization_2:getText("General", "DeviceConsole"), 
                            Selected = if l_Devices_0 then l_Devices_0.Console else false
                        }, 
                        {
                            Id = "VR", 
                            Title = l_Localization_2:getText("General", "DeviceVR"), 
                            Selected = if l_Devices_0 then l_Devices_0.VR else false
                        }
                    }, 
                    Enabled = l_Devices_0 ~= nil, 
                    ErrorMessage = if l_RemoveNoDevicesError_0 then nil else v260, 
                    EntryClicked = function(v261) --[[ Line: 1137 ]] --[[ Name: EntryClicked ]]
                        -- upvalues: v18 (ref), l_Devices_0 (copy), l_props_4 (copy)
                        local v262 = v18.Dictionary.join(l_Devices_0, {
                            [v261.Id] = v261.Selected and v18.None or not v261.Selected
                        });
                        l_props_4.DevicesChanged(v262);
                    end
                }), 
                Separator6 = l_shouldShowDevPublishLocations_0() and v16.createElement(l_Separator_0, {
                    LayoutOrder = v240:getNextOrder()
                }) or nil
            };
            local v264;
            if l_shouldShowDevPublishLocations_0() then
                v264 = v16.createElement;
                local l_v43_0 = v43;
                local v266 = {
                    Title = l_Localization_2:getText("General", "TitleOptInLocations"), 
                    LayoutOrder = v240:getNextOrder(), 
                    Boxes = v237:createOptInLocationBoxes(v240), 
                    ShowWarning = not v247
                };
                local v267 = false;
                if v245 ~= nil then
                    v267 = v247;
                end;
                v266.Enabled = v267;
                v266.EntryClicked = function(v268) --[[ Line: 1157 ]] --[[ Name: EntryClicked ]]
                    -- upvalues: l_Stylizer_2 (ref), l_Localization_2 (ref), v16 (ref), l_TextWithInlineLink_0 (ref), l_getPlayerAppDownloadLink_0 (ref), v64 (ref), l_GuiService_0 (ref), v18 (ref), v246 (ref), l_Dialog_0 (copy), v46 (ref), v73 (ref), l_sendAnalyticsToKibana_0 (ref), v69 (ref), l_game_FastInt_0 (ref), v72 (ref), l_deepJoin_0 (ref), v245 (ref), v63 (ref), v71 (ref), v70 (ref), l_props_4 (copy)
                    local v270 = {
                        Size = Vector2.new(l_Stylizer_2.dialog.size.width, l_Stylizer_2.dialog.size.height), 
                        Title = "", 
                        Header = l_Localization_2:getText("General", "TermsDialogHeader"), 
                        Buttons = {
                            l_Localization_2:getText("General", "ReplyOK")
                        }, 
                        Body = v16.createElement(l_TextWithInlineLink_0, {
                            OnLinkClicked = function() --[[ Line: 1166 ]] --[[ Name: OnLinkClicked ]]
                                -- upvalues: l_getPlayerAppDownloadLink_0 (ref), v64 (ref), l_GuiService_0 (ref)
                                local v269 = l_getPlayerAppDownloadLink_0(v64);
                                l_GuiService_0:OpenBrowserWindow(v269);
                            end, 
                            Text = l_Localization_2:getText("General", "TermsDialogBody"), 
                            LinkText = l_Localization_2:getText("General", "TermsDialogBodyLink"), 
                            LinkPlaceholder = "[link]", 
                            MaxWidth = l_Stylizer_2.textWithInlineLink.maxWidth, 
                            TextProps = v18.Dictionary.join(l_Stylizer_2.fontStyle.Normal, {
                                BackgroundTransparency = 1
                            })
                        })
                    };
                    if not v246 then
                        l_Dialog_0.showDialog(v46, v270):await();
                        local v271 = {
                            [v73] = true
                        };
                        l_sendAnalyticsToKibana_0(v69, l_game_FastInt_0, v72, v271);
                        return;
                    else
                        local v272 = l_deepJoin_0(v245, {
                            [v268.Id] = {
                                selected = not v268.Selected
                            }
                        });
                        local v273 = {
                            [v63] = v268.Id, 
                            [v71] = not v268.Selected
                        };
                        l_sendAnalyticsToKibana_0(v69, l_game_FastInt_0, v70, v273);
                        l_props_4.OptInLocationsChanged(v272);
                        return;
                    end;
                end;
                v266.Tooltip = v16.createElement(l_Image_0, {
                    Size = UDim2.fromOffset(l_Stylizer_2.tooltipIcon.size, l_Stylizer_2.tooltipIcon.size), 
                    Position = UDim2.new(0, l_Stylizer_2.tooltipIcon.paddingX, 0, l_Stylizer_2.tooltipIcon.paddingY), 
                    Style = "TooltipStyle", 
                    StyleModifier = v237.state.StyleModifier
                }, {
                    v16.createElement(l_Tooltip_0, {
                        Text = l_Localization_2:getText(v63, "Tooltip")
                    }), 
                    v16.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand", 
                        MouseEnter = v237.onMouseEnter, 
                        MouseLeave = v237.onMouseLeave
                    })
                });
                v264 = v264(l_v43_0, v266);
                v241 = v264;
            end;
            if not v241 then
                v264 = nil;
            end;
            v241 = false;
            v263.OptInLocations = v264;
            return v263;
        end;
    end;
    return v16.createElement(v45, {
        SettingsLoadJobs = v117, 
        SettingsSaveJobs = v173, 
        Title = l_Localization_2:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v274
    });
end;
GetExperienceGenreString = function(v275, v276) --[[ Line: 1238 ]] --[[ Name: GetExperienceGenreString ]]
    local v277 = {
        na = {
            genre = "na", 
            subGenre = nil
        }, 
        education = {
            genre = "education", 
            subGenre = nil
        }, 
        entertainment = {
            genre = "entertainment", 
            subGenre = nil
        }, 
        music_and_audio = {
            genre = "entertainment", 
            subGenre = "music_and_audio"
        }, 
        showcase_and_hub = {
            genre = "entertainment", 
            subGenre = "showcase_and_hub"
        }, 
        video = {
            genre = "entertainment", 
            subGenre = "video"
        }, 
        other_entertainment = {
            genre = "entertainment", 
            subGenre = "other_entertainment"
        }, 
        game = {
            genre = "game", 
            subGenre = nil
        }, 
        action = {
            genre = "action", 
            subGenre = nil
        }, 
        battlegrounds_and_fighting = {
            genre = "action", 
            subGenre = "battlegrounds_and_fighting"
        }, 
        open_world_action = {
            genre = "action", 
            subGenre = "open_world_action"
        }, 
        other_action = {
            genre = "action", 
            subGenre = "other_action"
        }, 
        music_and_rhythm = {
            genre = "action", 
            subGenre = "music_and_rhythm"
        }, 
        adventure = {
            genre = "adventure", 
            subGenre = nil
        }, 
        exploration = {
            genre = "adventure", 
            subGenre = "exploration"
        }, 
        scavenger_hunt = {
            genre = "adventure", 
            subGenre = "scavenger_hunt"
        }, 
        story = {
            genre = "adventure", 
            subGenre = "story"
        }, 
        other_adventure = {
            genre = "adventure", 
            subGenre = "other_adventure"
        }, 
        roleplay_and_avatar_sim = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = nil
        }, 
        animal_sim = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = "animal_sim"
        }, 
        dress_up = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = "dress_up"
        }, 
        pet_care = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = "pet_care"
        }, 
        life = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = "life"
        }, 
        morph_roleplay = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = "morph_roleplay"
        }, 
        other_roleplay_and_avatar_sim = {
            genre = "roleplay_and_avatar_sim", 
            subGenre = "other_roleplay_and_avatar_sim"
        }, 
        obby_and_platformer = {
            genre = "obby_and_platformer", 
            subGenre = nil
        }, 
        classic_obby = {
            genre = "obby_and_platformer", 
            subGenre = "classic_obby"
        }, 
        runner = {
            genre = "obby_and_platformer", 
            subGenre = "runner"
        }, 
        tower_obby = {
            genre = "obby_and_platformer", 
            subGenre = "tower_obby"
        }, 
        other_obby_and_platformer = {
            genre = "obby_and_platformer", 
            subGenre = "other_obby_and_platformer"
        }, 
        party_and_casual = {
            genre = "party_and_casual", 
            subGenre = nil
        }, 
        childhood_game = {
            genre = "party_and_casual", 
            subGenre = "childhood_game"
        }, 
        minigame = {
            genre = "party_and_casual", 
            subGenre = "minigame"
        }, 
        quiz = {
            genre = "party_and_casual", 
            subGenre = "quiz"
        }, 
        coloring_and_drawing = {
            genre = "party_and_casual", 
            subGenre = "coloring_and_drawing"
        }, 
        other_party_and_casual = {
            genre = "party_and_casual", 
            subGenre = "other_party_and_casual"
        }, 
        puzzle = {
            genre = "puzzle", 
            subGenre = nil
        }, 
        escape_room = {
            genre = "puzzle", 
            subGenre = "escape_room"
        }, 
        match_and_merge = {
            genre = "puzzle", 
            subGenre = "match_and_merge"
        }, 
        word = {
            genre = "puzzle", 
            subGenre = "word"
        }, 
        other_puzzle = {
            genre = "puzzle", 
            subGenre = "other_puzzle"
        }, 
        rpg = {
            genre = "rpg", 
            subGenre = nil
        }, 
        action_rpg = {
            genre = "rpg", 
            subGenre = "action_rpg"
        }, 
        turn_based_rpg = {
            genre = "rpg", 
            subGenre = "turn_based_rpg"
        }, 
        open_world_and_survival_rpg = {
            genre = "rpg", 
            subGenre = "open_world_and_survival_rpg"
        }, 
        other_rpg = {
            genre = "rpg", 
            subGenre = "other_rpg"
        }, 
        shooter = {
            genre = "shooter", 
            subGenre = nil
        }, 
        battle_royale_shooter = {
            genre = "shooter", 
            subGenre = "battle_royale_shooter"
        }, 
        pve_shooter = {
            genre = "shooter", 
            subGenre = "pve_shooter"
        }, 
        deathmatch_shooter = {
            genre = "shooter", 
            subGenre = "deathmatch_shooter"
        }, 
        other_shooter = {
            genre = "shooter", 
            subGenre = "other_shooter"
        }, 
        simulation = {
            genre = "simulation", 
            subGenre = nil
        }, 
        vehicle_sim = {
            genre = "simulation", 
            subGenre = "vehicle_sim"
        }, 
        physics_sim = {
            genre = "simulation", 
            subGenre = "physics_sim"
        }, 
        incremental_simulator = {
            genre = "simulation", 
            subGenre = "incremental_simulator"
        }, 
        idle = {
            genre = "simulation", 
            subGenre = "idle"
        }, 
        tycoon = {
            genre = "simulation", 
            subGenre = "tycoon"
        }, 
        sandbox = {
            genre = "simulation", 
            subGenre = "sandbox"
        }, 
        other_simulation = {
            genre = "simulation", 
            subGenre = "other_simulation"
        }, 
        sports_and_racing = {
            genre = "sports_and_racing", 
            subGenre = nil
        }, 
        sports = {
            genre = "sports_and_racing", 
            subGenre = "sports"
        }, 
        racing = {
            genre = "sports_and_racing", 
            subGenre = "racing"
        }, 
        other_sports_and_racing = {
            genre = "sports_and_racing", 
            subGenre = "other_sports_and_racing"
        }, 
        strategy = {
            genre = "strategy", 
            subGenre = nil
        }, 
        board_and_card_games = {
            genre = "strategy", 
            subGenre = "board_and_card_games"
        }, 
        tower_defense = {
            genre = "strategy", 
            subGenre = "tower_defense"
        }, 
        other_strategy = {
            genre = "strategy", 
            subGenre = "other_strategy"
        }, 
        survival = {
            genre = "survival", 
            subGenre = nil
        }, 
        escape = {
            genre = "survival", 
            subGenre = "escape"
        }, 
        one_vs_all = {
            genre = "survival", 
            subGenre = "one_vs_all"
        }, 
        other_survival = {
            genre = "survival", 
            subGenre = "other_survival"
        }, 
        shopping = {
            genre = "shopping", 
            subGenre = nil
        }, 
        avatar_shopping = {
            genre = "shopping", 
            subGenre = "avatar_shopping"
        }, 
        other_shopping = {
            genre = "shopping", 
            subGenre = "other_shopping"
        }, 
        social = {
            genre = "social", 
            subGenre = nil
        }, 
        content_sharing = {
            genre = "social", 
            subGenre = "content_sharing"
        }, 
        communication = {
            genre = "social", 
            subGenre = "communication"
        }, 
        hangout = {
            genre = "social", 
            subGenre = "hangout"
        }, 
        other_social = {
            genre = "social", 
            subGenre = "other_social"
        }, 
        utility_and_other = {
            genre = "utility_and_other", 
            subGenre = nil
        }
    };
    local v278 = {
        na = v275:getText("Genre", "Label.NA"), 
        education = v275:getText("Genre", "Label.Education"), 
        entertainment = v275:getText("Genre", "Label.Entertainment"), 
        music_and_audio = v275:getText("Genre", "Label.MusicAndAudio"), 
        showcase_and_hub = v275:getText("Genre", "Label.ShowcaseAndHub"), 
        video = v275:getText("Genre", "Label.Video"), 
        other_entertainment = v275:getText("Genre", "Label.OtherEntertainment"), 
        game = v275:getText("Genre", "Label.Game"), 
        action = v275:getText("Genre", "Label.Action"), 
        battlegrounds_and_fighting = v275:getText("Genre", "Label.BattlegroundsAndFighting"), 
        open_world_action = v275:getText("Genre", "Label.OpenWorldAction"), 
        other_action = v275:getText("Genre", "Label.OtherAction"), 
        music_and_rhythm = v275:getText("Genre", "Label.MusicAndRhythm"), 
        adventure = v275:getText("Genre", "Label.Adventure"), 
        exploration = v275:getText("Genre", "Label.Exploration"), 
        scavenger_hunt = v275:getText("Genre", "Label.ScavengerHunt"), 
        story = v275:getText("Genre", "Label.Story"), 
        other_adventure = v275:getText("Genre", "Label.OtherAdventure"), 
        roleplay_and_avatar_sim = v275:getText("Genre", "Label.RoleplayAndAvatarSim"), 
        animal_sim = v275:getText("Genre", "Label.AnimalSim"), 
        dress_up = v275:getText("Genre", "Label.DressUp"), 
        pet_care = v275:getText("Genre", "Label.PetCare"), 
        life = v275:getText("Genre", "Label.Life"), 
        morph_roleplay = v275:getText("Genre", "Label.MorphRoleplay"), 
        other_roleplay_and_avatar_sim = v275:getText("Genre", "Label.OtherRoleplayAndAvatarSim"), 
        obby_and_platformer = v275:getText("Genre", "Label.ObbyAndPlatformer"), 
        classic_obby = v275:getText("Genre", "Label.ClassicObby"), 
        runner = v275:getText("Genre", "Label.Runner"), 
        tower_obby = v275:getText("Genre", "Label.TowerObby"), 
        other_obby_and_platformer = v275:getText("Genre", "Label.OtherObbyAndPlatformer"), 
        party_and_casual = v275:getText("Genre", "Label.PartyAndCasual"), 
        childhood_game = v275:getText("Genre", "Label.ChildhoodGame"), 
        minigame = v275:getText("Genre", "Label.Minigame"), 
        quiz = v275:getText("Genre", "Label.Quiz"), 
        coloring_and_drawing = v275:getText("Genre", "Label.ColoringAndDrawing"), 
        other_party_and_casual = v275:getText("Genre", "Label.OtherPartyAndCasual"), 
        puzzle = v275:getText("Genre", "Label.Puzzle"), 
        escape_room = v275:getText("Genre", "Label.EscapeRoom"), 
        match_and_merge = v275:getText("Genre", "Label.MatchAndMerge"), 
        word = v275:getText("Genre", "Label.Word"), 
        other_puzzle = v275:getText("Genre", "Label.OtherPuzzle"), 
        rpg = v275:getText("Genre", "Label.Rpg"), 
        action_rpg = v275:getText("Genre", "Label.ActionRpg"), 
        turn_based_rpg = v275:getText("Genre", "Label.TurnBasedRpg"), 
        open_world_and_survival_rpg = v275:getText("Genre", "Label.OpenWorldAndSurvivalRpg"), 
        other_rpg = v275:getText("Genre", "Label.OtherRpg"), 
        shooter = v275:getText("Genre", "Label.Shooter"), 
        battle_royale_shooter = v275:getText("Genre", "Label.BattleRoyaleShooter"), 
        pve_shooter = v275:getText("Genre", "Label.PveShooter"), 
        deathmatch_shooter = v275:getText("Genre", "Label.DeathmatchShooter"), 
        other_shooter = v275:getText("Genre", "Label.OtherShooter"), 
        simulation = v275:getText("Genre", "Label.Simulation"), 
        vehicle_sim = v275:getText("Genre", "Label.VehicleSim"), 
        physics_sim = v275:getText("Genre", "Label.PhysicsSim"), 
        incremental_simulator = v275:getText("Genre", "Label.IncrementalSimulator"), 
        idle = v275:getText("Genre", "Label.Idle"), 
        tycoon = v275:getText("Genre", "Label.Tycoon"), 
        sandbox = v275:getText("Genre", "Label.Sandbox"), 
        other_simulation = v275:getText("Genre", "Label.OtherSimulation"), 
        sports_and_racing = v275:getText("Genre", "Label.SportsAndRacing"), 
        sports = v275:getText("Genre", "Label.Sports"), 
        racing = v275:getText("Genre", "Label.Racing"), 
        other_sports_and_racing = v275:getText("Genre", "Label.OtherSportsAndRacing"), 
        strategy = v275:getText("Genre", "Label.Strategy"), 
        board_and_card_games = v275:getText("Genre", "Label.BoardAndCardGames"), 
        tower_defense = v275:getText("Genre", "Label.TowerDefense"), 
        other_strategy = v275:getText("Genre", "Label.OtherStrategy"), 
        survival = v275:getText("Genre", "Label.Survival"), 
        escape = v275:getText("Genre", "Label.Escape"), 
        one_vs_all = v275:getText("Genre", "Label.OneVsAll"), 
        other_survival = v275:getText("Genre", "Label.OtherSurvival"), 
        shopping = v275:getText("Genre", "Label.Shopping"), 
        avatar_shopping = v275:getText("Genre", "Label.AvatarShopping"), 
        other_shopping = v275:getText("Genre", "Label.OtherShopping"), 
        social = v275:getText("Genre", "Label.Social"), 
        content_sharing = v275:getText("Genre", "Label.ContentSharing"), 
        communication = v275:getText("Genre", "Label.Communication"), 
        hangout = v275:getText("Genre", "Label.Hangout"), 
        other_social = v275:getText("Genre", "Label.OtherSocial"), 
        utility_and_other = v275:getText("Genre", "Label.UtilityAndOther")
    };
    local v279 = v277[v276 or "na"] or {
        genre = "na", 
        subGenre = nil
    };
    local v280 = v278[v279.genre or "na"] or "";
    local v281 = v278[v279.subGenre or "na"] or "";
    return v279.subGenre and v280 .. " > " .. v281 or v280;
end;
v198 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Dialog = v22, 
    Mouse = l_ContextServices_0.Mouse
})(v198);
local v282 = require(l_Parent_1.Src.Networking.settingFromState);
v198 = v17.connect(function(v283, _) --[[ Line: 1423 ]]
    -- upvalues: v282 (copy), v177 (copy)
    if not v283 then
        return;
    else
        return (v177(function(v285) --[[ Line: 1428 ]]
            -- upvalues: v282 (ref), v283 (copy)
            return v282(v283.Settings, v285);
        end, v283));
    end;
end, function(v286) --[[ Line: 1433 ]]
    -- upvalues: v48 (copy), v197 (copy)
    return (v197(function(v287) --[[ Line: 1434 ]]
        -- upvalues: v286 (copy), v48 (ref)
        return function(v288) --[[ Line: 1435 ]]
            -- upvalues: v286 (ref), v48 (ref), v287 (copy)
            v286(v48(v287, v288));
        end;
    end, v286));
end)(v198);
v198.LocalizationId = l_Name_0;
return v198;