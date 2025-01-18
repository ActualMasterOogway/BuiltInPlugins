local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactNavigation);
local v3 = require(l_Parent_0.Src.Components.Navigation.NavigatableView);
local v4 = require(l_Parent_0.Src.Components.ManagementMainView);
local v5 = require(l_Parent_0.Src.Components.PluginDetails.PluginDetailsView);
local v6 = require(l_Parent_0.Src.Util.Constants);
local _ = function(v7) --[[ Line: 14 ]] --[[ Name: wrapAppPageForRN ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    return function(_) --[[ Line: 15 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (ref), v7 (copy)
        return v2.withNavigation(function(v9, v10) --[[ Line: 16 ]]
            -- upvalues: v1 (ref), v3 (ref), v7 (ref)
            return v1.createElement(v3, {
                navigation = v9
            }, v7(v9, v10));
        end);
    end;
end;
local v12 = {};
local l_Main_0 = v6.APP_PAGE.Main;
local function v16(v14, _) --[[ Line: 26 ]]
    -- upvalues: v1 (copy), v4 (copy)
    return v1.createElement(v4, {
        navigation = v14
    });
end;
local l_v16_0 = v16 --[[ copy: 11 -> 12 ]];
v12[l_Main_0] = function(_) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), l_v16_0 (copy)
    return v2.withNavigation(function(v19, v20) --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v3 (ref), l_v16_0 (ref)
        return v1.createElement(v3, {
            navigation = v19
        }, l_v16_0(v19, v20));
    end);
end;
l_Main_0 = v6.APP_PAGE.Detail;
v16 = function(v21, _) --[[ Line: 31 ]]
    -- upvalues: v1 (copy), v5 (copy)
    local v23 = v21.getParam("assetId");
    return v1.createElement(v5, {
        assetId = v23, 
        navigation = v21, 
        Size = UDim2.new(1, 0, 1, 0)
    });
end;
v12[l_Main_0] = function(_) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v16 (copy)
    return v2.withNavigation(function(v25, v26) --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v3 (ref), v16 (ref)
        return v1.createElement(v3, {
            navigation = v25
        }, v16(v25, v26));
    end);
end;
l_Main_0 = v2.createStackNavigator({
    routes = v12, 
    initialRouteName = v6.APP_PAGE.Main
});
return v2.createAppContainer(l_Main_0);