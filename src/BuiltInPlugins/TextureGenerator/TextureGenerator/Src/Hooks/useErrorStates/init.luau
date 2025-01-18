local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function() --[[ Line: 7 ]] --[[ Name: useErrorStates ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState({});
    local function _(v5, v6) --[[ Line: 15 ]] --[[ Name: findErrorMessageIndexById ]]
        for v7, v8 in v5 do
            if v8.id == v6 then
                return v7;
            end;
        end;
        return nil;
    end;
    local v22 = v1.useCallback(function(v10, v11, v12, v13, v14) --[[ Line: 26 ]]
        -- upvalues: v4 (copy)
        v4(function(v15) --[[ Line: 27 ]]
            -- upvalues: v10 (copy), v11 (copy), v13 (copy), v12 (copy), v14 (copy)
            local v16 = false;
            if v15[v10] ~= nil then
                local v17 = v15[v10];
                local l_v11_0 = v11;
                local v19;
                for v20, v21 in v17 do
                    if v21.id == l_v11_0 then
                        v19 = v20;
                        v16 = true;
                    end;
                    if v16 then
                        break;
                    end;
                end;
                if not v16 then
                    v19 = nil;
                end;
                v16 = false;
                if v19 ~= nil then
                    return v15;
                end;
            end;
            v15 = table.clone(v15);
            v15[v10] = if v15[v10] then table.clone(v15[v10]) else {};
            table.insert(v15[v10], table.freeze({
                id = v11, 
                message = v13, 
                title = v12, 
                errorType = v14
            }));
            return v15;
        end);
    end, {});
    local v32 = v1.useCallback(function(v23, v24) --[[ Line: 49 ]]
        -- upvalues: v4 (copy)
        v4(function(v25) --[[ Line: 50 ]]
            -- upvalues: v23 (copy), v24 (copy)
            local v26 = false;
            if not v25[v23] then
                return v25;
            else
                local v27 = v25[v23];
                local l_v24_0 = v24;
                local v29;
                for v30, v31 in v27 do
                    if v31.id == l_v24_0 then
                        v29 = v30;
                        v26 = true;
                    end;
                    if v26 then
                        break;
                    end;
                end;
                if not v26 then
                    v29 = nil;
                end;
                v26 = false;
                if not v29 then
                    return v25;
                else
                    v25 = table.clone(v25);
                    if #v25[v23] == 1 then
                        v25[v23] = nil;
                        return v25;
                    else
                        v25[v23] = table.clone(v25[v23]);
                        table.remove(v25[v23], v29);
                        return v25;
                    end;
                end;
            end;
        end);
    end, {});
    local v35 = v1.useCallback(function(v33) --[[ Line: 72 ]]
        -- upvalues: v4 (copy)
        v4(function(v34) --[[ Line: 73 ]]
            -- upvalues: v33 (copy)
            assert(v34[v33] ~= nil, "Popping error from mesh that doesn't have one");
            v34 = table.clone(v34);
            if #v34[v33] == 1 then
                v34[v33] = nil;
                return v34;
            else
                v34[v33] = table.clone(v34[v33]);
                table.remove(v34[v33], 1);
                return v34;
            end;
        end);
    end, {});
    local v37 = v1.useCallback(function(v36) --[[ Line: 89 ]]
        -- upvalues: v3 (copy)
        return v3[v36] and v3[v36][1];
    end, {
        v3
    });
    return {
        addError = v22, 
        popError = v35, 
        removeErrorById = v32, 
        getTopError = v37
    };
end;