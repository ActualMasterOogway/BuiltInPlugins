require(script.Parent.defineLuaFlags);
if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("SocialPresence", l_Parent_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_Parent_0.Packages.React);
        local v3 = require(l_Parent_0.Packages.ReactRoblox);
        local v4 = require(l_Parent_0.Src.MainPlugin);
        local v5 = require(l_Parent_0.Src.RibbonPlugin);
        local v6 = nil;
        local v7 = nil;
        local function v12() --[[ Line: 37 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v2 (copy), v4 (copy), v6 (ref), v3 (copy), v5 (copy), v7 (ref)
            plugin.Name = l_Parent_0.Name;
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v9 = v2.createElement(v4, {
                Plugin = plugin, 
                EnableSignal = l_BindableEvent_0
            });
            v6 = v3.createRoot(Instance.new("Frame"));
            v6:render(v9);
            local l_plugin_QWidgetPluginGui_0 = plugin:CreateQWidgetPluginGui("RibbonWidget", {
                Id = "RibbonWidget", 
                InitialEnabled = true, 
                MinSize = Vector2.new(27, 15), 
                Panel = true, 
                Resizable = true, 
                Title = "RibbonWidget", 
                Parent = "socialPresenceRibbonPlaceholder", 
                AddToParentLayout = true
            });
            local v11 = v2.createElement(v5, {
                Plugin = plugin, 
                Widget = l_plugin_QWidgetPluginGui_0, 
                OnClick = function() --[[ Line: 63 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_BindableEvent_0 (copy)
                    l_BindableEvent_0:Fire();
                end
            });
            v7 = v3.createRoot(l_plugin_QWidgetPluginGui_0);
            v7:render(v11);
        end;
        plugin.Unloading:Connect(function() --[[ Line: 71 ]]
            -- upvalues: v6 (ref), v7 (ref)
            if v6 then
                v6:render(nil);
                v6 = nil;
            end;
            if v7 then
                v7:render(nil);
                v7 = nil;
            end;
        end);
        v12();
        return;
    end;
end;