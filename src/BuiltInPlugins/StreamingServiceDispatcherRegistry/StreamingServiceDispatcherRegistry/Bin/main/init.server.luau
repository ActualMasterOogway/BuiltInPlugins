if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
    local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
    local v2 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    if not v1.RunningEval then
        v2.launch("StreamingServiceDispatcherRegistry", l_script_FirstAncestor_0.Src);
    end;
    if v2.isCli() and not v1.RunningEval then
        return;
    else
        local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAICOChatBot);
        local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPNewUserExperiment);
        if not v3() and not v4() then
            return;
        else
            local v5 = require(l_script_FirstAncestor_0.Src.MainPlugin);
            local v6 = nil;
            local function _() --[[ Line: 44 ]] --[[ Name: init ]]
                -- upvalues: l_script_FirstAncestor_0 (copy), v6 (ref), v5 (copy)
                plugin.Name = l_script_FirstAncestor_0.Name;
                v6 = v5.new();
                v6:init();
            end;
            plugin.Unloading:Connect(function() --[[ Line: 51 ]]
                -- upvalues: v6 (ref)
                if v6 then
                    v6:destroy();
                end;
            end);
            plugin.Name = l_script_FirstAncestor_0.Name;
            v6 = v5.new();
            v6:init();
            return;
        end;
    end;
end;