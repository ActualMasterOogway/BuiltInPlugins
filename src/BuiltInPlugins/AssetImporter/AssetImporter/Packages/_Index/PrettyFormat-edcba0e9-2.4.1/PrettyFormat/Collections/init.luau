local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Array_0 = v2.Array;
local _ = require(l_Parent_0.Types);
return {
    printTableEntries = function(v6, v7, v8, v9, v10, v11, v12) --[[ Line: 32 ]] --[[ Name: printTableEntries ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
        local v13 = v12 or ": ";
        local v14 = "";
        local v17 = l_Array_0.sort(l_Object_0.keys(v6), if v7.compareKeys ~= nil and v7.compareKeys ~= l_Object_0.None then v7.compareKeys else function(v15, v16) --[[ Line: 49 ]]
            if type(v15) .. tostring(v15) < type(v16) .. tostring(v16) then
                return -1;
            elseif type(v15) .. tostring(v15) == type(v16) .. tostring(v16) then
                return 0;
            else
                return 1;
            end;
        end);
        if #v17 > 0 then
            v14 = v14 .. v7.spacingOuter;
            local v18 = v8 .. v7.indent;
            for v19 = 1, #v17 do
                local v20 = v17[v19];
                local v21 = v6[v20];
                v14 = v14 .. v18 .. v11(v20, v7, v18, v9, v10) .. v13 .. v11(v21, v7, v18, v9, v10);
                if v19 < #v17 then
                    v14 = v14 .. "," .. v7.spacingInner;
                elseif not v7.min then
                    v14 = v14 .. ",";
                end;
            end;
            v14 = v14 .. v7.spacingOuter .. v8;
        end;
        return v14;
    end, 
    printListItems = function(v22, v23, v24, v25, v26, v27) --[[ Line: 87 ]] --[[ Name: printListItems ]]
        local v28 = "";
        if #v22 > 0 then
            v28 = v28 .. v23.spacingOuter;
            local v29 = v24 .. v23.indent;
            for v30 = 1, #v22 do
                v28 = v28 .. v29;
                if v22[v30] ~= nil then
                    v28 = v28 .. v27(v22[v30], v23, v29, v25, v26);
                end;
                if v30 < #v22 then
                    v28 = v28 .. "," .. v23.spacingInner;
                elseif not v23.min then
                    v28 = v28 .. ",";
                end;
            end;
            v28 = v28 .. v23.spacingOuter .. v24;
        end;
        return v28;
    end
};