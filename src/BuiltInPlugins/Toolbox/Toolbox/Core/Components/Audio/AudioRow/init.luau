local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_HoverArea_0 = v4.UI.HoverArea;
local l_withAbsoluteSizeAndPosition_0 = v4.Wrappers.withAbsoluteSizeAndPosition;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_script_FirstAncestor_0.Core.Util.Analytics.Analytics);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v14 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v15 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v16 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v17 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v18 = require(l_script_FirstAncestor_0.Core.Networking.Requests.PurchaseAssetRequest);
local v19 = require(l_script_FirstAncestor_0.Core.Util.getIsValidAudioAssetForInventoryGrant);
local v20 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRow);
local v21 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioRowExpandedContent);
local v22 = require(l_script_FirstAncestor_0.Core.Util.Images);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v24 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v25 = require(l_script_FirstAncestor_0.Core.Components.Audio.GetAudioTableSizes);
local v26 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local v27 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxShowArtistThenCreator);
local v28 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAudioRemoveProductId);
local v29 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagAudioSequentialPurchasingAndPermissionGranting);
local v30 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagAudioRowPassAssetInfoToPurchaseAsset);
local v31 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxFixAudioTagTranslations);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v33 = v2.PureComponent:extend("AudioRow");
secondsToMinuteString = function(v34) --[[ Line: 98 ]] --[[ Name: secondsToMinuteString ]]
    local v35 = tonumber(v34) or 0;
    local v36 = math.floor(v35 / 60);
    local v37 = v35 % 60;
    return string.format("%d:%02d", v36, v37);
end;
local v38 = {
    Artist = "---", 
    MusicAlbum = "---"
};
audioDetailsWithDefaults = function(v39) --[[ Line: 111 ]] --[[ Name: audioDetailsWithDefaults ]]
    -- upvalues: v5 (copy), v38 (copy)
    return v5.join(v38, v39);
end;
v33.init = function(v40, v41) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v19 (copy), v28 (copy), v12 (copy), v30 (copy), v29 (copy), v5 (copy), v9 (copy), v31 (copy), v25 (copy), v27 (copy), v26 (copy), v24 (copy), v2 (copy), v22 (copy), l_HoverArea_0 (copy), v21 (copy)
    v40.wasAssetBoundsWithinScrollingBounds = false;
    v40.state = {
        isPlayButtonHovered = false, 
        isExpanded = true, 
        isPlaying = false
    };
    v40.onPlayButtonMouseEnter = function() --[[ Line: 124 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            isPlayButtonHovered = true
        });
    end;
    v40.onPlayButtonMouseLeave = function() --[[ Line: 128 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            isPlayButtonHovered = false
        });
    end;
    v40.toggleIsExpanded = function() --[[ Line: 132 ]]
        -- upvalues: v40 (copy)
        local l_Id_0 = v40.props.AssetInfo.Asset.Id;
        v40.props.OnExpanded(l_Id_0);
    end;
    v40.stopPlaying = function() --[[ Line: 137 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            isPlaying = false
        });
    end;
    v40.toggleIsPlayer = function() --[[ Line: 141 ]]
        -- upvalues: v40 (copy)
        v40:setState(function(v43) --[[ Line: 142 ]]
            return {
                isPlaying = not v43.isPlaying
            };
        end);
    end;
    local function v48() --[[ Line: 151 ]] --[[ Name: handlePurchaseAndGrantingDeprecated ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v40 (copy), v19 (ref), v28 (ref), v12 (ref)
        if l_game_EngineFeature_0 then
            local l_AssetInfo_0 = v40.props.AssetInfo;
            local l_networkInterface_0 = v40.props.Network.networkInterface;
            v19(l_networkInterface_0, l_AssetInfo_0.Asset.Id):andThen(function(v46) --[[ Line: 158 ]]
                -- upvalues: v40 (ref), l_networkInterface_0 (copy), l_AssetInfo_0 (copy), v28 (ref), v12 (ref)
                if v46 then
                    local v47 = {
                        currencyCode = "USD", 
                        quantity = {
                            significand = 0, 
                            exponent = 0
                        }
                    };
                    v40.props.purchaseAsset(l_networkInterface_0, l_AssetInfo_0.Asset.Id, if v28() then nil else l_AssetInfo_0.Product.ProductId, 0, 3, nil, v47);
                    v12.onAudioAssetGrantedToUserInventoryEvent(l_AssetInfo_0.Asset.Id);
                end;
            end):await();
        end;
        v40.props.InsertAsset(false);
    end;
    local function v53() --[[ Line: 187 ]] --[[ Name: handleSequentialPurchaseAndGranting ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v40 (copy), v19 (ref), v28 (ref), v30 (ref), v12 (ref)
        if l_game_EngineFeature_0 then
            local l_AssetInfo_1 = v40.props.AssetInfo;
            local l_networkInterface_1 = v40.props.Network.networkInterface;
            v19(l_networkInterface_1, l_AssetInfo_1.Asset.Id):andThen(function(v51) --[[ Line: 194 ]]
                -- upvalues: v40 (ref), l_networkInterface_1 (copy), l_AssetInfo_1 (copy), v28 (ref), v30 (ref), v12 (ref)
                if v51 then
                    local v52 = {
                        currencyCode = "USD", 
                        quantity = {
                            significand = 0, 
                            exponent = 0
                        }
                    };
                    v40.props.purchaseAsset(l_networkInterface_1, l_AssetInfo_1.Asset.Id, if v28() then nil else l_AssetInfo_1.Product.ProductId, 0, 3, nil, v52, function() --[[ Line: 211 ]]
                        -- upvalues: v40 (ref)
                        v40.props.InsertAsset(false);
                    end, if v30() then v40.props.AssetInfo else nil, true);
                    v12.onAudioAssetGrantedToUserInventoryEvent(l_AssetInfo_1.Asset.Id);
                    return;
                else
                    v40.props.InsertAsset(false);
                    return;
                end;
            end):await();
            return;
        else
            v40.props.InsertAsset(false);
            return;
        end;
    end;
    v40.onClick = function() --[[ Line: 229 ]]
        -- upvalues: v40 (copy), v29 (ref), v53 (copy), v48 (copy)
        if v40.props.CanInsertAsset() then
            if v29() then
                v53();
                return;
            else
                v48();
            end;
        end;
    end;
    v40.searchBy = function(v54) --[[ Line: 239 ]]
        -- upvalues: v40 (copy), v41 (copy), v5 (ref)
        local l_networkInterface_2 = v40.props.Network.networkInterface;
        local v56 = v40.props.Settings:get("Plugin");
        local l_audioSearchInfo_0 = v40.props.audioSearchInfo;
        local l_creator_0 = v40.props.creator;
        local l_additionalAudioSearchInfo_0 = v41.additionalAudioSearchInfo;
        local v60 = {
            Creator = l_creator_0, 
            AudioSearch = l_audioSearchInfo_0, 
            AdditionalAudioSearch = v5.join(l_additionalAudioSearchInfo_0, v54)
        };
        v40.props.searchWithOptions(l_networkInterface_2, v56, v60);
    end;
    v40.onSearchByCreator = function() --[[ Line: 255 ]]
        -- upvalues: v40 (copy)
        local l_props_0 = v40.props;
        local v62 = l_props_0.Settings:get("Plugin");
        local v63 = {
            Creator = if l_props_0.AssetInfo.Creator then l_props_0.AssetInfo.Creator.Name else nil
        };
        l_props_0.searchWithOptions(l_props_0.Network.networkInterface, v62, v63);
    end;
    v40.onSearchByArtist = function() --[[ Line: 266 ]]
        -- upvalues: v40 (copy), v9 (ref)
        local l_AudioDetails_0 = v40.props.AssetInfo.AudioDetails;
        v40.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST] = l_AudioDetails_0.Artist
        });
    end;
    v40.onSearchByGenre = function() --[[ Line: 273 ]]
        -- upvalues: v40 (copy), v9 (ref)
        local l_AudioDetails_1 = v40.props.AssetInfo.AudioDetails;
        v40.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.GENRE] = l_AudioDetails_1.MusicGenre
        });
    end;
    v40.onSearchByCategories = function() --[[ Line: 278 ]]
        -- upvalues: v40 (copy), v9 (ref)
        local l_AudioDetails_2 = v40.props.AssetInfo.AudioDetails;
        local v67 = {};
        if l_AudioDetails_2.SoundEffectCategory then
            table.insert(v67, l_AudioDetails_2.SoundEffectCategory);
            if l_AudioDetails_2.SoundEffectSubcategory then
                table.insert(v67, l_AudioDetails_2.SoundEffectSubcategory);
            end;
        end;
        v40.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.CATEGORIES] = v67
        });
    end;
    v40.onSearchByAlbum = function() --[[ Line: 290 ]]
        -- upvalues: v40 (copy), v9 (ref)
        local l_AudioDetails_3 = v40.props.AssetInfo.AudioDetails;
        v40.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST] = l_AudioDetails_3.Artist, 
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ALBUM] = l_AudioDetails_3.MusicAlbum
        });
    end;
    v40.onSearchByTags = function() --[[ Line: 298 ]]
        -- upvalues: v40 (copy)
        local l_AudioDetails_4 = v40.props.AssetInfo.AudioDetails;
        if l_AudioDetails_4 then
            if l_AudioDetails_4.SoundEffectCategory then
                v40.onSearchByCategories();
                return;
            else
                v40.onSearchByGenre();
            end;
        end;
    end;
    v40.onAssetPreviewButtonClicked = function() --[[ Line: 311 ]]
        -- upvalues: v40 (copy)
        local l_AssetInfo_2 = v40.props.AssetInfo;
        v40.stopPlaying();
        v40.props.OnAssetPreviewButtonClicked(l_AssetInfo_2);
    end;
    v40.onHoverChanged = function(v71) --[[ Line: 317 ]]
        -- upvalues: v40 (copy)
        v40:setState(function(_) --[[ Line: 318 ]]
            -- upvalues: v71 (copy)
            return {
                isHovered = v71
            };
        end);
    end;
    v40.localizeWithFallback = function(v73) --[[ Line: 325 ]]
        -- upvalues: v40 (copy)
        local v74 = v40.props.Localization:getText("Audio.SoundEffect.Category", v73);
        if string.match(v74, "Audio.SoundEffect.Category") then
            v74 = v40.props.Localization:getText("Audio.Music.Genre", v73);
            if string.match(v74, "Audio.Music.Genre") then
                return v73;
            end;
        end;
        return v74;
    end;
    v40.isCapitalizedIgnoreLocale = function(v75) --[[ Line: 336 ]]
        -- upvalues: v31 (ref)
        if v31() then
            return false;
        elseif v75 == nil or string.len(v75) == 0 then
            return false;
        else
            local v76 = string.sub(v75 or "", 1, 1);
            return v76 == string.upper(v76);
        end;
    end;
    v40.getTags = function(v77) --[[ Line: 349 ]]
        -- upvalues: v31 (ref), v40 (copy)
        local v78 = nil;
        local v79 = nil;
        if v31() then
            if v77.SoundEffectCategory ~= nil then
                v78 = v40.localizeWithFallback(v77.SoundEffectCategory);
                if v77.SoundEffectSubcategory ~= nil then
                    v79 = v40.localizeWithFallback(v77.SoundEffectSubcategory);
                end;
            elseif v77.MusicGenre ~= nil then
                v78 = v40.localizeWithFallback(v77.MusicGenre);
            end;
        else
            local l_Localization_0 = v40.props.Localization;
            if v77.SoundEffectCategory ~= nil and not v40.isCapitalizedIgnoreLocale(v77.SoundEffectCategory) then
                v78 = l_Localization_0:getText("Audio.SoundEffect.Category", v77.SoundEffectCategory);
                if v77.SoundEffectSubcategory ~= nil and v40.isCapitalizedIgnoreLocale(v77.SoundEffectSubcategory) then
                    v79 = l_Localization_0:getText("Audio.SoundEffect.Category", v77.SoundEffectSubcategory);
                end;
            elseif v77.MusicGenre ~= nil and not v40.isCapitalizedIgnoreLocale(v77.MusicGenre) then
                v78 = l_Localization_0:getText("Audio.Music.Genre", v77.MusicGenre);
            end;
        end;
        local v81 = nil;
        if v78 then
            v81 = v78;
            if v79 then
                v81 = v81 .. " - " .. v79;
            end;
        end;
        return v81;
    end;
    v40.getColumns = function() --[[ Line: 393 ]]
        -- upvalues: v40 (copy), v25 (ref), v27 (ref), v9 (ref), v26 (ref)
        local l_props_1 = v40.props;
        local l_Asset_0 = l_props_1.AssetInfo.Asset;
        local v84 = audioDetailsWithDefaults(l_props_1.AssetInfo.AudioDetails);
        local v85 = v25(v84.Type, l_props_1.width or 0);
        local l_Creator_0 = l_props_1.AssetInfo.Creator;
        local v87 = "---";
        local v88 = nil;
        if v27() then
            local v89 = if l_props_1.AssetInfo.AudioDetails then l_props_1.AssetInfo.AudioDetails.Artist else nil;
            if v89 and string.len(v89) > 0 then
                v87 = v89;
                v88 = v40.onSearchByArtist;
            elseif l_Creator_0 and l_Creator_0.Name then
                v87 = l_Creator_0.Name;
                v88 = v40.onSearchByCreator;
            end;
        else
            v87 = if l_Creator_0 and l_Creator_0.Name then l_Creator_0.Name else "---";
            v88 = if v87 ~= "---" then v40.onSearchByCreator else nil;
        end;
        return {
            {
                DevLabel = "Creator", 
                OnClick = v88, 
                Size = v85[v9.AUDIO_ROW.COLUMNS.CREATOR], 
                Text = v87
            }, 
            {
                DevLabel = "Tags", 
                OnClick = v40.onSearchByTags, 
                Size = v85[v9.AUDIO_ROW.COLUMNS.TAGS], 
                Text = v40.getTags(v84)
            }, 
            {
                DevLabel = "Duration", 
                Padding = {
                    Left = if v26() then v9.ITEM_ROW.LEFT_RIGHT_PADDING else v9.AUDIO_ROW.LEFT_RIGHT_PADDING
                }, 
                OnClick = nil, 
                Size = v85[v9.AUDIO_ROW.COLUMNS.LENGTH], 
                Text = secondsToMinuteString(l_Asset_0.Duration)
            }
        };
    end;
    v40.renderIcon = function() --[[ Line: 444 ]]
        -- upvalues: v40 (copy), v24 (ref), v9 (ref), v2 (ref), v5 (ref), v22 (ref), v26 (ref), l_HoverArea_0 (ref)
        local l_props_2 = v40.props;
        local l_state_0 = v40.state;
        local l_IsExpanded_0 = l_props_2.IsExpanded;
        local l_itemRow_0 = l_props_2.Stylizer.itemRow;
        local l_isHovered_0 = l_state_0.isHovered;
        local l_isPlayButtonHovered_0 = l_state_0.isPlayButtonHovered;
        local l_isPlaying_0 = l_state_0.isPlaying;
        local v97 = audioDetailsWithDefaults(l_props_2.AssetInfo.AudioDetails).Type == v24.SOUND_EFFECTS.name;
        local v98 = {
            Size = UDim2.new(0, v9.AUDIO_ROW.ICON_SIZE, 0, v9.AUDIO_ROW.ICON_SIZE), 
            [v2.Event.MouseEnter] = v40.onPlayButtonMouseEnter, 
            [v2.Event.MouseLeave] = v40.onPlayButtonMouseLeave
        };
        v98 = if not not l_IsExpanded_0 or l_isHovered_0 or l_isPlaying_0 then v5.join(v98, {
            BackgroundColor3 = if not not l_isPlaying_0 or l_isPlayButtonHovered_0 then l_itemRow_0.pauseButtonColor else l_itemRow_0.playButtonColor, 
            BackgroundTransparency = 0, 
            Image = if l_isPlaying_0 then v22.AUDIO_PREVIEW_PAUSE else v22.AUDIO_PREVIEW_PLAY, 
            [v2.Event.MouseButton1Click] = v40.toggleIsPlayer
        }) else v5.join(v98, {
            BackgroundTransparency = 1, 
            ImageColor3 = l_itemRow_0.primaryIconColor, 
            Image = if v97 then v22.SOUND_EFFECT_ICON else v22.MUSIC_ICON
        });
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v9.AUDIO_ROW.ICON_SIZE + if v26() then v9.ITEM_ROW.LEFT_RIGHT_PADDING * 2 else v9.AUDIO_ROW.LEFT_RIGHT_PADDING * 2, 1, 0)
        }, {
            Button = v2.createElement("ImageButton", v98, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 15)
                }), 
                HoverArea = v2.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        });
    end;
    v40.renderExpandedContent = function() --[[ Line: 508 ]]
        -- upvalues: v40 (copy), v2 (ref), v21 (ref)
        local l_props_3 = v40.props;
        local l_state_1 = v40.state;
        local v101 = audioDetailsWithDefaults(l_props_3.AssetInfo.AudioDetails);
        return v2.createElement(v21, {
            AudioDetails = v101, 
            AssetInfo = l_props_3.AssetInfo, 
            IsPlaying = l_state_1.isPlaying, 
            OnAssetPreviewButtonClicked = v40.onAssetPreviewButtonClicked, 
            OnAudioEnd = v40.stopPlaying, 
            OnInsertClicked = v40.onClick
        });
    end;
end;
v33.didUpdate = function(v102, v103, v104) --[[ Line: 525 ]] --[[ Name: didUpdate ]]
    local l_state_2 = v102.state;
    local l_props_4 = v102.props;
    if l_state_2.isPlaying and not v104.isPlaying and not l_props_4.IsExpanded then
        v102:toggleIsExpanded();
    end;
    if not l_props_4.IsExpanded and v103.IsExpanded and l_state_2.isPlaying then
        v102:toggleIsPlayer();
    end;
end;
v33.render = function(v107) --[[ Line: 538 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), v20 (copy), v9 (copy)
    local l_props_5 = v107.props;
    local _ = v107.state;
    local _ = l_props_5.AssetInfo.Asset;
    local v111 = audioDetailsWithDefaults(l_props_5.AssetInfo.AudioDetails);
    if not l_props_5.AssetInfo.Creator or not l_props_5.AssetInfo.Creator.Name then
        local _ = "---";
    end;
    local l_Type_0 = v111.Type;
    local l_width_0 = l_props_5.width;
    local v115 = v25(l_Type_0, l_width_0 or 0);
    return v20.Generator({
        Columns = v107.getColumns(), 
        ExpandedHeight = v9.AUDIO_ROW.EXPANDED_ROW_HEIGHT, 
        OnHoverChanged = v107.onHoverChanged, 
        RenderExpandedContent = v107.renderExpandedContent, 
        RenderIcon = v107.renderIcon, 
        TitleSize = v115[v9.AUDIO_ROW.COLUMNS.TITLE], 
        AssetInfo = l_props_5.AssetInfo, 
        CanInsertAsset = l_props_5.CanInsertAsset, 
        InsertAsset = l_props_5.InsertAsset, 
        IsExpanded = l_props_5.IsExpanded, 
        LayoutOrder = l_props_5.LayoutOrder, 
        LogImpression = l_props_5.LogImpression, 
        OnExpanded = l_props_5.OnExpanded, 
        OnAssetPreviewButtonClicked = l_props_5.OnAssetPreviewButtonClicked, 
        ParentAbsoluteSize = l_props_5.ParentAbsoluteSize, 
        TryOpenAssetConfig = l_props_5.TryOpenAssetConfig
    });
end;
v33 = l_withContext_0({
    AssetAnalytics = v14, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Settings = v16, 
    Network = v17
})(v33);
v33 = l_withAbsoluteSizeAndPosition_0((v3.connect(function(v116, _) --[[ Line: 581 ]] --[[ Name: mapStateToProps ]]
    return {
        additionalAudioSearchInfo = v116.pageInfo and v116.pageInfo.additionalAudioSearchInfo, 
        audioSearchInfo = v116.pageInfo and v116.pageInfo.audioSearchInfo, 
        creator = v116.pageInfo and v116.pageInfo.creator
    };
end, function(v118) --[[ Line: 589 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v18 (copy)
    return {
        searchWithOptions = function(v119, v120, v121) --[[ Line: 591 ]] --[[ Name: searchWithOptions ]]
            -- upvalues: v118 (copy), v15 (ref)
            v118(v15(v119, v120, v121));
        end, 
        purchaseAsset = function(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131) --[[ Line: 594 ]] --[[ Name: purchaseAsset ]]
            -- upvalues: v118 (copy), v18 (ref)
            v118(v18(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131));
        end
    };
end)(v33)));
TypedAudioRow = function(v132, v133) --[[ Line: 628 ]] --[[ Name: TypedAudioRow ]]
    -- upvalues: v2 (copy), v33 (ref)
    return v2.createElement(v33, v132, v133);
end;
return {
    Component = v33, 
    Generator = TypedAudioRow
};