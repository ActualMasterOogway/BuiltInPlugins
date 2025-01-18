local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = require(l_script_FirstAncestor_0.Src.Commands.CommandRegistry);
local v3 = require(l_script_FirstAncestor_0.Src.Listeners.StreamingServiceListener);
local v4 = require(l_script_FirstAncestor_0.Src.ContextCollectors.DefaultContextCollector);
local v5 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v6 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v8 = {};
    setmetatable(v8, v7);
    return v8;
end;
v7.init = function(v9) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v4 (copy)
    local l_v2_0 = v2;
    local v11 = v1.GetService("StreamingService");
    if v11 then
        for v12, v13 in l_v2_0 do
            v11:RegisterCommandInternal(v12, v13.Command, v13.IsSequential, v13.IsPublic);
        end;
        v9.streamingServiceListener = v3.new();
        v4.register();
    end;
    v1.GetService("ChatbotUIService"):DisplayContent("PluginConnected", {});
end;
v7.destroy = function(v14) --[[ Line: 57 ]] --[[ Name: destroy ]]
    -- upvalues: v2 (copy), v1 (copy), v5 (copy), v6 (copy), v4 (copy)
    local l_v2_1 = v2;
    local v16 = v1.GetService("StreamingService");
    for v17, _ in l_v2_1 do
        v16:UnregisterCommand(v17);
    end;
    if v14.streamingServiceListener then
        v14.streamingServiceListener:destroy();
        v14.streamingServiceListener = nil;
    end;
    v5.destroy();
    v6.destroy();
    v4.unregister();
end;
return v7;