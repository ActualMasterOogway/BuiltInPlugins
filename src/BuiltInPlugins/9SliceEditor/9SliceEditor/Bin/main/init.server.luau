if not plugin then
    return;
else
    require(script.Parent.defineFlags);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not l_status_0 then
        l_result_0 = false;
    end;
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Src.Util.DebugFlags);
    if v3.RunningUnderCLI() then
        return;
    else
        require(script.Parent.commonInit)();
        local v4 = nil;
        local v5 = nil;
        if plugin.HostDataModelType ~= Enum.StudioDataModelType.Edit then
            return;
        else
            if l_result_0 and v3.EnableDeveloperTools() then
                v4 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
            end;
            local v6 = nil;
            local function v11(v7) --[[ Line: 47 ]] --[[ Name: onOpen9SliceButtonClicked ]]
                -- upvalues: v6 (ref), l_Parent_0 (copy), v5 (ref), v4 (ref)
                if v6 then
                    v6:Disconnect();
                    v6 = nil;
                end;
                local v8 = require(l_Parent_0.Packages.Roact);
                local v9 = require(l_Parent_0.Src.MainPlugin);
                plugin.Name = l_Parent_0.Name;
                local v10 = v8.createElement(v9, {
                    Plugin = plugin, 
                    InitialEditorInstanceRequest = v7
                });
                v5 = v8.mount(v10);
                if v4 then
                    v4:addRoactTree("Roact tree", v5);
                end;
                plugin.Unloading:Connect(function() --[[ Line: 68 ]]
                    -- upvalues: v4 (ref), v5 (ref), v8 (copy)
                    if v4 then
                        v4:destroy();
                    end;
                    if v5 then
                        v8.unmount(v5);
                        v5 = nil;
                    end;
                end);
            end;
            v6 = game:GetService("GuiService").Open9SliceEditor:Connect(v11);
            return;
        end;
    end;
end;