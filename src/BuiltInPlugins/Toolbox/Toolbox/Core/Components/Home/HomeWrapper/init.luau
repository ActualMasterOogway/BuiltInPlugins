local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v6 = require(l_Requests_0.GetHomeConfigurationRequest);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v10 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v12 = require(l_Parent_0.Core.Types.Sort);
local v13 = require(l_Parent_0.Core.Components.Home.NavigationContainer);
local l_deepEqual_0 = require(l_Packages_0.Framework).Util.deepEqual;
local v15 = v2.Component:extend("HomeWrapper");
v15.defaultProps = {
    CategoryName = v10.FREE_MODELS.name, 
    SortName = v12.getDefaultSortNameForCategory(v10.FREE_MODELS.name)
};
v15.shouldUpdate = function(v16, v17, _) --[[ Line: 33 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: l_deepEqual_0 (copy)
    local l_props_0 = v16.props;
    local l_AssetType_0 = l_props_0.AssetType;
    local l_homeConfiguration_0 = l_props_0.homeConfiguration;
    local v22 = true;
    if l_AssetType_0 == v17.AssetType then
        v22 = not l_deepEqual_0(l_homeConfiguration_0, v17.homeConfiguration);
    end;
    return v22;
end;
v15.render = function(v23) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy)
    local l_props_1 = v23.props;
    local l_AssetType_1 = l_props_1.AssetType;
    local l_CategoryName_0 = l_props_1.CategoryName;
    local v27 = l_props_1.homeConfiguration[l_AssetType_1.Name];
    local l_SortName_0 = l_props_1.SortName;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_TryOpenAssetConfig_0 = l_props_1.TryOpenAssetConfig;
    if v27 == nil then
        return nil;
    else
        local v31 = {};
        local v32 = {};
        if v27 then
            for _, v34 in pairs(v27.sections) do
                if v34.name == "categories" and v34.subcategory ~= nil then
                    v32 = v34.subcategory.children;
                else
                    table.insert(v31, v34);
                end;
            end;
        end;
        return v2.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            BorderSizePixel = 0, 
            Position = l_props_1.Position, 
            Size = l_props_1.Size
        }, {
            Navigation = v2.createElement(v13, {
                AssetType = l_AssetType_1, 
                CategoryName = l_CategoryName_0, 
                Config = v27, 
                MaxWidth = l_props_1.MaxWidth, 
                SortName = l_SortName_0, 
                AssetSections = v31, 
                SubcategoryDict = v32, 
                TopKeywords = v27.topKeywords, 
                TryOpenAssetConfig = l_TryOpenAssetConfig_0
            })
        });
    end;
end;
v15.didMount = function(v35) --[[ Line: 88 ]] --[[ Name: didMount ]]
    for _, v37 in ipairs(v35.props.EnabledAssetTypes) do
        if v35.props.homeConfiguration[v37.Name] == nil then
            local l_networkInterface_0 = v35.props.Network.networkInterface;
            v35.props.getHomeConfigurationRequest(l_networkInterface_0, v37, v35.props.Locale);
        end;
    end;
end;
v15 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v9
})(v15);
return v3.connect(function(v39, _) --[[ Line: 102 ]] --[[ Name: mapStateToProps ]]
    return {
        homeConfiguration = (v39 or {}).homeConfiguration or {}
    };
end, function(v41) --[[ Line: 110 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy)
    return {
        getHomeConfigurationRequest = function(v42, v43, v44) --[[ Line: 112 ]] --[[ Name: getHomeConfigurationRequest ]]
            -- upvalues: v41 (copy), v6 (ref)
            v41(v6(v42, v43, v44));
        end
    };
end)(v15);