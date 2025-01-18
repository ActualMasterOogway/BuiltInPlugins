local _ = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Cryo);
local v6 = require(l_Packages_0.Framework);
local v7 = require(l_Parent_0.Core.Util.Constants);
local v8 = require(l_Parent_0.Core.Util.Layouter);
local v9 = require(l_Parent_0.Core.Types.Category);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.Settings);
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v14 = require(l_Parent_0.Core.Components.AssetGridContainer);
local _ = require(l_Parent_0.Core.Components.InfoBanner);
local _ = require(l_Parent_0.Core.Components.NoResultsDetail);
local v17 = require(l_Packages_0.Dash);
local l_LoadingIndicator_0 = v6.UI.LoadingIndicator;
local l_Pane_0 = v6.UI.Pane;
local l_withAbsoluteSizeAndPosition_0 = v6.Wrappers.withAbsoluteSizeAndPosition;
local v21 = require(l_Parent_0.Core.Components.MainView.MainViewHeader);
local _ = require(l_Parent_0.Core.Components.Toast);
local v23 = require(l_Parent_0.Core.Networking.Requests.NextPageRequest);
local v24 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v25 = require(l_Parent_0.Core.Components.Font.FontView);
local v26 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v27 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v28 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v29 = v3.PureComponent:extend("MainView");
v29.init = function(v30, _) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v30.headerHeight = 0;
    v30.containerWidth = 0;
    v30.scrollingFrameRef = v3.createRef();
    v30.requestNextPage = function() --[[ Line: 81 ]]
        -- upvalues: v30 (copy)
        local l_networkInterface_0 = v30.props.Network.networkInterface;
        local v33 = v30.props.Settings:get("Plugin");
        v30.props.nextPage(l_networkInterface_0, v33);
    end;
end;
v29.render = function(v34) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v7 (copy), v27 (copy), v26 (copy), v24 (copy), v8 (copy), v17 (copy), v3 (copy), l_Pane_0 (copy), v21 (copy), v25 (copy), v14 (copy), v28 (copy), l_LoadingIndicator_0 (copy)
    local l_props_0 = v34.props;
    local v36 = l_props_0.Position or UDim2.new(0, 0, 0, 0);
    local v37 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local l_categoryName_0 = l_props_0.categoryName;
    local v39 = v9.categoryIsFont(l_categoryName_0);
    local v40 = l_props_0.isLoading or false;
    local v41 = l_props_0.maxWidth or 0;
    local v42 = l_props_0.networkErrors or {};
    local _ = v42[#v42];
    local l_includeUnverifiedCreators_0 = l_props_0.includeUnverifiedCreators;
    local v45 = v41 - 2 * v7.MAIN_VIEW_PADDING - v7.SCROLLBAR_PADDING;
    local v46 = l_props_0.creator and l_props_0.creator.Name;
    local l_searchTerm_0 = l_props_0.searchTerm;
    local v48 = false;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    if v27() then
        local v52 = true;
        if l_includeUnverifiedCreators_0 ~= true then
            v52 = true;
            if v46 == nil then
                v52 = v26() and next(l_props_0.creatorTargetIds) ~= nil or v26() and next(l_props_0.groupTargetIds) ~= nil or l_props_0.audioSearchInfo ~= nil or l_props_0.additionalAudioSearchInfo ~= nil or l_props_0.uiSortIntent ~= nil;
            end;
        end;
        v51 = v52;
        v48 = #l_searchTerm_0 > 0;
        v52 = false;
        if l_props_0.correctionState == v24.AutocorrectResponseState.CorrectionAvailable then
            v52 = l_props_0.correctedQuery ~= "";
        end;
        local v53 = false;
        if l_props_0.correctionState == v24.AutocorrectResponseState.CorrectionAccepted then
            v53 = l_props_0.userQuery ~= "";
        end;
        local v54 = v52 or v53;
        local v55, v56 = v8.calculateMainViewHeaderHeight(v51, nil, nil, nil, v48, v54);
        v49 = v55;
        v50 = v56;
    else
        local v57 = true;
        if l_includeUnverifiedCreators_0 ~= true then
            v57 = true;
            if v46 == nil then
                v57 = v26() and next(l_props_0.creatorTargetIds) ~= nil or v26() and next(l_props_0.groupTargetIds) ~= nil or #l_searchTerm_0 > 0 or l_props_0.audioSearchInfo ~= nil or l_props_0.additionalAudioSearchInfo ~= nil;
            end;
        end;
        v51 = v57;
        local v58;
        v57, v58 = v8.calculateMainViewHeaderHeight(v51, nil, nil, nil);
        v49 = v57;
        v50 = v58;
    end;
    local l_tryOpenAssetConfig_0 = l_props_0.tryOpenAssetConfig;
    v34.containerWidth = v45;
    v34.headerHeight = v49;
    local v60 = v17.join({
        Position = v36, 
        Size = v37, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, l_props_0.WrapperProps);
    return v3.createElement(l_Pane_0, v60, {
        ScrollingFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v7.MAIN_VIEW_PADDING), 
                PaddingLeft = UDim.new(0, v7.MAIN_VIEW_PADDING), 
                PaddingRight = UDim.new(0, v7.MAIN_VIEW_PADDING), 
                PaddingTop = UDim.new(0, v7.MAIN_VIEW_PADDING)
            }), 
            Header = v3.createElement(v21, {
                containerWidth = v45, 
                showTags = v51 or v48, 
                onBackToHome = l_props_0.onBackToHome, 
                headerHeight = v49
            })
        }), 
        AssetGridContainerNew = if v39 then v3.createElement(v25, {
            CategoryName = l_categoryName_0, 
            IncludeUnverifiedCreators = l_includeUnverifiedCreators_0, 
            NoResultsPosition = UDim2.new(0, 0, 0, if v26() then 16 + v49 + v50 else 16 + v49), 
            Position = UDim2.new(0, 0, 0, v49 + v50), 
            Size = UDim2.new(1, 0, 1, v49 - v50), 
            TryOpenAssetConfig = l_tryOpenAssetConfig_0
        }) else v3.createElement(v14, {
            NoResultsPosition = UDim2.new(0, 0, 0, if v26() then 16 + v49 + v50 else 16 + v49), 
            OnSearchByCreator = if v28() then l_props_0.OnSearchByCreator else nil, 
            ParentAbsoluteSize = l_props_0.AbsoluteSize, 
            ParentAbsolutePosition = l_props_0.AbsolutePosition, 
            Position = UDim2.new(0, 0, 0, v49 + v50), 
            Size = UDim2.new(1, 0, 1, -v49 - v50), 
            TryOpenAssetConfig = l_tryOpenAssetConfig_0
        }), 
        LoadingIndicator = v40 and not v39 and v3.createElement(l_LoadingIndicator_0, {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -16), 
            Size = UDim2.new(0, 92, 0, 24), 
            ZIndex = 3
        }), 
        NetworkError = false
    });
end;
v29 = l_withContext_0({
    Settings = v12, 
    Localization = l_ContextServices_0.Localization, 
    Network = v13
})(v29);
return l_withAbsoluteSizeAndPosition_0((v4.connect(function(v61, _) --[[ Line: 233 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v9 (copy), v26 (copy), v5 (copy), v27 (copy)
    v61 = v61 or {};
    local v63 = v61.assets or {};
    local v64 = v61.pageInfo or {};
    return {
        isLoading = v63.isLoading or false, 
        networkErrors = v61.networkErrors or {}, 
        audioSearchInfo = v64.audioSearchInfo, 
        additionalAudioSearchInfo = v64.additionalAudioSearchInfo, 
        categoryName = v64.categoryName or v9.DEFAULT.name, 
        searchTerm = v64.searchTerm or "", 
        creator = v64.creator, 
        creatorTargetIds = if v26() and v64.creatorTargetIds and v64.creatorTargetIds ~= v5.None then v64.creatorTargetIds else {}, 
        groupTargetIds = if v26() and v64.groupTargetIds and v64.groupTargetIds ~= v5.None then v64.groupTargetIds else {}, 
        includeUnverifiedCreators = v64.includeUnverifiedCreators, 
        uiSortIntent = v64.uiSortIntent, 
        correctionState = if v27() then v64.correctionState else nil
    };
end, function(v65) --[[ Line: 265 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v23 (copy)
    return {
        nextPage = function(v66, v67) --[[ Line: 267 ]] --[[ Name: nextPage ]]
            -- upvalues: v65 (copy), v23 (ref)
            v65(v23(v66, v67));
        end
    };
end)(v29)));