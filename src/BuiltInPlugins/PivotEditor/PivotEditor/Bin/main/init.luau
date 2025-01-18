return function(v0, v1) --[[ Line: 1 ]]
    require(script.Parent.defineLuaFlags);
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor);
    if require(l_Parent_0.Src.Utility.DebugFlags).RunningUnderCLI() then
        return;
    else
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local v7 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v8 = require(l_Parent_0.Src.RoduxComponents.EditPivotPlugin);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v11 = require(l_Parent_0.Src.Utility.ToastNotification);
        local v12 = {
            pluginName = "PivotEditor", 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0
        };
        (function() --[[ Line: 32 ]] --[[ Name: main ]]
            -- upvalues: v4 (copy), l_ContextServices_0 (copy), v0 (copy), v5 (copy), v7 (copy), v12 (copy), v11 (copy), v3 (copy), v8 (copy), v1 (copy)
            local v13 = v4.mount(l_ContextServices_0.provide({
                l_ContextServices_0.Plugin.new(v0), 
                l_ContextServices_0.Mouse.new(v0:GetMouse()), 
                l_ContextServices_0.Store.new(v5.Store.new(v7, nil, {
                    v5.thunkMiddleware
                })), 
                l_ContextServices_0.Localization.new(v12), 
                v11.new()
            }, {
                Plugin = if v3() then v4.createElement(v8, {
                    Plugin = v0, 
                    pluginLoaderContext = v1
                }) else v4.createElement(v8)
            }));
            v0.Unloading:Connect(function() --[[ Line: 48 ]]
                -- upvalues: v4 (ref), v13 (copy)
                v4.unmount(v13);
            end);
        end)();
        return;
    end;
end;