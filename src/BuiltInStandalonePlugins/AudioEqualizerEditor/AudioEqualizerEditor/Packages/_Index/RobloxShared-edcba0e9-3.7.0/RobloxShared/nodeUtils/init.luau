local l_Writeable_0 = require(script.Parent.Writeable).Writeable;
local v1 = {
    stdout = l_Writeable_0.new(), 
    stderr = l_Writeable_0.new()
};
local function v3(v2) --[[ Line: 24 ]] --[[ Name: exit ]]
    error(("Exited with code: %d"):format(v2));
end;
local l_HttpService_0 = game:GetService("HttpService");
local v7 = {
    stringify = function(v5, ...) --[[ Line: 31 ]] --[[ Name: stringify ]]
        -- upvalues: l_HttpService_0 (copy)
        if select("#", ...) > 0 then
            warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.");
        end;
        return l_HttpService_0:JSONEncode(v5);
    end, 
    parse = function(v6, ...) --[[ Line: 39 ]] --[[ Name: parse ]]
        -- upvalues: l_HttpService_0 (copy)
        if select("#", ...) > 0 then
            warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.");
        end;
        return l_HttpService_0:JSONDecode(v6);
    end
};
return {
    process = v1, 
    exit = v3, 
    JSON = v7
};