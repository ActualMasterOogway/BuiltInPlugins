local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.agent);
local _ = require(script.types);
return {
    initBackend = function(v4, v5, v6) --[[ Line: 24 ]] --[[ Name: initBackend ]]
        -- upvalues: l_Array_0 (copy)
        if v4 == nil then
            return function() --[[ Line: 27 ]]

            end;
        else
            local v11 = {
                v4.sub("renderer-attached", function(v7) --[[ Line: 30 ]]
                    -- upvalues: v5 (copy)
                    local l_id_0 = v7.id;
                    local l_rendererInterface_0 = v7.rendererInterface;
                    v5:setRendererInterface(l_id_0, l_rendererInterface_0);
                    l_rendererInterface_0.flushInitialOperations();
                end), 
                v4.sub("unsupported-renderer-version", function(v10) --[[ Line: 44 ]]
                    -- upvalues: v5 (copy)
                    v5:onUnsupportedRenderer(v10);
                end), 
                v4.sub("operations", function(...) --[[ Line: 48 ]]
                    -- upvalues: v5 (copy)
                    v5:onHookOperations(...);
                end), 
                v4.sub("traceUpdates", function(...) --[[ Line: 51 ]]
                    -- upvalues: v5 (copy)
                    v5:onTraceUpdates(...);
                end)
            };
            local function v16(v12, v13) --[[ Line: 58 ]]
                -- upvalues: v4 (copy), v6 (copy)
                local l_attach_0 = require(script.renderer).attach;
                local v15 = v4.rendererInterfaces:get(v12);
                if v15 == nil then
                    if type(v13.findFiberByHostInstance) == "function" then
                        v15 = l_attach_0(v4, v12, v13, v6);
                    elseif not v13.ComponentTree then

                    end;
                    if v15 ~= nil then
                        v4.rendererInterfaces:set(v12, v15);
                    end;
                end;
                if v15 ~= nil then
                    v4.emit("renderer-attached", {
                        id = v12, 
                        renderer = v13, 
                        rendererInterface = v15
                    });
                    return;
                else
                    v4.emit("unsupported-renderer-version", v12);
                    return;
                end;
            end;
            v4.renderers:forEach(function(v17, v18) --[[ Line: 95 ]]
                -- upvalues: v16 (copy)
                v16(v18, v17);
            end);
            table.insert(v11, v4.sub("renderer", function(v19) --[[ Line: 102 ]]
                -- upvalues: v16 (copy)
                local l_id_1 = v19.id;
                local l_renderer_0 = v19.renderer;
                v16(l_id_1, l_renderer_0);
            end));
            v4.emit("react-devtools", v5);
            v4.reactDevtoolsAgent = v5;
            local function v24() --[[ Line: 111 ]] --[[ Name: onAgentShutdown ]]
                -- upvalues: l_Array_0 (ref), v11 (copy), v4 (copy)
                l_Array_0.forEach(v11, function(v22) --[[ Line: 112 ]]
                    v22();
                end);
                v4.rendererInterfaces:forEach(function(v23) --[[ Line: 115 ]]
                    v23.cleanup();
                end);
                v4.reactDevtoolsAgent = nil;
            end;
            v5:addListener("shutdown", v24);
            table.insert(v11, function() --[[ Line: 121 ]]
                -- upvalues: v5 (copy), v24 (copy)
                v5:removeListener("shutdown", v24);
            end);
            return function() --[[ Line: 125 ]]
                -- upvalues: v11 (copy)
                for _, v26 in v11 do
                    v26();
                end;
            end;
        end;
    end, 
    agent = require(script.agent), 
    NativeStyleEditor = {
        types = require(script.NativeStyleEditor.types)
    }
};