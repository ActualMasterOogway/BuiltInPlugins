if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("PlaceAnnotations", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
        if not v2.fflagCOLLAB6176PlaceAnnotations then
            return;
        elseif not v2.fflagPlaceAnnotationsPublicRelease and not game:GetService("StudioService"):HasInternalPermission() then
            return;
        else
            local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
            local v4 = require(l_script_FirstAncestor_0.Packages.React);
            local v5 = require(l_script_FirstAncestor_0.Src.CoreGuiRoot);
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "PlaceAnnotations";
            l_Folder_0.Parent = game.CoreGui;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "PlaceAnnotationsGui";
            l_ScreenGui_0.Parent = l_Folder_0;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            local v8 = v3.createRoot(l_ScreenGui_0);
            v8:render(v4.createElement(v5, {
                Plugin = plugin
            }));
            plugin.Unloading:Connect(function() --[[ Line: 56 ]]
                -- upvalues: v8 (ref), l_Folder_0 (ref)
                if v8 then
                    v8:render(nil);
                    v8:unmount();
                    v8 = nil;
                end;
                if l_Folder_0 then
                    l_Folder_0:Destroy();
                    l_Folder_0 = nil;
                end;
            end);
            local v9 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
            if v9.get() ~= v9.Asset then
                return;
            else
                local v10 = require(l_script_FirstAncestor_0.Bin.Common.setup);
                local v11 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
                v10(plugin, v11);
                return;
            end;
        end;
    end;
end;