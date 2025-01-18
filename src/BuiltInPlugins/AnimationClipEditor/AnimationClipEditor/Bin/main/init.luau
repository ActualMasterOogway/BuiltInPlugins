return function(v0, v1) --[[ Line: 1 ]]
    require(script.Parent.defineLuaFlags);
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
    local v3 = require(l_script_FirstAncestor_0.Packages.Dev.DeveloperTools);
    local v4 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
    local v5 = require(l_script_FirstAncestor_0.Packages.Roact);
    local v6 = require(l_script_FirstAncestor_0.Src.Components.AnimationClipEditorPlugin);
    if v4.RunTests() or v4.RunRhodiumTests() then
        return;
    else
        local v7 = nil;
        local v8 = nil;
        local function v12() --[[ Line: 17 ]] --[[ Name: init ]]
            -- upvalues: v5 (copy), v6 (copy), v0 (copy), v1 (copy), v8 (ref), v7 (ref), v3 (copy)
            local v9 = v5.createElement(v6, {
                plugin = v0, 
                pluginLoaderContext = v1
            });
            v8 = v5.mount(v9);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
                return game:GetService("StudioService"):HasInternalPermission();
            end);
            if l_status_0 and l_result_0 then
                v7 = v3.forPlugin("AnimationClipEditor", v0);
                v7:addRoactTree("Roact tree", v8, v5);
            end;
        end;
        v0.Unloading:Connect(function() --[[ Line: 40 ]]
            -- upvalues: v8 (ref), v5 (copy), v7 (ref)
            if v8 then
                v5.unmount(v8);
            end;
            if v7 then
                v7:destroy();
            end;
        end);
        v12();
        return;
    end;
end;