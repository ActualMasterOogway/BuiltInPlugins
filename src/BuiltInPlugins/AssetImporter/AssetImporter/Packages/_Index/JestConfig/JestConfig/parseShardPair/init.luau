local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Number_0 = v1.Number;
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local v7 = require(l_Parent_0.RegExp);
return {
    parseShardPair = function(v8) --[[ Line: 18 ]] --[[ Name: parseShardPair ]]
        -- upvalues: l_Array_0 (copy), l_String_0 (copy), v7 (copy), l_Boolean_0 (copy), l_Number_0 (copy), l_Error_0 (copy)
        local v12 = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(l_String_0.split(v8, "/"), function(v9) --[[ Line: 21 ]]
            -- upvalues: v7 (ref)
            return v7("^\\d+$"):test(v9);
        end), function(v10) --[[ Line: 24 ]]
            return (tonumber(v10, 10));
        end), function(v11) --[[ Line: 28 ]]
            -- upvalues: l_Boolean_0 (ref), l_Number_0 (ref)
            return not l_Boolean_0.toJSBoolean(l_Number_0.isNaN(v11));
        end);
        local v13, v14 = table.unpack(v12, 1, 2);
        if #v12 ~= 2 then
            error(l_Error_0.new("The shard option requires a string in the format of <n>/<m>."));
        end;
        if v13 == 0 or v14 == 0 then
            error(l_Error_0.new("The shard option requires 1-based values, received 0 or lower in the pair."));
        end;
        if v14 < v13 then
            error(l_Error_0.new("The shard option <n>/<m> requires <n> to be lower or equal than <m>."));
        end;
        return {
            shardCount = v14, 
            shardIndex = v13
        };
    end
};