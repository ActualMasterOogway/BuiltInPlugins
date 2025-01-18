local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPagePlaceOpenAttributionTelemetry)();
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v7 = if v2 then require(l_script_FirstAncestor_0.Src.Components.NetworkView) else require(l_script_FirstAncestor_0.Src.Components.DEPRECATED_NetworkView);
local v8 = require(l_script_FirstAncestor_0.Src.Components.InfoTile);
local v9 = require(l_script_FirstAncestor_0.Src.Components.GamePage);
local v10 = if v2 then require(l_script_FirstAncestor_0.Src.Network.DiscoverExperiences) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverExperiences);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v12 = game:DefineFastFlag("FixPSCMissingUniverseIdFromLuaStartPage", false);
local v13 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v14 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v15 = {
    searchKey = "Templates", 
    search = "All", 
    isTemplates = true, 
    pageSize = 20
};
local v16 = UDim2.new(0, 225, 0, 252);
local function v20(v17) --[[ Line: 66 ]] --[[ Name: CellComponent ]]
    -- upvalues: v13 (copy), v1 (copy), v8 (copy), l_join_0 (copy), v12 (copy), l_StartPageManager_0 (copy), v4 (copy), v14 (copy)
    local v18 = v13:use();
    return v1.createElement(v8, l_join_0(v17, {
        ImageSize = UDim2.new(0, 200, 0, 200), 
        OnClick = function(v19) --[[ Line: 72 ]] --[[ Name: OnClick ]]
            -- upvalues: v12 (ref), l_StartPageManager_0 (ref), v4 (ref), v18 (copy), v14 (ref)
            if v19.Id then
                if v12 then
                    l_StartPageManager_0:openPlace(v19.RootPlaceId, v19.Id, false);
                else
                    l_StartPageManager_0:openPlace(v19.RootPlaceId, 0, false);
                end;
                if v4 then
                    v18:log(v14, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "place_open", 
                        action = "templates_page", 
                        name = v19.Name or v19.Id
                    });
                end;
            end;
        end, 
        IsPrivacyVisible = false, 
        IsDateModifiedVisible = false, 
        IsDropdownMenuVisible = false
    }));
end;
local function v22(v21) --[[ Line: 98 ]] --[[ Name: PageComponent ]]
    -- upvalues: v1 (copy), v7 (copy), l_join_0 (copy), v15 (copy), v20 (copy), v16 (copy), v10 (copy)
    return v1.createElement(v7, l_join_0(v21, {
        Query = l_join_0(v15, {
            search = v21.Search
        }), 
        CellComponent = v20, 
        CellSize = v16, 
        FetchItems = v10
    }));
end;
local function v24(v23) --[[ Line: 112 ]] --[[ Name: AllPageComponent ]]
    -- upvalues: v1 (copy), v22 (copy), l_join_0 (copy)
    return v1.createElement(v22, l_join_0(v23, {
        Search = "All"
    }));
end;
local function v26(v25) --[[ Line: 121 ]] --[[ Name: GenericPageComponent ]]
    -- upvalues: v1 (copy), v22 (copy), l_join_0 (copy)
    return v1.createElement(v22, l_join_0(v25, {
        Search = "Generic"
    }));
end;
local function v28(v27) --[[ Line: 130 ]] --[[ Name: GameplayPageComponent ]]
    -- upvalues: v1 (copy), v22 (copy), l_join_0 (copy)
    return v1.createElement(v22, l_join_0(v27, {
        Search = "Gameplay"
    }));
end;
local function v30(v29) --[[ Line: 139 ]] --[[ Name: ThemedPageComponent ]]
    -- upvalues: v1 (copy), v22 (copy), l_join_0 (copy)
    return v1.createElement(v22, l_join_0(v29, {
        Search = "Theme"
    }));
end;
return function(v31) --[[ Line: 148 ]] --[[ Name: TemplatesPage ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v9 (copy), v3 (copy), v24 (copy), v26 (copy), v28 (copy), v30 (copy)
    local v32 = l_Localization_0:use();
    return v1.createElement(v9, {
        Size = if v3 then nil else v31.Size, 
        Position = if v3 then nil else v31.Position, 
        PageName = "Templates", 
        Tabs = {
            {
                Title = v32:getText("Plugin", "TemplatesPage.All"), 
                FailedTitle = v32:getText("Plugin", "NoTemplatesToDisplay"), 
                Label = v32:getText("Plugin", "TemplatesPage.AllLabel"), 
                Key = "All", 
                PageComponent = v24
            }, 
            {
                Title = v32:getText("Plugin", "TemplatesPage.Generic"), 
                FailedTitle = v32:getText("Plugin", "NoTemplatesToDisplay"), 
                Key = "Generic", 
                PageComponent = v26
            }, 
            {
                Title = v32:getText("Plugin", "TemplatesPage.Gameplay"), 
                FailedTitle = v32:getText("Plugin", "NoTemplatesToDisplay"), 
                Key = "Gameplay", 
                PageComponent = v28
            }, 
            {
                Title = v32:getText("Plugin", "TemplatesPage.Theme"), 
                FailedTitle = v32:getText("Plugin", "NoTemplatesToDisplay"), 
                Key = "Theme", 
                PageComponent = v30
            }
        }, 
        CanSwapBetweenViews = false, 
        IsDefaultGridView = true, 
        HasSearchBar = false
    });
end;