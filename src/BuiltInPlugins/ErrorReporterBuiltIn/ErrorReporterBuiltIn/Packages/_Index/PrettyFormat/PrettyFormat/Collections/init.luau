local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return {
    printTableEntries = function(v2, v3, v4, v5, v6, v7) --[[ Line: 28 ]] --[[ Name: printTableEntries ]]
        local v8 = "";
        local v9 = {};
        for v10, _ in pairs(v2) do
            table.insert(v9, v10);
        end;
        table.sort(v9, function(v12, v13) --[[ Line: 44 ]]
            return type(v12) .. tostring(v12) < type(v13) .. tostring(v13);
        end);
        if #v9 > 0 then
            v8 = v8 .. v3.spacingOuter;
            local v14 = v4 .. v3.indent;
            for v15 = 1, #v9 do
                local v16 = v9[v15];
                local v17 = v2[v16];
                v8 = v8 .. v14 .. v7(v16, v3, v14, v5, v6) .. ": " .. v7(v17, v3, v14, v5, v6);
                if v15 < #v9 then
                    v8 = v8 .. "," .. v3.spacingInner;
                elseif not v3.min then
                    v8 = v8 .. ",";
                end;
            end;
            v8 = v8 .. v3.spacingOuter .. v4;
        end;
        return v8;
    end, 
    printListItems = function(v18, v19, v20, v21, v22, v23) --[[ Line: 89 ]] --[[ Name: printListItems ]]
        local v24 = "";
        if #v18 > 0 then
            v24 = v24 .. v19.spacingOuter;
            local v25 = v20 .. v19.indent;
            for v26 = 1, #v18 do
                v24 = v24 .. v25 .. v23(v18[v26], v19, v25, v21, v22);
                if v26 < #v18 then
                    v24 = v24 .. "," .. v19.spacingInner;
                elseif not v19.min then
                    v24 = v24 .. ",";
                end;
            end;
            v24 = v24 .. v19.spacingOuter .. v20;
        end;
        return v24;
    end
};