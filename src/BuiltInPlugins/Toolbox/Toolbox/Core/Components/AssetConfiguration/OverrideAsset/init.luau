local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v5 = require(l_AssetConfiguration_0.OverrideAssetView);
local v6 = require(l_Parent_0.Core.Components.DropdownMenu);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.AssetConfigUtil);
local v10 = require(l_Util_0.getUserId);
local v11 = require(l_Util_0.AssetConfigConstants);
local v12 = require(l_Packages_0.Framework);
local l_DEPRECATED_TextInput_0 = v12.UI.DEPRECATED_TextInput;
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v16 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v18 = require(l_Requests_0.GetOverrideAssetRequest);
local v19 = require(l_Requests_0.GetAssetConfigManageableGroupsRequest);
local v20 = require(l_Parent_0.Core.Actions.UpdateAssetConfigStore);
local v21 = v2.PureComponent:extend("OverrideAsset");
v21.init = function(v22, _) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v22.dropdownContent = {
        {
            name = "Me", 
            creatorType = "User", 
            creatorId = v10()
        }
    };
    v22.groupAdded = false;
    v22.state = {
        selectIndex = 1, 
        selectItem = v22.dropdownContent[1], 
        filterID = ""
    };
    v22.onFilterIDChanged = function(v24) --[[ Line: 68 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            filterID = v24
        });
    end;
    v22.onDropDownSelect = function(v25) --[[ Line: 74 ]]
        -- upvalues: v22 (copy)
        local v26 = v22.dropdownContent[v25];
        v22.props.updateStore({
            fetchedAll = false, 
            loadingPage = 0, 
            overrideCursor = ""
        });
        v22.props.getOverrideAssets(v22.props.Network.networkInterface, v22.props.assetTypeEnum, v26.creatorType, v26.creatorId, 1);
        v22:setState({
            selectIndex = v25, 
            selectItem = v26
        });
    end;
    v22.getOverrideAssetsFunc = function(v27) --[[ Line: 97 ]]
        -- upvalues: v22 (copy)
        local l_selectItem_0 = v22.state.selectItem;
        v22.props.getOverrideAssets(v22.props.Network.networkInterface, v22.props.assetTypeEnum, l_selectItem_0.creatorType, l_selectItem_0.creatorId, v27);
    end;
end;
v21.didMount = function(v29) --[[ Line: 109 ]] --[[ Name: didMount ]]
    local v30 = v29.dropdownContent[1];
    v29.props.getOverrideAssets(v29.props.Network.networkInterface, v29.props.assetTypeEnum, v30.creatorType, v30.creatorId, 1);
    v29.props.getManageableGroups(v29.props.Network.networkInterface);
end;
v21.render = function(v31) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v11 (copy), v2 (copy), v8 (copy), v6 (copy), l_DEPRECATED_TextInput_0 (copy), v5 (copy)
    local l_props_0 = v31.props;
    local l_state_0 = v31.state;
    local l_assetConfig_0 = l_props_0.Stylizer.assetConfig;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Size_0 = l_props_0.Size;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_instances_0 = l_props_0.instances;
    local l_onOverrideAssetSelected_0 = l_props_0.onOverrideAssetSelected;
    local l_resultsArray_0 = l_props_0.resultsArray;
    local l_selectIndex_0 = l_state_0.selectIndex;
    v31.dropdownContent = v9.getOwnerDropDownContent(l_props_0.manageableGroups, l_props_0.Localization);
    local v42 = l_assetTypeEnum_0 == Enum.AssetType.Animation;
    local v43 = v42 and v11.FLOW_TYPE.DOWNLOAD_FLOW == l_props_0.screenFlowType;
    local l_filterID_0 = l_state_0.filterID;
    local v45 = false;
    if l_filterID_0 then
        v45 = utf8.len(l_filterID_0) > 10;
    end;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 46), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 46)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        }), 
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = if v43 then l_props_0.Localization:getText("AssetConfigFooter", "ImportTitle") else l_props_0.Localization:getText("AssetConfigFooter", "OverrideTitle"), 
            Font = v8.FONT, 
            TextSize = v8.FONT_SIZE_LARGE, 
            TextColor3 = l_assetConfig_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 1
        }), 
        DropdownAndAnimationIdContainer = v42 and v2.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -20, 0, 40)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            DropdownMenu = v2.createElement(v6, {
                Size = UDim2.new(0, 336, 0, 40), 
                selectedDropDownIndex = l_selectIndex_0, 
                rowHeight = 40, 
                items = v31.dropdownContent, 
                onItemClicked = v31.onDropDownSelect, 
                LayoutOrder = 1
            }), 
            AnimationIdFilter = not v43 and v2.createElement("Frame", {
                Size = UDim2.new(1, -336, 0, 90), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                TextField = v2.createElement(l_DEPRECATED_TextInput_0, {
                    OnTextChanged = v31.onFilterIDChanged, 
                    PlaceholderText = l_props_0.Localization:getText("AssetConfigAnimation", "FilterID"), 
                    Size = UDim2.new(1, -v11.TITLE_GUTTER_WIDTH, 0, 40), 
                    Style = v45 and "FilledRoundedRedBorder" or "FilledRoundedBorder", 
                    Text = l_filterID_0
                })
            })
        }), 
        DropdownMenu = not v42 and v2.createElement(v6, {
            Size = UDim2.new(0, 336, 0, 40), 
            selectedDropDownIndex = l_selectIndex_0, 
            rowHeight = 40, 
            items = v31.dropdownContent, 
            onItemClicked = v31.onDropDownSelect, 
            LayoutOrder = 2
        }), 
        ScrollingItems = v2.createElement(v5, {
            Size = UDim2.new(1, 0, 1, -70), 
            assetTypeEnum = l_assetTypeEnum_0, 
            instances = l_instances_0, 
            resultsArray = l_resultsArray_0, 
            onOverrideAssetSelected = l_onOverrideAssetSelected_0, 
            getOverrideAssets = v31.getOverrideAssetsFunc, 
            filterID = l_state_0.filterID, 
            LayoutOrder = 3
        })
    });
end;
local function v48(v46, _) --[[ Line: 265 ]] --[[ Name: mapStateToProps ]]
    v46 = v46 or {};
    return {
        totalResults = v46.totalResults, 
        resultsArray = v46.resultsArray, 
        manageableGroups = v46.manageableGroups or {}, 
        assetTypeEnum = v46.assetTypeEnum, 
        screenFlowType = v46.screenFlowType
    };
end;
local function v57(v49) --[[ Line: 280 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy), v20 (copy)
    return {
        getOverrideAssets = function(v50, v51, v52, v53, v54) --[[ Line: 282 ]] --[[ Name: getOverrideAssets ]]
            -- upvalues: v49 (copy), v18 (ref)
            v49(v18(v50, v51, v52, v53, v54));
        end, 
        getManageableGroups = function(v55) --[[ Line: 286 ]] --[[ Name: getManageableGroups ]]
            -- upvalues: v49 (copy), v19 (ref)
            v49(v19(v55));
        end, 
        updateStore = function(v56) --[[ Line: 290 ]] --[[ Name: updateStore ]]
            -- upvalues: v49 (copy), v20 (ref)
            v49(v20(v56));
        end
    };
end;
v21 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v16
})(v21);
return v3.connect(v48, v57)(v21);