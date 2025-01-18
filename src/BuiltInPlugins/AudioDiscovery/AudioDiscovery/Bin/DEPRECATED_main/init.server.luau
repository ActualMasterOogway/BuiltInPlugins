if not plugin then
    return;
else
    require(script.Parent.defineLuaFlags);
    if game:GetFastFlag("AudioDiscoveryLoader") then
        return;
    elseif game:GetFastFlag("RetireAudioDiscoveryPlugin") then
        return;
    else
        local l_Parent_0 = script.Parent.Parent;
        local v1 = require(l_Parent_0.Packages.Framework);
        local _, l_result_0 = pcall(function() --[[ Line: 19 ]]
            return game:GetService("StudioService"):HasInternalPermission();
        end);
        if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
            return;
        elseif game:GetFastFlag("RetireAudioDiscoveryPlugin") then
            return;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 34 ]]
                return game:GetService("RunService"):IsEdit();
            end);
            if not l_status_1 or not l_result_1 then
                plugin:CreateToolbar("Audio Discovery"):CreateButton("ViewSounds", "View Sounds", "rbxlocaltheme://ViewSounds").Enabled = false;
                return;
            else
                require(script.Parent.commonInit)();
                local v6 = require(l_Parent_0.Packages.Roact);
                local l_Networking_0 = v1.Http.Networking;
                local v8 = require(l_Parent_0.Src.MainPlugin);
                local v9 = require(l_Parent_0.Src.Util.SoundAssetChecker);
                local v10 = nil;
                local v11 = nil;
                local v12 = nil;
                if l_result_0 then
                    v12 = v1.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                end;
                local function v15() --[[ Line: 66 ]] --[[ Name: init ]]
                    -- upvalues: l_Parent_0 (copy), l_Networking_0 (copy), v11 (ref), v9 (copy), v6 (copy), v8 (copy), v10 (ref), v12 (ref)
                    plugin.Name = l_Parent_0.Name;
                    local v13 = l_Networking_0.new({
                        isInternal = true
                    });
                    v11 = v9.new(v13);
                    v11:start();
                    local v14 = v6.createElement(v8, {
                        Plugin = plugin, 
                        SoundAssetChecker = v11
                    });
                    v10 = v6.mount(v14);
                    if v12 then
                        v12:addRoactTree("Roact tree", v10);
                    end;
                end;
                plugin.Unloading:Connect(function() --[[ Line: 87 ]]
                    -- upvalues: v11 (ref), v12 (ref), v10 (ref), v6 (copy)
                    if v11 then
                        v11:destroy();
                        v11 = nil;
                    end;
                    if v12 then
                        v12:destroy();
                    end;
                    if v10 then
                        v6.unmount(v10);
                        v10 = nil;
                    end;
                end);
                v15();
                return;
            end;
        end;
    end;
end;