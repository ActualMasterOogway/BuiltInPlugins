local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.append);
local v3 = require(l_Parent_0.assign);
local v4 = require(l_Parent_0.cycles);
local v5 = require(l_Parent_0.includes);
local v6 = require(l_Parent_0.join);
local v7 = require(l_Parent_0.map);
local v8 = require(l_Parent_0.keys);
local v9 = require(l_Parent_0.slice);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local function _(v13, v14) --[[ Line: 45 ]] --[[ Name: indentLines ]]
    -- upvalues: v7 (copy)
    return v7(v13, function(v15) --[[ Line: 46 ]]
        -- upvalues: v14 (copy)
        return v14 .. v15;
    end);
end;
local v17 = nil;
local function v18(v19, v20) --[[ Line: 56 ]] --[[ Name: prettyLines ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy), v5 (copy), v18 (copy), v7 (copy), v2 (copy), v17 (ref), v8 (copy), l_sort_0 (copy), v9 (copy), l_insert_0 (copy)
    v20 = v20 or {};
    if type(v19) == "table" then
        local v21 = v3({
            visited = {}, 
            indent = "\t", 
            depth = 2
        }, v20, {
            depth = v20.depth and v20.depth - 1 or nil, 
            cycles = v20.cycles or v4(v19, v20.depth, {
                visited = {}, 
                refs = {}, 
                nextRef = 0, 
                depth = v20.depth, 
                omit = v20.omit or {}
            })
        });
        if v21.depth == -1 then
            return {
                "..."
            };
        elseif v21.visited[v19] then
            return {
                "&" .. v21.cycles.refs[v19]
            };
        else
            v21.visited[v19] = true;
            local v22 = v21.multiline and "," or ", ";
            local v23 = v21.cycles.refs[v19];
            local v24 = {
                (v23 and ("<%s>"):format(v23) or "") .. "{"
            };
            local v25 = v6(v21, {
                noQuotes = true, 
                multiline = false
            });
            local v26 = 0;
            local v27 = true;
            for v28, v29 in ipairs(v19) do
                if not v21.omit or not v5(v21.omit, v28) then
                    if v27 then
                        v27 = false;
                    else
                        v24[#v24] = v24[#v24] .. v22;
                    end;
                    if v21.multiline then
                        local v30 = v18(v29, v21);
                        local l_indent_0 = v21.indent;
                        local v33 = v7(v30, function(v32) --[[ Line: 46 ]]
                            -- upvalues: l_indent_0 (copy)
                            return l_indent_0 .. v32;
                        end);
                        v2(v24, v33);
                    else
                        v24[#v24] = v24[#v24] .. v17(v29, v21);
                    end;
                    v26 = v28;
                end;
            end;
            if #v19 > 0 and v21.arrayLength then
                v24[1] = ("#%d %s"):format(#v19, v24[1]);
            end;
            local v34 = v8(v19);
            l_sort_0(v34, function(v35, v36) --[[ Line: 129 ]]
                if typeof(v35) == "number" and typeof(v36) == "number" then
                    return v35 < v36;
                else
                    return tostring(v35) < tostring(v36);
                end;
            end);
            for _, v38 in ipairs(v34) do
                local v39 = v19[v38];
                if (typeof(v38) ~= "number" or v38 % 1 ~= 0 or v38 < 1 or v38 > v26) and (not v21.omit or not v5(v21.omit, v38)) then
                    if v27 then
                        v27 = false;
                    else
                        v24[#v24] = v24[#v24] .. v22;
                    end;
                    if v21.multiline then
                        local v40 = v18(v38, v25);
                        local l_indent_1 = v21.indent;
                        local l_l_indent_1_0 = l_indent_1 --[[ copy: 20 -> 24 ]];
                        local v44 = v7(v40, function(v43) --[[ Line: 46 ]]
                            -- upvalues: l_l_indent_1_0 (copy)
                            return l_l_indent_1_0 .. v43;
                        end);
                        l_indent_1 = v18(v39, v21);
                        local v45 = v9(l_indent_1, 2);
                        local l_indent_2 = v21.indent;
                        local v48 = v7(v45, function(v47) --[[ Line: 46 ]]
                            -- upvalues: l_indent_2 (copy)
                            return l_indent_2 .. v47;
                        end);
                        v44[#v44] = ("%s = %s"):format(v44[#v44], l_indent_1[1]);
                        v2(v24, v44);
                        v2(v24, v48);
                    else
                        v24[#v24] = ("%s%s = %s"):format(v24[#v24], v17(v38, v25), v17(v39, v21));
                    end;
                end;
            end;
            if v21.multiline then
                if v27 then
                    v24[#v24] = v24[#v24] .. "}";
                    return v24;
                else
                    l_insert_0(v24, "}");
                    return v24;
                end;
            else
                v24[#v24] = ("%s}"):format(v24[#v24]);
                return v24;
            end;
        end;
    elseif type(v19) == "string" and not v20.noQuotes then
        return {
            ("\"%s\""):format(v19)
        };
    else
        return {
            (tostring(v19))
        };
    end;
end;
v17 = function(v49, v50) --[[ Line: 185 ]]
    -- upvalues: l_concat_0 (copy), v18 (copy)
    return l_concat_0(v18(v49, v50), "\n");
end;
return v17;