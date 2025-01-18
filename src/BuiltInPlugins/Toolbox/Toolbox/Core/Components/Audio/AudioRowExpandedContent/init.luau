local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_Pane_0 = v4.UI.Pane;
local l_TextLabel_0 = v4.UI.TextLabel;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.LayoutOrderIterator);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v14 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v15 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v16 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioPlayer);
local v17 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioRowInsertButton);
local v18 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRowMetadata);
local v19 = require(l_script_FirstAncestor_0.Core.Components.Asset.Preview.PopUpWrapperButton);
local v20 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v21 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v23 = v2.PureComponent:extend("AudioRowExpandedContent");
v23.defaultProps = {
    Size = UDim2.new(1, 0, 0, 26)
};
v23.init = function(v24) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v9 (copy)
    v24.searchBy = function(v25) --[[ Line: 73 ]]
        -- upvalues: v24 (copy), v5 (ref)
        local l_props_0 = v24.props;
        local l_networkInterface_0 = l_props_0.Network.networkInterface;
        local v28 = l_props_0.Settings:get("Plugin");
        local l_audioSearchInfo_0 = l_props_0.audioSearchInfo;
        local l_creator_0 = l_props_0.creator;
        local l_additionalAudioSearchInfo_0 = l_props_0.additionalAudioSearchInfo;
        local v32 = {
            Creator = l_creator_0, 
            AudioSearch = l_audioSearchInfo_0, 
            AdditionalAudioSearch = v5.join(l_additionalAudioSearchInfo_0, v25)
        };
        v24.props.searchWithOptions(l_networkInterface_0, v28, v32);
    end;
    v24.onSearchByCategories = function() --[[ Line: 91 ]]
        -- upvalues: v24 (copy), v9 (ref)
        local l_AudioDetails_0 = v24.props.AssetInfo.AudioDetails;
        local v34 = {};
        if l_AudioDetails_0.SoundEffectCategory then
            table.insert(v34, l_AudioDetails_0.SoundEffectCategory);
            if l_AudioDetails_0.SoundEffectSubcategory then
                table.insert(v34, l_AudioDetails_0.SoundEffectSubcategory);
            end;
        end;
        v24.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.CATEGORIES] = v34
        });
    end;
    v24.onSearchByAlbum = function() --[[ Line: 104 ]]
        -- upvalues: v24 (copy), v9 (ref)
        local l_AudioDetails_1 = v24.props.AssetInfo.AudioDetails;
        v24.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST] = l_AudioDetails_1.Artist, 
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ALBUM] = l_AudioDetails_1.MusicAlbum
        });
    end;
    v24.onSearchByCreator = function() --[[ Line: 113 ]]
        -- upvalues: v24 (copy)
        local l_props_1 = v24.props;
        local l_networkInterface_1 = l_props_1.Network.networkInterface;
        local v38 = l_props_1.Settings:get("Plugin");
        local v39 = {
            Creator = if l_props_1.AssetInfo.Creator then l_props_1.AssetInfo.Creator.Name else nil, 
            AudioSearch = l_props_1.audioSearchInfo, 
            AdditionalAudioSearch = l_props_1.additionalAudioSearchInfo
        };
        l_props_1.searchWithOptions(l_networkInterface_1, v38, v39);
    end;
end;
v23.render = function(v40) --[[ Line: 129 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v10 (copy), v2 (copy), l_Pane_0 (copy), v21 (copy), v9 (copy), v16 (copy), l_TextLabel_0 (copy), v19 (copy), v17 (copy), v18 (copy)
    local l_props_2 = v40.props;
    local l_Localization_0 = l_props_2.Localization;
    local l_itemRow_0 = l_props_2.Stylizer.itemRow;
    local l_AudioDetails_2 = l_props_2.AudioDetails;
    local v45 = if l_props_2.AssetInfo.Creator then l_props_2.AssetInfo.Creator.Name else "---";
    local l_IsPlaying_0 = l_props_2.IsPlaying;
    local l_Asset_0 = l_props_2.AssetInfo.Asset;
    local l_Id_0 = l_Asset_0.Id;
    local v49 = l_Asset_0.Description or "---";
    local l_SoundEffectCategory_0 = l_AudioDetails_2.SoundEffectCategory;
    local l_Type_0 = l_AudioDetails_2.Type;
    local v52 = l_Type_0 == v15.SOUND_EFFECTS.name;
    local v53 = l_Type_0 == v15.MUSIC.name;
    local l_Artist_0 = l_AudioDetails_2.Artist;
    local l_MusicAlbum_0 = l_AudioDetails_2.MusicAlbum;
    local v56 = "";
    if l_Artist_0 ~= "---" then
        v56 = l_Artist_0;
    end;
    if l_MusicAlbum_0 ~= "---" then
        if v56 ~= "" then
            v56 = v56 .. " - ";
        end;
        v56 = v56 .. l_MusicAlbum_0;
    end;
    local v57 = v10.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Size = l_props_2.Size
    }, {
        AudioPlayerFrame = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v57:getNextOrder(), 
            Padding = {
                Left = 4, 
                Right = if v21() then v9.ITEM_ROW.LEFT_RIGHT_PADDING else v9.AUDIO_ROW.LEFT_RIGHT_PADDING
            }, 
            Size = UDim2.new(1, 0, 0, 26), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            AudioPlayer = v2.createElement(v16, {
                SoundId = l_Id_0, 
                IsPlaying = l_IsPlaying_0, 
                OnEnd = l_props_2.OnAudioEnd
            })
        }), 
        AdditionalMusicDetails = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v57:getNextOrder(), 
            Padding = {
                Left = 10, 
                Right = 10
            }
        }, {
            DescriptionContainer = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v57:getNextOrder(), 
                Spacing = 10, 
                Size = UDim2.new(1, 0, 0, 26)
            }, {
                Description = v2.createElement(l_TextLabel_0, {
                    LayoutOrder = v57:getNextOrder(), 
                    Size = UDim2.new(1, -80, 1, 0), 
                    Text = v49, 
                    TextColor = l_itemRow_0.textColor, 
                    TextSize = v9.FONT_SIZE_MEDIUM, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                AssetPreview = v2.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v57:getNextOrder(), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Size = UDim2.new(0, 26, 0, 26), 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    PopUpWrapperButton = v2.createElement(v19, {
                        HoverSize = UDim2.new(0, 26, 0, 26), 
                        onClick = l_props_2.OnAssetPreviewButtonClicked, 
                        ShowIcon = true, 
                        Size = UDim2.new(0, 20, 0, 20)
                    })
                }), 
                Insert = v2.createElement(v17, {
                    LayoutOrder = v57:getNextOrder(), 
                    OnClick = l_props_2.OnInsertClicked
                })
            }), 
            AlbumContainer = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v57:getNextOrder(), 
                Spacing = 10, 
                Padding = {
                    Left = 5, 
                    Right = 5
                }, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                AlbumArist = if v53 then v2.createElement(v18, {
                    LayoutOrder = v57:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("AudioView", "AlbumArtist"):upper(), 
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    Text = v56, 
                    OnClick = v40.onSearchByAlbum
                }) else nil, 
                Category = if v52 then v2.createElement(v18, {
                    LayoutOrder = v57:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("AudioView", "Category"):upper(), 
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    Text = l_SoundEffectCategory_0, 
                    OnClick = v40.onSearchByCategories
                }) else nil, 
                UploadBy = v2.createElement(v18, {
                    LayoutOrder = v57:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("AudioView", "UploadedBy"):upper(), 
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    Text = v45, 
                    OnClick = v40.onSearchByCreator
                })
            })
        })
    });
end;
local function v60(v58, _) --[[ Line: 275 ]] --[[ Name: mapStateToProps ]]
    return {
        additionalAudioSearchInfo = v58.pageInfo and v58.pageInfo.additionalAudioSearchInfo, 
        audioSearchInfo = v58.pageInfo and v58.pageInfo.audioSearchInfo, 
        creator = v58.pageInfo and v58.pageInfo.creator
    };
end;
local function v65(v61) --[[ Line: 283 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy)
    return {
        searchWithOptions = function(v62, v63, v64) --[[ Line: 285 ]] --[[ Name: searchWithOptions ]]
            -- upvalues: v61 (copy), v20 (ref)
            v61(v20(v62, v63, v64));
        end
    };
end;
v23 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v13, 
    Settings = v14, 
    Stylizer = l_ContextServices_0.Stylizer
})(v23);
return (v3.connect(v60, v65)(v23));