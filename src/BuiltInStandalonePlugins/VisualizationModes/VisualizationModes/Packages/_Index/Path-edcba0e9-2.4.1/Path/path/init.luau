local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {
    env = {}, 
    cwd = function() --[[ Line: 22 ]] --[[ Name: cwd ]]
        return "";
    end
};
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({}, v3));
end;
v3.initialize = function(v4, v5, v6) --[[ Line: 59 ]] --[[ Name: initialize ]]
    v4.root = v5;
    v4.sep = v6;
end;
v3.getRoot = function(v7) --[[ Line: 64 ]] --[[ Name: getRoot ]]
    return v7.root;
end;
v3.getSep = function(v8) --[[ Line: 68 ]] --[[ Name: getSep ]]
    return v8.sep;
end;
v3.pathsEqual = function(_, v10, v11) --[[ Line: 72 ]] --[[ Name: pathsEqual ]]
    return v10 == v11;
end;
v3._splitPath = function(v12, v13) --[[ Line: 77 ]] --[[ Name: _splitPath ]]
    v13 = v12:normalizeSeparators(v13);
    local v14 = "";
    if v12:isAbsolute(v13) or v12:isDriveRelative(v13) then
        v14 = v12:getRoot(v13);
        v13 = v13:sub(v14:len() + 1);
    end;
    local v15 = v13:match("[" .. v12.sep .. "]*$");
    if v15 then
        v13 = v13:sub(1, -v15:len() - 1);
    end;
    local v16 = v13:match("[^" .. v12.sep .. "]+$") or "";
    return v14, v16 and v13:sub(1, -v16:len() - 1) or v13, v16;
end;
v3._normalizeArray = function(_, v18, v19) --[[ Line: 94 ]] --[[ Name: _normalizeArray ]]
    local v20 = 0;
    for v21 = #v18, 1, -1 do
        local v22 = v18[v21];
        if v22 == "." then
            table.remove(v18, v21);
        elseif v22 == ".." then
            table.remove(v18, v21);
            v20 = v20 + 1;
        elseif v20 > 0 then
            table.remove(v18, v21);
            v20 = v20 - 1;
        end;
    end;
    if v19 then
        while v20 > 0 do
            table.insert(v18, 1, "..");
            v20 = v20 - 1;
        end;
    end;
end;
v3._splitBySeparators = function(v23, v24) --[[ Line: 116 ]] --[[ Name: _splitBySeparators ]]
    local v25 = {};
    for v26 in v24:gmatch("[^" .. v23.sep .. "]+") do
        v25[#v25 + 1] = v26;
    end;
    return v25;
end;
v3.normalize = function(v27, v28) --[[ Line: 124 ]] --[[ Name: normalize ]]
    v28 = v27:normalizeSeparators(v28);
    local v29 = v27:isAbsolute(v28);
    local v30 = v29 and v27:getRoot(v28) or nil;
    local v31 = v28:sub(#v28) == v27.sep;
    if v30 then
        v28 = v28:sub(v30:len() + 1);
    end;
    local v32 = v27:_splitBySeparators(v28);
    v27:_normalizeArray(v32, not v29);
    v28 = table.concat(v32, v27.sep);
    if #v28 == 0 then
        if v29 then
            return v30;
        else
            return ".";
        end;
    else
        if v31 then
            v28 = v28 .. v27.sep;
        end;
        if v29 then
            v28 = v30 .. v28;
        end;
        return v28;
    end;
end;
v3._filterparts = function(v33, v34) --[[ Line: 153 ]] --[[ Name: _filterparts ]]
    local v35 = {};
    for _, v37 in ipairs(v34) do
        if v37 and v37 ~= "" then
            table.insert(v35, v37);
        end;
    end;
    for v38, v39 in ipairs(v35) do
        if v38 > 1 then
            while v39:sub(1, 1) == v33.sep do
                v39 = v39:sub(2);
            end;
        end;
        if v38 < #v35 then
            while v39:sub(#v39) == v33.sep do
                v39 = v39:sub(1, #v39 - 1);
            end;
        end;
        v35[v38] = v39;
    end;
    return v35;
end;
v3._rawjoin = function(v40, v41) --[[ Line: 179 ]] --[[ Name: _rawjoin ]]
    return table.concat(v41, v40.sep);
end;
v3._filteredjoin = function(v42, ...) --[[ Line: 183 ]] --[[ Name: _filteredjoin ]]
    local v43 = {
        ...
    };
    for v44, v45 in ipairs(v43) do
        v43[v44] = v42:normalizeSeparators(v45);
    end;
    local v46 = v42:_filterparts(v43);
    return v42:_rawjoin(v46), v46;
end;
v3.join = function(v47, ...) --[[ Line: 193 ]] --[[ Name: join ]]
    return v47:normalize((v47:_filteredjoin(...)));
end;
v3.resolve = function(v48, ...) --[[ Line: 201 ]] --[[ Name: resolve ]]
    -- upvalues: v2 (copy)
    local v49 = {
        ...
    };
    local v50 = "";
    local v51 = nil;
    local v52 = false;
    for v53 = #v49, 1, -1 do
        local v54 = v49[v53];
        if v54 and v54 ~= "" then
            local v55 = v51 and v48:getRoot(v54);
            if v48:isDriveRelative(v54) then
                v55 = v55 or v48:getRoot(v54);
                v51 = v51 or v55;
                v54 = v54:sub(v55:len() + 1);
            end;
            if not v55 or v51:sub(1, 2) == v55:sub(1, 2) then
                v50 = v48:join(v48:normalize(v54), v50);
                if v48:isAbsolute(v50) then
                    v52 = true;
                    break;
                end;
            end;
        end;
    end;
    if not v52 then
        if v51 then
            local v56 = v2.env["=" .. v51];
            v50 = if v56 and v48:pathsEqual(v56:sub(1, 2), v51) then v48:join(v56, v50) else v48:join(v51, v50);
        else
            v50 = v48:join(v2.cwd(), v50);
        end;
    end;
    local v57 = v50:match("[" .. v48.sep .. "]*$");
    if v57 then
        v50 = v50:sub(1, -v57:len() - 1);
    end;
    return v50;
end;
v3._commonParts = function(v58, ...) --[[ Line: 247 ]] --[[ Name: _commonParts ]]
    local v59 = {};
    local v60 = {
        ...
    };
    local v61 = {};
    for _, v63 in ipairs(v60) do
        table.insert(v61, v58:_splitBySeparators(v63));
    end;
    for v64 = 1, #v61[1] do
        local v65 = v61[1][v64];
        for v66 = 2, #v61 do
            if not v58:pathsEqual(v65, v61[v66][v64]) then
                return v59;
            end;
        end;
        table.insert(v59, v65);
    end;
    return v59;
end;
v3.relative = function(v67, v68, v69) --[[ Line: 269 ]] --[[ Name: relative ]]
    local v70, v71, v72 = v67:_splitPath(v68);
    local v73, v74, v75 = v67:_splitPath(v69);
    if not v67:pathsEqual(v70, v73) then
        return v69;
    else
        local v76 = v71 .. v72;
        local v77 = v74 .. v75;
        local v78 = v67:_commonParts(v76, v77);
        local v79 = v67:_splitBySeparators(v76);
        local v80 = v67:_splitBySeparators(v77);
        local v81 = {};
        if #v78 > 0 then
            for _ = #v78, #v79 - 1 do
                table.insert(v81, "..");
            end;
        end;
        for v83 = #v78 + 1, #v80 do
            table.insert(v81, v80[v83]);
        end;
        return v67:_rawjoin(v81);
    end;
end;
v3.dirname = function(v84, v85) --[[ Line: 295 ]] --[[ Name: dirname ]]
    v85 = v84:normalizeSeparators(v85);
    if v85:sub(v85:len()) == v84.sep then
        v85 = v85:sub(1, -2);
    end;
    local v86, v87 = v84:_splitPath(v85);
    if #v87 > 0 then
        return v86 .. v87:sub(1, #v87 - 1);
    elseif #v86 > 0 then
        return v86;
    else
        return ".";
    end;
end;
v3.basename = function(v88, v89, v90) --[[ Line: 313 ]] --[[ Name: basename ]]
    local _, _, v93 = v88:_splitPath(v89);
    if v90 then
        local v94 = v93:find(v90:gsub(".", ".") .. "$");
        if v94 then
            v93 = v93:sub(1, v94 - 1);
        end;
    end;
    return v93;
end;
v3.extname = function(v95, v96) --[[ Line: 324 ]] --[[ Name: extname ]]
    local v97 = v95:basename(v96);
    if v97 == ".." then
        return "";
    else
        return v97:match(".(%.[^.]*)$") or "";
    end;
end;
v3.isDriveRelative = function(_) --[[ Line: 333 ]] --[[ Name: isDriveRelative ]]
    return false;
end;
v3.isAbsolute = function(v99, v100) --[[ Line: 337 ]] --[[ Name: isAbsolute ]]
    return v100:sub(1, v99.root:len()) == v99.root;
end;
v3.normalizeSeparators = function(_, v102) --[[ Line: 341 ]] --[[ Name: normalizeSeparators ]]
    return v102;
end;
return {
    Path = v3
};