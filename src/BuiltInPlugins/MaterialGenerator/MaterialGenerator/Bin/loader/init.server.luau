local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v2 = require(l_Parent_0.Packages.TestLoader);
local v3 = require(l_Parent_0.SharedPluginConstants);
v2.launch("MaterialGenerator", l_Parent_0.Src);
if v2.isCli() then
    return;
elseif not game:GetFastFlag("EnableMaterialGenerator") then
    return;
else
    local v4 = require(l_Parent_0.Src.Flags.getFFlagShowMaterialGeneratorFromElsewhere);
    local v5 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v9 = {
        ["MemStorageService." .. v3.LOAD_MATERIAL_GENERATOR] = function() --[[ Line: 24 ]]
            -- upvalues: l_MemStorageService_0 (copy), v3 (copy)
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind(v3.LOAD_MATERIAL_GENERATOR, function(...) --[[ Line: 26 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire(...);
            end);
            return l_BindableEvent_0.Event;
        end
    };
    local v22 = {
        plugin = plugin, 
        pluginName = "MaterialGenerator", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        extraTriggers = if v4() then v9 else nil, 
        getToolbarName = function(_, _, _) --[[ Line: 41 ]] --[[ Name: getToolbarName ]]
            return "MaterialGenerator";
        end, 
        buttonInfo = {
            getName = function(_, _, _) --[[ Line: 45 ]] --[[ Name: getName ]]
                return "MaterialGenerator";
            end, 
            getDescription = function(v16, v17, v18) --[[ Line: 48 ]] --[[ Name: getDescription ]]
                return v16(v17, v18, "Plugin", "Description");
            end, 
            icon = "", 
            text = nil
        }, 
        dockWidgetInfo = {
            id = "MaterialGenerator", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 640, 480, 250, 200), 
            getDockTitle = function(v19, v20, v21) --[[ Line: 65 ]] --[[ Name: getDockTitle ]]
                return v19(v20, v21, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v23 = v5.build(v22);
    if not v23.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v23);
        return;
    end;
end;