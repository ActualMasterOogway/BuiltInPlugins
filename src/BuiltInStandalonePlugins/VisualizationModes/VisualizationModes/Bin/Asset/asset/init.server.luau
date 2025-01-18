if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
    require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("VisualizationModes", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    elseif not game:GetFastFlag("StudioVisualizationModes") then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Src.Util.Maid);
        local v3 = v2.new();
        local function v8() --[[ Line: 34 ]] --[[ Name: load ]]
            -- upvalues: v2 (copy), l_script_FirstAncestor_0 (copy), v3 (copy)
            local v4 = v2.new();
            local v5 = require(l_script_FirstAncestor_0.Src.Modes.StudioVisualizationModeProvider);
            local v6 = require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombinerClient);
            local v7 = v4:add(require(l_script_FirstAncestor_0.Src.Model.Tracking.VisualizationModeServiceTracker).new());
            v4:add(v6.new(plugin, v7));
            v4:add(v5.new());
            v3._mount = v4;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 48 ]] --[[ Name: unload ]]
            -- upvalues: v3 (copy)
            v3._mount = nil;
        end);
        v8();
        return;
    end;
end;