local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Src.Util;
local v8 = require(l_Util_0.Constants);
local l_SelectInput_0 = v4.UI.SelectInput;
local l_map_0 = v4.Dash.map;
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v12 = require(l_Thunks_0.GetMyGroupsRequest);
local v13 = require(l_Parent_0.Src.ContextServices.NetworkContext);
local v14 = v2.PureComponent:extend("ConfigAccess");
local v15 = game:DefineFastFlag("FixConvertToPackageAssert", false);
v14.didMount = function(v16) --[[ Line: 38 ]] --[[ Name: didMount ]]
    v16.props.getMyGroups(v16.props.Network:get());
end;
v14.init = function(v17) --[[ Line: 43 ]] --[[ Name: init ]]
    v17.createContentForSelectInput = function(v18) --[[ Line: 44 ]]
        return {
            creatorId = v18.creatorId, 
            creatorType = v18.creatorType, 
            Id = v18.name, 
            item = v18, 
            Key = v18.Key, 
            Label = v18.name, 
            name = v18.name, 
            Text = v18.Text
        };
    end;
end;
v14.render = function(v19) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v15 (copy), v2 (copy), l_SelectInput_0 (copy), l_map_0 (copy)
    local l_props_0 = v19.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local v26 = l_props_0.owner or {};
    local l_onDropDownSelect_0 = l_props_0.onDropDownSelect;
    v19.dropdownContent = v8.getOwnerDropDownContent(l_props_0.groupsArray, l_Localization_0);
    local v28 = nil;
    for v29, v30 in pairs(v19.dropdownContent) do
        if v30.creatorId == v26.creatorId then
            v28 = v29;
        end;
    end;
    if v15 and not v28 then
        v28 = 1;
    end;
    assert(v28);
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v32 = nil;
    v32 = (not (#v19.dropdownContent >= v28) or game.CreatorType == Enum.CreatorType.Group and #v19.dropdownContent == 1) and "" or v19.dropdownContent[v28].Text;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.fromRGB(227, 227, 227), 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v8.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            Font = v8.FONT, 
            LayoutOrder = 1
        }), 
        DropdownMenu = v2.createElement(l_SelectInput_0, {
            Items = l_map_0(v19.dropdownContent, v19.createContentForSelectInput), 
            LayoutOrder = 2, 
            OnItemActivated = l_onDropDownSelect_0, 
            PlaceholderText = v32, 
            SelectedIndex = v19.dropdownContent[v28].Key, 
            Size = UDim2.new(0, 220, 0, 38), 
            Width = 220
        })
    });
end;
v14 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v13, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14);
return v3.connect(function(v33, _) --[[ Line: 150 ]] --[[ Name: mapStateToProps ]]
    return {
        groupsArray = (v33 or {}).GroupReducer.groupsArray or {}
    };
end, function(v35) --[[ Line: 158 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy)
    return {
        getMyGroups = function(v36) --[[ Line: 160 ]] --[[ Name: getMyGroups ]]
            -- upvalues: v35 (copy), v12 (ref)
            v35(v12(v36));
        end
    };
end)(v14);