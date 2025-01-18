if not game:GetService("StudioService"):HasInternalPermission() then
    return;
else
    require(script.Parent.defineLuaFlags);
    if not plugin then
        return;
    else
        local l_Parent_0 = script.Parent.Parent;
        local v1 = require(l_Parent_0.Packages.TestLoader);
        v1.launch("TextureViewer", l_Parent_0.Src);
        if v1.isCli() then
            return;
        elseif not game:GetFastFlag("EnableTextureViewer") then
            return;
        else
            local v2 = require(l_Parent_0.Packages.React);
            local v3 = require(l_Parent_0.Packages.ReactRoblox);
            local v4 = require(l_Parent_0.Src.MainPlugin);
            local v5 = nil;
            local function v7() --[[ Line: 50 ]] --[[ Name: init ]]
                -- upvalues: l_Parent_0 (copy), v2 (copy), v4 (copy), v5 (ref), v3 (copy)
                plugin.Name = l_Parent_0.Name;
                local v6 = v2.createElement(v4, {
                    Plugin = plugin
                });
                v5 = v3.createRoot(Instance.new("Frame"));
                v5:render(v6);
            end;
            plugin.Unloading:Connect(function() --[[ Line: 61 ]]
                -- upvalues: v5 (ref)
                if v5 then
                    v5:render(nil);
                    v5 = nil;
                end;
            end);
            v7();
            return;
        end;
    end;
end;