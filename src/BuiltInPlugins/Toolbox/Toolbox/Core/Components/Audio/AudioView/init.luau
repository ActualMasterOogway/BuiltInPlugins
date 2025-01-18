local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local v5 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local v6 = require(l_script_FirstAncestor_0.Core.Components.Categorization.Swimlane);
local v7 = require(l_script_FirstAncestor_0.Core.Components.Categorization.IconTile);
local v8 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SectionHeader);
local v9 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScrollerWrapper);
local v10 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioSort);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local l_Pane_0 = v2.UI.Pane;
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local v17 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAudioUpdateLandingPage);
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v3.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local v19 = UDim2.fromOffset(100, 100);
local v20 = UDim2.fromOffset(210, 100);
local v21 = UDim2.fromOffset(100, 80);
local v22 = UDim2.fromOffset(100, 17);
local l_DISCOVER_NEW_AUDIO_SWIMLANE_NAME_0 = v3.DISCOVER_NEW_AUDIO_SWIMLANE_NAME;
return function(v24) --[[ Line: 43 ]] --[[ Name: AudioView ]]
    -- upvalues: l_Stylizer_0 (copy), v5 (copy), v1 (copy), v4 (copy), l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 (copy), v17 (copy), l_DISCOVER_NEW_AUDIO_SWIMLANE_NAME_0 (copy), v20 (copy), v22 (copy), v21 (copy), v7 (copy), v19 (copy), v6 (copy), v10 (copy), v8 (copy), l_Pane_0 (copy), v9 (copy), l_ScrollingFrame_0 (copy), v3 (copy)
    local v25 = l_Stylizer_0:use();
    local v26 = v5.new();
    local v28 = v1.useCallback(function(v27) --[[ Line: 47 ]]
        -- upvalues: v24 (copy)
        if v24.OnSeeAllActivated then
            v24.OnSeeAllActivated(v27);
        end;
    end, {
        v24.OnSeeAllActivated
    });
    local v29 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v24 (copy)
        return v24.Sections[#v24.Sections];
    end, {
        v24.Sections
    });
    local v30 = v1.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v29 (copy)
        return v29.Section.subcategory == nil;
    end, {
        v29
    });
    local v37 = v1.useCallback(function(v31, v32) --[[ Line: 61 ]]
        -- upvalues: v4 (ref), l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 (ref), v17 (ref), l_DISCOVER_NEW_AUDIO_SWIMLANE_NAME_0 (ref), v20 (ref), v25 (copy), v22 (ref), v21 (ref), v1 (ref), v7 (ref), v24 (copy), v19 (ref)
        local v33 = nil;
        local v34 = nil;
        if v31.thumbnail then
            if v31.thumbnail.assetId then
                v33 = v4.constructAssetThumbnailUrl(v31.thumbnail.assetId, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
            end;
            if v31.thumbnail.backgroundColor then
                pcall(function() --[[ Line: 74 ]]
                    -- upvalues: v34 (ref), v31 (copy)
                    v34 = Color3.fromHex(v31.thumbnail.backgroundColor);
                end);
            end;
        end;
        local v35 = v17() and v32.Section.name == l_DISCOVER_NEW_AUDIO_SWIMLANE_NAME_0;
        local v36 = {};
        if v35 then
            v36.Size = v20;
            v36.ContentsLayoutOverride = true;
            v36.ContentsPadding = v25.wideIconButtonPadding;
            v36.ImagePosition = v22;
            v36.ImageSize = v21;
        end;
        return v1.createElement(v7, {
            BackgroundColor = v34, 
            ContentsLayoutOverride = if v35 then v36.ContentsLayoutOverride else nil, 
            ContentsPadding = if v35 then v36.ContentsPadding else nil, 
            Image = v33, 
            ImagePosition = if v35 then v36.ImagePosition else nil, 
            ImageSize = if v35 then v36.ImageSize else nil, 
            Key = v31.name, 
            LayoutOrder = v31.index, 
            OnClick = function() --[[ Line: 100 ]] --[[ Name: OnClick ]]
                -- upvalues: v24 (ref), v31 (copy), v32 (copy)
                if v24.OnSwimlaneTileActivated then
                    v24.OnSwimlaneTileActivated(v31, v32);
                end;
            end, 
            Size = if v35 then v36.Size else v19, 
            Title = v31.displayName
        });
    end, {
        v24.OnSwimlaneTileActivated
    });
    local v49 = v1.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v24 (copy), v29 (copy), v30 (copy), v1 (ref), v6 (ref), v26 (copy), v37 (copy), v28 (copy), v10 (ref), v8 (ref)
        local v38 = {};
        for _, v40 in v24.Sections do
            local l_subcategory_0 = v40.Section.subcategory;
            if v40.ResultsState then
                local _ = v40.ResultsState.loading;
            end;
            local v43 = nil;
            if v40 ~= v29 or not v30 then
                if l_subcategory_0 and not l_subcategory_0.hidden then
                    local v44 = {};
                    for _, v46 in l_subcategory_0.children do
                        table.insert(v44, v46);
                    end;
                    v43 = v1.createElement(v6, {
                        Data = v44, 
                        IsLoading = false, 
                        LayoutOrder = v26:getNextOrder(), 
                        OnRenderItem = function(_, v48) --[[ Line: 133 ]] --[[ Name: OnRenderItem ]]
                            -- upvalues: v37 (ref), v40 (copy)
                            return v37(v48, v40);
                        end, 
                        OnClickSeeAll = function() --[[ Line: 136 ]] --[[ Name: OnClickSeeAll ]]
                            -- upvalues: v28 (ref), v40 (copy)
                            v28(v40);
                        end, 
                        Title = v40.Section.displayName
                    });
                else
                    v43 = v1.createElement(v10, {
                        AssetLogicWrapperProps = v24.AssetLogicWrapperProps, 
                        AudioSection = v40, 
                        LayoutOrder = v26:getNextOrder(), 
                        OnSeeAllActivated = function() --[[ Line: 146 ]] --[[ Name: OnSeeAllActivated ]]
                            -- upvalues: v28 (ref), v40 (copy)
                            v28(v40);
                        end
                    });
                end;
                v38[v40.Section.displayName] = v43;
            end;
        end;
        if v30 then
            v38.LastSortHeader = v1.createElement(v8, {
                LayoutOrder = v26:getNextOrder(), 
                ShowSeeAllText = false, 
                Title = v29.Section.displayName
            });
        end;
        return v38;
    end, {
        v24.Sections, 
        v24.AssetLogicWrapperProps, 
        v29, 
        v30, 
        v37, 
        v28
    });
    local v50 = v1.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v1 (ref), l_Pane_0 (ref), v25 (copy), v49 (copy)
        return v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, v25.spacingUnit)
        }, v49);
    end, {
        v49
    });
    if v30 then
        if v29.ResultsState then
            return v1.createElement(v9, {
                AssetLogicWrapperProps = v24.AssetLogicWrapperProps, 
                PageSize = v24.PageSize, 
                RenderTopContent = v50, 
                ResultsState = v29.ResultsState, 
                SwimlaneName = v29.Section.name
            });
        else
            return nil;
        end;
    else
        return v1.createElement(l_Pane_0, {
            BackgroundColor = v25.homeView.backgroundColor
        }, {
            ScrollingFrame = v1.createElement(l_ScrollingFrame_0, {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromScale(1, 0), 
                Layout = Enum.FillDirection.Vertical, 
                Padding = v3.SCROLLING_FRAME_VIEW_PADDING, 
                Spacing = UDim.new(0, v25.spacingUnit)
            }, v49)
        });
    end;
end;