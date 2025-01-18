local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if not game:GetFastFlag("StudioVisualizationModes") then
    return;
else
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("VisualizationModes", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        plugin.Name = l_script_FirstAncestor_0.Name;
        (function(v2) --[[ Line: 25 ]] --[[ Name: main ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            local v3 = require(l_script_FirstAncestor_0.Packages.React);
            local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
            local v5 = require(l_script_FirstAncestor_0.Src.VisualizationModesPlugin);
            local v6 = require(l_script_FirstAncestor_0.Src.Modes.StudioVisualizationModeProvider);
            local v7 = require(l_script_FirstAncestor_0.Src.Util.Maid).new();
            v7:add(v6.new());
            local v8 = v3.createElement(v5, {
                Plugin = v2
            });
            local l_Frame_0 = Instance.new("Frame");
            local v10 = v4.createRoot(l_Frame_0);
            v10:render(v8);
            v7:giveTask(function() --[[ Line: 43 ]]
                -- upvalues: v10 (copy)
                v10:unmount();
            end);
            v7:giveTask(v2.Unloading:Connect(function() --[[ Line: 47 ]]
                -- upvalues: v7 (copy)
                v7:destroy();
            end));
        end)(plugin);
        return;
    end;
end;