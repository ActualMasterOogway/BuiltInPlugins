local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local v5 = require(l_Parent_1.Packages.Cryo);
local v6 = require(l_Parent_1.Packages.Framework);
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local v19 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v20 = require(l_Parent_1.Src.Actions.AddChange);
local v21 = require(l_Parent_0.Thunks.ReloadAutoTranslationTargetLanguages);
local l_calculateTextSize_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).calculateTextSize;
local l_getAutoTranslationAllowed_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).getAutoTranslationAllowed;
local l_getAutoTranslatedLanguages_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).getAutoTranslatedLanguages;
local l_OpenLocalizationSettings_0 = require(l_Parent_1.Src.Util.BrowserUtils).OpenLocalizationSettings;
local v26 = v3.PureComponent:extend(script.Name);
local l_Name_0 = script.Name;
local v28 = game:DefineFastFlag("LocalizationUseNewAtcEndpoint", false);
local function v34(v29, v30) --[[ Line: 58 ]] --[[ Name: formatDropdownTable ]]
    local v31 = {};
    for v32, _ in pairs(v29) do
        table.insert(v31, {
            Id = v32, 
            Label = v30[v32]
        });
    end;
    return v31;
end;
local function v54(v35, v36) --[[ Line: 69 ]] --[[ Name: loadSettings ]]
    -- upvalues: l_StudioService_0 (copy), l_getAutoTranslatedLanguages_0 (copy), v28 (copy)
    local l_gameId_0 = v35:getState().Metadata.gameId;
    local l_localizationPageController_0 = v36.localizationPageController;
    return {
        function(v39) --[[ Line: 75 ]]
            -- upvalues: l_localizationPageController_0 (copy)
            v39.SupportedLanguages = l_localizationPageController_0:getSupportedLanguages();
        end, 
        function(v40) --[[ Line: 79 ]]
            -- upvalues: l_localizationPageController_0 (copy), l_StudioService_0 (ref)
            v40.LanguageCodeToNames = l_localizationPageController_0:getLanguageCodeToNames(l_StudioService_0.StudioLocaleId);
        end, 
        function(v41) --[[ Line: 84 ]]
            -- upvalues: l_localizationPageController_0 (copy), l_gameId_0 (copy), l_getAutoTranslatedLanguages_0 (ref)
            local v42 = l_localizationPageController_0:getSourceLanguage(l_gameId_0);
            v41.SourceLanguage = v42;
            v41.AutoTranslationTargetLanguages = l_getAutoTranslatedLanguages_0()[v42] or l_localizationPageController_0:getAutoTranslationTargetLanguages(v42);
        end, 
        function(v43) --[[ Line: 95 ]]
            -- upvalues: v28 (ref), l_localizationPageController_0 (copy), l_gameId_0 (copy)
            local v44 = nil;
            local v45 = nil;
            if v28 then
                local v46 = nil;
                local v47, v48, v49 = l_localizationPageController_0:getAutoLocalizationSettings(l_gameId_0);
                v44 = v47;
                v46 = v48;
                v45 = v49;
                v43.IsAutomaticEntriesDeletionEnabled = v46;
            else
                local v50, v51 = l_localizationPageController_0:getAutoLocalizationSettings_Deprecated(l_gameId_0);
                v44 = v50;
                v45 = v51;
            end;
            v43.AutoTextCaptureEnabled = v44;
            v43.UseTranslatedContentEnabled = v45;
        end, 
        function(v52) --[[ Line: 109 ]]
            -- upvalues: l_localizationPageController_0 (copy), l_gameId_0 (copy)
            v52.IsAutomaticTranslationAllowed = l_localizationPageController_0:getAutoTranslationFeatureStatus(l_gameId_0);
        end, 
        function(v53) --[[ Line: 113 ]]
            -- upvalues: l_localizationPageController_0 (copy), l_gameId_0 (copy)
            v53.AutoTranslationSettings = l_localizationPageController_0:getAutoTranslationSetings(l_gameId_0);
        end
    };
end;
local function v72(v55, v56) --[[ Line: 120 ]] --[[ Name: saveSettings ]]
    -- upvalues: v28 (copy)
    local v57 = v55:getState();
    local l_gameId_1 = v57.Metadata.gameId;
    local l_localizationPageController_1 = v56.localizationPageController;
    return {
        function() --[[ Line: 126 ]]
            -- upvalues: v57 (copy), l_localizationPageController_1 (copy), l_gameId_1 (copy)
            local l_SourceLanguage_0 = v57.Settings.Changed.SourceLanguage;
            if l_SourceLanguage_0 ~= nil then
                l_localizationPageController_1:setSourceLanguage(l_gameId_1, l_SourceLanguage_0);
            end;
        end, 
        function() --[[ Line: 132 ]]
            -- upvalues: v57 (copy), v28 (ref), l_localizationPageController_1 (copy), l_gameId_1 (copy)
            local l_AutoTextCaptureEnabled_0 = v57.Settings.Changed.AutoTextCaptureEnabled;
            local l_UseTranslatedContentEnabled_0 = v57.Settings.Changed.UseTranslatedContentEnabled;
            local v63 = if v28 then v57.Settings.Changed.IsAutomaticEntriesDeletionEnabled else nil;
            if l_AutoTextCaptureEnabled_0 ~= nil or l_UseTranslatedContentEnabled_0 ~= nil or v63 ~= nil then
                local v64 = nil;
                local v65 = nil;
                local v66 = nil;
                v64 = if l_AutoTextCaptureEnabled_0 ~= nil then l_AutoTextCaptureEnabled_0 else v57.Settings.Current.AutoTextCaptureEnabled;
                v65 = if l_UseTranslatedContentEnabled_0 ~= nil then l_UseTranslatedContentEnabled_0 else v57.Settings.Current.UseTranslatedContentEnabled;
                if v28 then
                    v66 = if v63 ~= nil then v63 else v57.Settings.Current.IsAutomaticEntriesDeletionEnabled;
                end;
                if v28 then
                    l_localizationPageController_1:setAutoLocalizationSettings(l_gameId_1, v64, v66, v65);
                    return;
                else
                    l_localizationPageController_1:setAutoLocalizationSettings_Deprecated(l_gameId_1, v64, v65);
                end;
            end;
        end, 
        function() --[[ Line: 182 ]]
            -- upvalues: v57 (copy), l_localizationPageController_1 (copy), l_gameId_1 (copy)
            local l_AutoTranslationSettings_0 = v57.Settings.Changed.AutoTranslationSettings;
            if l_AutoTranslationSettings_0 ~= nil then
                local v68 = {};
                local l_AutoTranslationSettings_1 = v57.Settings.Current.AutoTranslationSettings;
                for v70, v71 in pairs(l_AutoTranslationSettings_0) do
                    if l_AutoTranslationSettings_1[v70] ~= v71 then
                        v68[v70] = v71;
                    end;
                end;
                l_localizationPageController_1:setAutoTranslationSetings(l_gameId_1, v68);
            end;
        end
    };
end;
local function v80(v73, _) --[[ Line: 198 ]] --[[ Name: getAutomaticTranslationEntries ]]
    -- upvalues: l_getAutoTranslationAllowed_0 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), l_TitledFrame_0 (copy), l_ToggleButton_0 (copy)
    local l_AutoTranslationTargetLanguages_0 = v73.AutoTranslationTargetLanguages;
    if l_AutoTranslationTargetLanguages_0 == nil then
        return;
    else
        if v73.IsAutomaticTranslationAllowed or l_getAutoTranslationAllowed_0() then
            local v76 = {};
            local v77 = l_LayoutOrderIterator_0.new();
            for v78, v79 in pairs(l_AutoTranslationTargetLanguages_0) do
                if v79 then
                    v76[v78] = v3.createElement(l_TitledFrame_0, {
                        LayoutOrder = v77:getNextOrder(), 
                        Title = v73.LanguageCodeToNames[v78]
                    }, {
                        ToggleButton = v3.createElement(l_ToggleButton_0, {
                            OnClick = v73.AutoTranslationSettingChanged(v73.AutoTranslationSettings, v78), 
                            Selected = v73.AutoTranslationSettings[v78] or false
                        })
                    });
                end;
            end;
            if next(v76) ~= nil then
                return v76;
            end;
        end;
        return;
    end;
end;
local function v94(v81, v82, v83) --[[ Line: 227 ]] --[[ Name: displayLocalizationSettingsPage ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v34 (copy), l_getAutoTranslationAllowed_0 (copy), v80 (copy), l_calculateTextSize_0 (copy), v3 (copy), l_TitledFrame_0 (copy), l_SelectInput_0 (copy), v5 (copy), l_Separator_0 (copy), l_ToggleButton_0 (copy), v28 (copy), l_LinkText_0 (copy), l_GuiService_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_OpenLocalizationSettings_0 (copy)
    local v84 = l_LayoutOrderIterator_0.new();
    local v85 = v34(v81.SupportedLanguages, v81.LanguageCodeToNames);
    local v86 = v81.IsAutomaticTranslationAllowed or l_getAutoTranslationAllowed_0();
    local v87 = v80(v81, v83);
    local v88 = v87 ~= nil;
    local v89 = v86 and not v88;
    local v90 = not l_getAutoTranslationAllowed_0();
    local l_GameId_0 = v81.GameId;
    local v92 = l_calculateTextSize_0(v82:getText("General", "LocalizationSettingsLinkText"), 14, "SourceSans");
    return {
        SourceLanguage = v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v84:getNextOrder(), 
            Title = v82:getText("General", "SourceLanguageTitle")
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v83.uiListLayout.padding)
            }), 
            Selector = v3.createElement(l_SelectInput_0, {
                LayoutOrder = 1, 
                Items = v85, 
                Enabled = next(v85) ~= nil, 
                SelectedId = v81.SourceLanguage, 
                OnItemActivated = function(v93) --[[ Line: 255 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v81 (copy)
                    v81.SourceLanguageChanged(v93.Id);
                end
            }), 
            Description = v3.createElement("TextLabel", v5.Dictionary.join(v83.fontStyle.Subtext, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v82:getText("General", "SourceLanguageDesc")
            }))
        }), 
        Separator1 = v3.createElement(l_Separator_0, {
            LayoutOrder = v84:getNextOrder()
        }), 
        AutoTextCapture = v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v84:getNextOrder(), 
            Title = v82:getText("General", "AutoTextCaptureTitle")
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v83.uiListLayout.padding)
            }), 
            ToggleButton = v3.createElement(l_ToggleButton_0, {
                Disabled = v81.AutoTextCaptureEnabled == nil, 
                LayoutOrder = 1, 
                OnClick = v81.AutoTextCaptureEnabledChanged, 
                Selected = v81.AutoTextCaptureEnabled
            }), 
            Description = if v28 then v3.createElement("TextLabel", v5.Dictionary.join(v83.fontStyle.Subtext, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v82:getText("General", "NewAtcAdditionDescription"), 
                TextWrapped = true
            })) else v3.createElement("TextLabel", v5.Dictionary.join(v83.fontStyle.Subtext, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v82:getText("General", "AutoTextCaptureDesc")
            })), 
            LinkText = if v28 then v3.createElement(l_LinkText_0, {
                OnClick = function() --[[ Line: 319 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_GuiService_0 (ref)
                    l_GuiService_0:OpenBrowserWindow("https://create.roblox.com/docs/production/localization/manual-translations#automatic-text-capture");
                end, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
                Style = "Body", 
                Text = v82:getText("General", "NewAtcAdditionDescriptionLink")
            }) else nil, 
            Padding = if v28 then v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v83.atcFrame.PaddingBottom)
            }) else nil, 
            DeletionToggleButton = if v28 then v3.createElement(l_ToggleButton_0, {
                Disabled = v81.AutoTextCaptureEnabled == nil, 
                LayoutOrder = 4, 
                OnClick = v81.IsAutomaticEntriesDeletionEnabledChanged, 
                Selected = v81.IsAutomaticEntriesDeletionEnabled
            }) else nil, 
            DeletionDescription = if v28 then v3.createElement("TextLabel", v5.Dictionary.join(v83.fontStyle.Subtext, {
                LayoutOrder = 5, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v82:getText("General", "NewAtcDeletionDescription"), 
                TextWrapped = true
            })) else nil
        }), 
        Separator2 = v3.createElement(l_Separator_0, {
            LayoutOrder = v84:getNextOrder()
        }), 
        UseTranslatedContent = v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v84:getNextOrder(), 
            Title = v82:getText("General", "UseTranslatedContentTitle")
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v83.uiListLayout.padding)
            }), 
            ToggleButton = v3.createElement(l_ToggleButton_0, {
                Disabled = v81.UseTranslatedContentEnabled == nil, 
                LayoutOrder = 1, 
                OnClick = v81.UseTranslatedContentEnabledChanged, 
                Selected = v81.UseTranslatedContentEnabled
            }), 
            Description = v3.createElement("TextLabel", v5.Dictionary.join(v83.fontStyle.Subtext, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v82:getText("General", "UseTranslatedContentDesc")
            }))
        }), 
        Separator3 = v3.createElement(l_Separator_0, {
            LayoutOrder = v84:getNextOrder()
        }), 
        AutoTranslationTitle = v86 and v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v84:getNextOrder(), 
            Title = v82:getText("General", "AutoTranslationTitle")
        }), 
        AutoTranslationOptions = v88 and v3.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v84:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Spacing = UDim.new(0, 10)
        }, v87), 
        AutoTranlsationUnavailable = v89 and v3.createElement("TextLabel", v5.Dictionary.join(v83.fontStyle.Subtext, {
            LayoutOrder = v84:getNextOrder(), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v83.fontStyle.Subtitle.TextSize), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = v82:getText("General", "AutoTranslationOnlyAvailableForEnMessage")
        })), 
        Separator4 = v86 and v3.createElement(l_Separator_0, {
            LayoutOrder = v84:getNextOrder()
        }), 
        HyperLink = v90 and v3.createElement("Frame", {
            LayoutOrder = v84:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            LinkTextLabel = v3.createElement(l_TextLabel_0, {
                Position = UDim2.new(0, v92.X, 0, 0), 
                Size = UDim2.new(1, -v92.X, 1, 0), 
                Style = "Body", 
                Text = v82:getText("General", "LocalizationSettingsNonLinkText"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            LinkText = v3.createElement(l_LinkText_0, {
                OnClick = l_OpenLocalizationSettings_0(l_GameId_0), 
                Size = UDim2.new(0, v92.X, 0, v92.Y), 
                Style = "Body", 
                Text = v82:getText("General", "LocalizationSettingsLinkText")
            })
        })
    };
end;
v26.render = function(v95) --[[ Line: 440 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v19 (copy), v54 (copy), v72 (copy), l_Name_0 (copy), v94 (copy)
    local l_props_0 = v95.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v3.createElement(v19, {
        SettingsLoadJobs = v54, 
        SettingsSaveJobs = v72, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = script.Name, 
        CreateChildren = function() --[[ Line: 450 ]] --[[ Name: CreateChildren ]]
            -- upvalues: v94 (ref), l_props_0 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy)
            return (v94(l_props_0, l_Localization_0, l_Stylizer_0));
        end
    });
end;
local function v101(v99, v100) --[[ Line: 457 ]] --[[ Name: loadValuesToProps ]]
    -- upvalues: v28 (copy)
    return {
        SupportedLanguages = v99("SupportedLanguages"), 
        LanguageCodeToNames = v99("LanguageCodeToNames"), 
        IsAutomaticTranslationAllowed = v99("IsAutomaticTranslationAllowed"), 
        AutoTranslationTargetLanguages = v99("AutoTranslationTargetLanguages"), 
        SourceLanguage = v99("SourceLanguage"), 
        AutoTextCaptureEnabled = v99("AutoTextCaptureEnabled"), 
        IsAutomaticEntriesDeletionEnabled = if v28 then v99("IsAutomaticEntriesDeletionEnabled") else nil, 
        UseTranslatedContentEnabled = v99("UseTranslatedContentEnabled"), 
        AutoTranslationSettings = v99("AutoTranslationSettings"), 
        GameId = v100.Metadata.gameId
    };
end;
local function v109(v102, v103) --[[ Line: 476 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v20 (copy), v21 (copy), v28 (copy), v5 (copy)
    return {
        SourceLanguageChanged = function(v104) --[[ Line: 478 ]] --[[ Name: SourceLanguageChanged ]]
            -- upvalues: v103 (copy), v20 (ref), v21 (ref)
            v103(v20("SourceLanguage", v104));
            v103(v21(v104));
        end, 
        AutoTextCaptureEnabledChanged = v102("AutoTextCaptureEnabled"), 
        IsAutomaticEntriesDeletionEnabledChanged = if v28 then v102("IsAutomaticEntriesDeletionEnabled") else nil, 
        UseTranslatedContentEnabledChanged = v102("UseTranslatedContentEnabled"), 
        AutoTranslationSettingChanged = function(v105, v106) --[[ Line: 487 ]] --[[ Name: AutoTranslationSettingChanged ]]
            -- upvalues: v5 (ref), v103 (copy), v20 (ref)
            return function(v107) --[[ Line: 488 ]]
                -- upvalues: v5 (ref), v105 (copy), v106 (copy), v103 (ref), v20 (ref)
                local v108 = v5.Dictionary.join(v105, {
                    [v106] = v107
                });
                v103(v20("AutoTranslationSettings", v108));
            end;
        end
    };
end;
v26 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer
})(v26);
local v110 = require(l_Parent_1.Src.Networking.settingFromState);
v26 = v4.connect(function(v111, _) --[[ Line: 506 ]]
    -- upvalues: v110 (copy), v101 (copy)
    if not v111 then
        return;
    else
        return (v101(function(v113) --[[ Line: 511 ]]
            -- upvalues: v110 (ref), v111 (copy)
            return v110(v111.Settings, v113);
        end, v111));
    end;
end, function(v114) --[[ Line: 516 ]]
    -- upvalues: v20 (copy), v109 (copy)
    return (v109(function(v115) --[[ Line: 517 ]]
        -- upvalues: v114 (copy), v20 (ref)
        return function(v116) --[[ Line: 518 ]]
            -- upvalues: v114 (ref), v20 (ref), v115 (copy)
            v114(v20(v115, v116));
        end;
    end, v114));
end)(v26);
v26.LocalizationId = l_Name_0;
return v26;