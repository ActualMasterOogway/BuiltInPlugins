local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_join_0 = require(l_script_FirstAncestor_0.Src.Util.TypedDash).join;
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v4 = require(l_script_FirstAncestor_0.Src.Components.NetworkView);
local v5 = require(l_script_FirstAncestor_0.Src.Components.InfoTile);
local v6 = require(l_script_FirstAncestor_0.Src.Components.GamePage);
local v7 = require(l_script_FirstAncestor_0.Src.Network.DiscoverTestTemplates);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_StartPageManager_0 = v8.StartPageManager;
local l_StudioService_0 = v8.StudioService;
local v11 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageStudioTestTemplates)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v12 = {
    searchKey = "TestTemplates", 
    pageSize = 30
};
local v13 = UDim2.new(0, 225, 0, 252);
local function v16(v14) --[[ Line: 31 ]] --[[ Name: CellComponent ]]
    -- upvalues: v1 (copy), v5 (copy), l_join_0 (copy), l_StartPageManager_0 (copy)
    return v1.createElement(v5, l_join_0(v14, {
        ImageSize = UDim2.new(0, 125, 0, 125), 
        IsDescriptionVisible = true, 
        OnClick = function(v15) --[[ Line: 37 ]] --[[ Name: OnClick ]]
            -- upvalues: l_StartPageManager_0 (ref)
            l_StartPageManager_0:openPlace(v15.RootPlaceId, v15.Id, false);
        end, 
        IsPrivacyVisible = false, 
        IsDateModifiedVisible = false, 
        IsDropdownMenuVisible = false
    }));
end;
local function v18(v17) --[[ Line: 47 ]] --[[ Name: TestTemplatesPageComponent ]]
    -- upvalues: v1 (copy), v4 (copy), l_join_0 (copy), v12 (copy), v16 (copy), v13 (copy), v7 (copy)
    return v1.createElement(v4, l_join_0(v17, {
        Query = v12, 
        CellComponent = v16, 
        CellSize = v13, 
        FetchItems = v7
    }));
end;
return function(_) --[[ Line: 59 ]] --[[ Name: TestTemplatesPage ]]
    -- upvalues: v11 (copy), l_StudioService_0 (copy), l_Localization_0 (copy), v1 (copy), v6 (copy), v18 (copy)
    assert(v11 and l_StudioService_0:HasInternalPermission(), "Must enabled FFlagLuaStartPageStudioTestTemplates and have internal permission to view TestTemplatesPage");
    local v20 = l_Localization_0:use();
    return v1.createElement(v6, {
        PageName = "TestTemplates", 
        Tabs = {
            {
                Title = v20:getText("Plugin", "TestTemplatesPage.Title"), 
                FailedTitle = v20:getText("Plugin", "NoTemplatesToDisplay"), 
                Key = "TestTemplates", 
                PageComponent = v18
            }
        }, 
        HideTabs = true, 
        CanSwapBetweenViews = false, 
        IsDefaultGridView = true, 
        HasSearchBar = false, 
        IsAlertVisible = false
    });
end;