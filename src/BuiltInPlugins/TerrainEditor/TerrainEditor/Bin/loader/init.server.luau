local v0 = require(script.Parent.main);
local l_TestService_0 = game:GetService("TestService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
    return game:GetService("ProcessService");
end);
if l_status_0 then
    local l_runCLI_0 = require(l_script_FirstAncestor_0.Packages.Dev.Jest).runCLI;
    _G.__ROACT_17_MOCK_SCHEDULER__ = true;
    _G.__ROACT_17_INLINE_ACT__ = true;
    local v6 = game:DefineFastString("DebugAvatarPreviewerTestPathPattern", "");
    local v7, v8 = l_runCLI_0(l_script_FirstAncestor_0.Src, {
        verbose = true, 
        ci = true, 
        testPathPattern = if v6 == "" then nil else v6
    }, {
        l_script_FirstAncestor_0.Src
    }):awaitStatus();
    if v7 ~= "Resolved" or v8.results.numFailedTestSuites > 0 or v8.results.numFailedTests > 0 then
        if v7 == "Rejected" then
            print(v8);
        end;
        l_TestService_0:Error("Jest 3 test run failed");
        l_result_0:ExitAsync(1);
        return;
    else
        l_result_0:ExitAsync(0);
        return;
    end;
else
    local v9 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
    local v18 = {
        plugin = plugin, 
        pluginName = "TerrainEditor", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function() --[[ Line: 55 ]] --[[ Name: getToolbarName ]]
            return "TerrainEditorLuaToolbarName";
        end, 
        buttonInfo = {
            getName = function() --[[ Line: 59 ]] --[[ Name: getName ]]
                return "Editor";
            end, 
            getDescription = function(v12, v13, v14) --[[ Line: 62 ]] --[[ Name: getDescription ]]
                return v12(v13, v14, "Main", "PluginButtonEditorTooltip");
            end, 
            icon = "rbxlocaltheme://TerrainEditor", 
            text = nil, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "TerrainEditor", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, true, false, 350, 600, 350, 200), 
            getDockTitle = function(v15, v16, v17) --[[ Line: 80 ]] --[[ Name: getDockTitle ]]
                return v15(v16, v17, "Main", "Title");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v19 = v9.build(v18);
    if not v19.pluginLoader:waitForUserInteraction() then
        return;
    else
        v0(plugin, v19);
        return;
    end;
end;