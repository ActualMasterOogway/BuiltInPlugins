local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.Components.InstallationDialog);
local v4 = require(l_Parent_0.Src.Components.MainView);
local v5 = require(l_Parent_0.Src.Util.getPluginGlobals);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v5 (copy), l_ContextServices_0 (copy)
    local v7 = nil;
    local function v8() --[[ Line: 12 ]] --[[ Name: closeDialog ]]
        -- upvalues: v7 (ref), v1 (ref)
        if v7 then
            v1.unmount(v7);
        end;
    end;
    local v9 = {
        Dialog = v1.createElement(v3, {
            pluginId = v6, 
            OnButtonClicked = v8, 
            OnClose = v8
        }, {
            Main = v1.createElement(v4, {
                pluginId = v6
            })
        })
    };
    local v10 = v5();
    local v11 = l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v10.plugin), 
        l_ContextServices_0.Store.new(v10.store), 
        v10.localization, 
        v10.theme
    }, v9);
    v7 = v1.mount(v11);
end;