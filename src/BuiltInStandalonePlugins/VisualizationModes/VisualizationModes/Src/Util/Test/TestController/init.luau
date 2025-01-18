local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Packages.React);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy), l_script_FirstAncestor_0 (copy)
    local v6 = setmetatable({}, v4);
    v6._layerCollector = Instance.new("ScreenGui");
    v6._root = v1.createRoot(v6._layerCollector);
    v6._plugin = v6:_createMockPlugin();
    v1.act(function() --[[ Line: 26 ]]
        -- upvalues: v6 (copy), v2 (ref), l_script_FirstAncestor_0 (ref), v5 (copy)
        v6._root:render(v2.ContextServices.provide({
            v2.ContextServices.Analytics.mock(), 
            v2.ContextServices.Focus.new(v6._layerCollector), 
            v2.ContextServices.Localization.mock({
                stringResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings, 
                translationResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings, 
                pluginName = "VisualizationModes"
            }), 
            v2.ContextServices.Plugin.new(v6._plugin)
        }, {
            Component = v5.Component
        }));
    end);
    return v6;
end;
v4._createMockPlugin = function(_) --[[ Line: 44 ]] --[[ Name: _createMockPlugin ]]
    -- upvalues: v2 (copy)
    local v8 = v2.TestHelpers.Instances.MockPlugin.new();
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v8.OnInvoke = function(_, _, _) --[[ Line: 48 ]] --[[ Name: OnInvoke ]]
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "MemStorageConnection";
        return l_Folder_0;
    end;
    v8.Invoke = function(_, _) --[[ Line: 55 ]] --[[ Name: Invoke ]]
        return nil;
    end;
    v8.GetPropertyChangedSignal = function(_, _) --[[ Line: 59 ]] --[[ Name: GetPropertyChangedSignal ]]
        -- upvalues: l_BindableEvent_0 (copy)
        return l_BindableEvent_0.Event;
    end;
    return v8;
end;
v4.destroy = function(v18) --[[ Line: 66 ]] --[[ Name: destroy ]]
    v18._root:unmount();
    v18._layerCollector:Destroy();
end;
return v4;