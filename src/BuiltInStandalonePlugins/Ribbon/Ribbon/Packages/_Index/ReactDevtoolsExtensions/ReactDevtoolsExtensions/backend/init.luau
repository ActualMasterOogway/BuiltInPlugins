local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
return {
    setup = function(v2) --[[ Line: 31 ]] --[[ Name: setup ]]
        -- upvalues: l_Parent_0 (copy)
        local v3 = {};
        local v4 = require(l_Parent_0.ReactDevtoolsShared);
        local l_backend_0 = v4.backend;
        local l_agent_0 = l_backend_0.agent;
        local l_bridge_0 = v4.bridge;
        local l_initBackend_0 = l_backend_0.initBackend;
        local v17 = l_bridge_0.new({
            listen = function(v9) --[[ Line: 61 ]] --[[ Name: listen ]]
                -- upvalues: v3 (copy)
                table.insert(v3, v9);
                return function() --[[ Line: 80 ]]
                    -- upvalues: v3 (ref), v9 (copy)
                    for v10, v11 in v3 do
                        if v11 == v9 then
                            table.remove(v3, v10);
                            return;
                        end;
                    end;
                end;
            end, 
            send = function(v12, v13, _) --[[ Line: 92 ]] --[[ Name: send ]]
                -- upvalues: v3 (copy)
                for _, v16 in v3 do
                    v16({
                        source = "react-devtools-bridge", 
                        event = v12, 
                        payload = v13
                    });
                end;
            end
        });
        local v18 = l_agent_0.new(v17);
        v18:addListener("shutdown", function() --[[ Line: 110 ]]
            -- upvalues: v2 (copy)
            v2.emit("shutdown");
        end);
        l_initBackend_0(v2, v18, _G);
        v17:send("extensionBackendInitialized");
        return {
            agent = v18, 
            hook = v2, 
            bridge = v17
        };
    end
};