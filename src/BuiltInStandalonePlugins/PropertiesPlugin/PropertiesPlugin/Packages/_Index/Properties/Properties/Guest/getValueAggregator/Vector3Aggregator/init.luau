--!native
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return {
    initParts = function(v2) --[[ Line: 6 ]] --[[ Name: initVector3Parts ]]
        return {
            value = {
                value = v2, 
                multiple = false
            }, 
            x = {
                value = v2.X, 
                multiple = false
            }, 
            y = {
                value = v2.Y, 
                multiple = false
            }, 
            z = {
                value = v2.Z, 
                multiple = false
            }
        };
    end, 
    aggregateParts = function(v3, v4, v5) --[[ Line: 31 ]] --[[ Name: aggregateVector3Parts ]]
        local l_multiple_0 = v3.value.multiple;
        if not l_multiple_0 then
            local l_value_0 = v3.value.value;
            for v8 = v5, #v4 do
                if v4[v8] ~= l_value_0 then
                    l_multiple_0 = true;
                    v3.value.multiple = true;
                    break;
                end;
            end;
        end;
        if l_multiple_0 then
            if not v3.x.multiple then
                local l_value_1 = v3.x.value;
                for v10 = v5, #v4 do
                    if v4[v10].X ~= l_value_1 then
                        v3.x.multiple = true;
                        break;
                    end;
                end;
            end;
            if not v3.y.multiple then
                local l_value_2 = v3.y.value;
                for v12 = v5, #v4 do
                    if v4[v12].Y ~= l_value_2 then
                        v3.y.multiple = true;
                        break;
                    end;
                end;
            end;
            if not v3.z.multiple then
                local l_value_3 = v3.z.value;
                for v14 = v5, #v4 do
                    if v4[v14].Z ~= l_value_3 then
                        v3.z.multiple = true;
                        break;
                    end;
                end;
            end;
        end;
        return nil;
    end, 
    setPart = function(v15, v16, v17, v18) --[[ Line: 84 ]] --[[ Name: setVector3Part ]]
        if v17 == "x" then
            for v19 = v16, #v15 do
                local v20 = v15[v19];
                v15[v19] = Vector3.new(v18, v20.Y, v20.Z);
            end;
        elseif v17 == "y" then
            for v21 = v16, #v15 do
                local v22 = v15[v21];
                v15[v21] = Vector3.new(v22.X, v18, v22.Z);
            end;
        elseif v17 == "z" then
            for v23 = v16, #v15 do
                local v24 = v15[v23];
                v15[v23] = Vector3.new(v24.X, v24.Y, v18);
            end;
        elseif v17 == "value" then
            for v25 = v16, #v15 do
                v15[v25] = v18;
            end;
        else
            error((("Unexpected Vector3 part: %*"):format(v17)));
        end;
        return nil;
    end
};