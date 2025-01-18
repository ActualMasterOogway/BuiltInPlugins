--!native
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return {
    initParts = function(v2) --[[ Line: 7 ]] --[[ Name: initBasicParts ]]
        return {
            value = {
                value = v2, 
                multiple = false
            }
        };
    end, 
    aggregateParts = function(v3, v4, v5) --[[ Line: 20 ]] --[[ Name: aggregateBasicParts ]]
        if v3.value.multiple then
            return nil;
        else
            local l_value_0 = v3.value.value;
            for v7 = v5, #v4 do
                if v4[v7] ~= l_value_0 then
                    v3.value.multiple = true;
                    break;
                end;
            end;
            return nil;
        end;
    end, 
    setPart = function(v8, v9, v10, v11) --[[ Line: 42 ]] --[[ Name: setBasicPart ]]
        assert(v10 == "value", "Basic aggregator does not support sub-parts");
        for v12 = v9, #v8 do
            v8[v12] = v11;
        end;
        return nil;
    end
};