if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent.Parent;
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineLuaFlags);
    local v2 = require(l_Parent_0.Packages.TestLoader);
    v2.launch("Tutorials", l_Parent_0.Src);
    if v2.isCli() then
        return;
    elseif not game:GetService("TutorialService"):ShouldLaunchTutorial() then
        return;
    else
        local l_RunService_0 = game:GetService("RunService");
        local v4 = nil;
        local v5 = require(l_Parent_0.Packages.React);
        local v6 = require(l_Parent_0.Packages.ReactRoblox);
        local v7 = require(l_Parent_0.Src.Util.setupPlay);
        local v8 = require(l_Parent_0.Src.Components.AssetRoot);
        local v9 = require(l_Parent_0.Src.Flags.getFFlagSpotlightManager)();
        (function() --[[ Line: 36 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), l_RunService_0 (copy), v4 (ref), v7 (copy), v5 (copy), v8 (copy), v6 (copy)
            plugin.Name = l_Parent_0.Name;
            if l_RunService_0:IsRunning() and plugin.HostDataModelTypeIsCurrent then
                v4 = v7(plugin);
                return;
            else
                if l_RunService_0:IsEdit() then
                    local v10 = v5.createElement(v8, {
                        Plugin = plugin
                    });
                    v4 = v6.createRoot(Instance.new("Frame"));
                    v4:render(v10);
                end;
                return;
            end;
        end)();
        plugin.Unloading:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v4 (ref), v9 (copy)
            if v4 then
                v4:render(nil);
                v4 = nil;
            end;
            game:GetService("StudioWidgetsService"):HideSpotlight();
            if v9 then
                plugin:GetPluginComponent("Spotlight"):HideSpotlightAsync();
            end;
        end);
        return;
    end;
end;