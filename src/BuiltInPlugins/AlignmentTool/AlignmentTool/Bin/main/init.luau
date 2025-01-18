return function(v0, v1) --[[ Line: 1 ]]
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Src.Flags.getFFlagAlignToolRoactInspector);
    local v4 = require(l_Parent_0.Packages.Roact);
    local v5 = require(l_Parent_0.Packages.Rodux);
    local v6 = require(l_Parent_0.Packages.Framework);
    local l_ContextServices_0 = v6.ContextServices;
    local l_Analytics_0 = l_ContextServices_0.Analytics;
    local l_Localization_0 = l_ContextServices_0.Localization;
    local l_Mouse_0 = l_ContextServices_0.Mouse;
    local l_Store_0 = l_ContextServices_0.Store;
    local v12 = require(l_Parent_0.Src.Components.AlignmentToolPlugin);
    local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
    local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
    local v15 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v18 = l_Localization_0.new({
        pluginName = "AlignmentTool", 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0
    });
    local v19 = v5.Store.new(v13, nil, {
        v5.thunkMiddleware
    });
    local v20 = require(l_Parent_0.Src.Utility.CalloutController).new();
    v20:defineCallout("AlignToolCallout", v18:getText("Callout", "Title"), v18:getText("Callout", "Description"), "https://developer.roblox.com/en-us/resources/studio/Align-Tool");
    local v21 = nil;
    if v3() and game:GetService("StudioService"):HasInternalPermission() then
        v21 = v6.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
        v4.setGlobalConfig({
            elementTracing = true
        });
    end;
    (function() --[[ Line: 57 ]] --[[ Name: main ]]
        -- upvalues: v21 (ref), v4 (copy), l_ContextServices_0 (copy), v0 (copy), v18 (copy), v14 (copy), l_Mouse_0 (copy), l_Store_0 (copy), v19 (copy), l_Analytics_0 (copy), v15 (copy), v20 (copy), v12 (copy), v1 (copy)
        local v22 = nil;
        local function v23() --[[ Line: 60 ]] --[[ Name: onPluginUnloading ]]
            -- upvalues: v21 (ref), v22 (ref), v4 (ref)
            if v21 then
                v21:destroy();
                v21 = nil;
            end;
            if v22 then
                v4.unmount(v22);
                v22 = nil;
            end;
        end;
        local v24 = l_ContextServices_0.provide({
            l_ContextServices_0.Plugin.new(v0), 
            v18, 
            v14(), 
            l_Mouse_0.new(v0:GetMouse()), 
            l_Store_0.new(v19), 
            l_Analytics_0.new(v15), 
            v20
        }, {
            AlignTool = v4.createElement(v12, {
                pluginLoaderContext = v1
            })
        });
        v22 = v4.mount(v24);
        if v21 then
            v21:addRoactTree("Roact tree", v22);
        end;
        v0.Unloading:Connect(v23);
    end)();
end;