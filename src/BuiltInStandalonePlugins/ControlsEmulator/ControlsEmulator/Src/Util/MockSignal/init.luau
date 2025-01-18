local v0 = {};
v0.__index = v0;
v0.new = function(_) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v11 = {
        callCallbacksWith = function(v2, v3) --[[ Line: 6 ]] --[[ Name: callCallbacksWith ]]
            for _, v5 in v2.callbacks do
                v5(v3);
            end;
        end, 
        callbacks = {}, 
        Connect = function(v6, v7) --[[ Line: 12 ]] --[[ Name: Connect ]]
            local l_callbacks_0 = v6.callbacks;
            table.insert(l_callbacks_0, v7);
            return {
                Disconnect = function() --[[ Line: 16 ]] --[[ Name: Disconnect ]]
                    -- upvalues: l_callbacks_0 (copy), v7 (copy)
                    for v9, v10 in l_callbacks_0 do
                        if v10 == v7 then
                            table.remove(l_callbacks_0, v9);
                        end;
                    end;
                end
            };
        end
    };
    setmetatable(v11, {
        __index = v0
    });
    return v11;
end;
return v0;