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
                v14 = (v14 .. v18) .. v11(v20, v7, v18, v9, v10) .. v13 .. v11(v21, v7, v18, v9, v10);
                if v19 < #v17 then
                    v14 = v14 .. (",%s"):format((tostring(v7.spacingInner)));
                elseif not v7.min then
                    v14 = v14 .. ",";
                end;
            end;
            v14 = v14 .. v7.spacingOuter .. v8;
        end;
        return v14;
    end, 
    printMapEntries = function(v22, v23, v24, v25, v26, v27, v28) --[[ Line: 91 ]] --[[ Name: printMapEntries ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
        local v29 = v28 or " => ";
        local v30 = "";
        local v33 = l_Array_0.sort(l_Object_0.keys(v22), if v23.compareKeys ~= nil and v23.compareKeys ~= l_Object_0.None then v23.compareKeys else function(v31, v32) --[[ Line: 107 ]]
            if type(v31) .. tostring(v31) < type(v32) .. tostring(v32) then
                return -1;
            elseif type(v31) .. tostring(v31) == type(v32) .. tostring(v32) then
                return 0;
            else
                return 1;
            end;
        end);
        if #v33 > 0 then
            v30 = v30 .. v23.spacingOuter;
            local v34 = v24 .. v23.indent;
            for v35 = 1, #v33 do
                local v36 = v33[v35];
                local v37 = v22[v36];
                v30 = v30 .. v34;
                if v35 == v23.maxWidth + 1 then
                    v30 = v30 .. "\226\128\166";
                    break;
                else
                    v30 = v30 .. v27(v36, v23, v34, v25, v26) .. v29 .. v27(v37, v23, v34, v25, v26);
                    if v35 < #v33 then
                        v30 = v30 .. (",%s"):format((tostring(v23.spacingInner)));
                    elseif not v23.min then
                        v30 = v30 .. ",";
                    end;
                end;
            end;
            v30 = v30 .. v23.spacingOuter .. v24;
        end;
        return v30;
    end, 
    printListItems = function(v38, v39, v40, v41, v42, v43) --[[ Line: 154 ]] --[[ Name: printListItems ]]
        local v44 = "";
        if #v38 > 0 then
            v44 = v44 .. v39.spacingOuter;
            local v45 = v40 .. v39.indent;
            for v46 = 1, #v38 do
                v44 = v44 .. v45;
                if v46 == v39.maxWidth + 1 then
                    v44 = v44 .. "\226\128\166";
                    break;
                else
                    if v38[v46] ~= nil then
                        v44 = v44 .. v43(v38[v46], v39, v45, v41, v42);
                    end;
                    if v46 < #v38 then
                        v44 = v44 .. (",%s"):format((tostring(v39.spacingInner)));
                    elseif not v39.min then
                        v44 = v44 .. ",";
                    end;
                end;
            end;
            v44 = v44 .. v39.spacingOuter .. v40;
        end;
        return v44;
    end
};