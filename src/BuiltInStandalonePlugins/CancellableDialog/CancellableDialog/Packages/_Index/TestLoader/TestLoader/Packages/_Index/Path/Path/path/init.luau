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
v3.new = function() --[[ Line: 60 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({}, v3));
end;
v3.initialize = function(v4, v5, v6) --[[ Line: 65 ]] --[[ Name: initialize ]]
    v4.root = v5;
    v4.sep = v6;
end;
v3.getRoot = function(v7, _) --[[ Line: 70 ]] --[[ Name: getRoot ]]
    return v7.root;
end;
v3.getSep = function(v9) --[[ Line: 74 ]] --[[ Name: getSep ]]
    return v9.sep;
end;
v3.pathsEqual = function(_, v11, v12) --[[ Line: 78 ]] --[[ Name: pathsEqual ]]
    return v11 == v12;
end;
v3._splitPath = function(v13, v14) --[[ Line: 83 ]] --[[ Name: _splitPath ]]
    v14 = v13:normalizeSeparators(v14);
    local v15 = "";
    if v13:isAbsolute(v14) or v13:isDriveRelative(v14) then
        v15 = v13:getRoot(v14);
        v14 = v14:sub(v15:len() + 1);
    end;
    local v16 = v14:match("[" .. v13.sep .. "]*$");
    if v16 then
        v14 = v14:sub(1, -v16:len() - 1);
    end;
    local v17 = v14:match("[^" .. v13.sep .. "]+$") or "";
    return v15, v17 and v14:sub(1, -v17:len() - 1) or v14, v17;
end;
v3._normalizeArray = function(_, v19, v20) --[[ Line: 100 ]] --[[ Name: _normalizeArray ]]
    local v21 = 0;
    for v22 = #v19, 1, -1 do
        local v23 = v19[v22];
        if v23 == "." then
            table.remove(v19, v22);
        elseif v23 == ".." then
            table.remove(v19, v22);
            v21 = v21 + 1;
        elseif v21 > 0 then
            table.remove(v19, v22);
            v21 = v21 - 1;
        end;
    end;
    if v20 then
        while v21 > 0 do
            table.insert(v19, 1, "..");
            v21 = v21 - 1;
        end;
    end;
end;
v3._splitBySeparators = function(v24, v25) --[[ Line: 122 ]] --[[ Name: _splitBySeparators ]]
    local v26 = {};
    for v27 in v25:gmatch("[^" .. v24.sep .. "]+") do
        v26[#v26 + 1] = v27;
    end;
    return v26;
end;
v3.normalize = function(v28, v29) --[[ Line: 130 ]] --[[ Name: normalize ]]
    v29 = v28:normalizeSeparators(v29);
    local v30 = v28:isAbsolute(v29);
    local v31 = v30 and v28:getRoot(v29) or nil;
    local v32 = v29:sub(#v29) == v28.sep;
    if v31 then
        v29 = v29:sub(v31:len() + 1);
    end;
    local v33 = v28:_splitBySeparators(v29);
    v28:_normalizeArray(v33, not v30);
    v29 = table.concat(v33, v28.sep);
    if #v29 == 0 then
        if v30 then
            return v31;
        else
            return ".";
        end;
    else
        if v32 then
            v29 = v29 .. v28.sep;
        end;
        if v30 then
            v29 = v31 .. v29;
        end;
        return v29;
    end;
end;
v3._filterparts = function(v34, v35) --[[ Line: 159 ]] --[[ Name: _filterparts ]]
    local v36 = {};
    for _, v38 in ipairs(v35) do
        if v38 and v38 ~= "" then
            table.insert(v36, v38);
        end;
    end;
    for v39, v40 in ipairs(v36) do
        if v39 > 1 then
            while v40:sub(1, 1) == v34.sep do
                v40 = v40:sub(2);
            end;
        end;
        if v39 < #v36 then
            while v40:sub(#v40) == v34.sep do
                v40 = v40:sub(1, #v40 - 1);
            end;
        end;
        v36[v39] = v40;
    end;
    return v36;
end;
v3._rawjoin = function(v41, v42) --[[ Line: 185 ]] --[[ Name: _rawjoin ]]
    return table.concat(v42, v41.sep);
end;
v3._filteredjoin = function(v43, ...) --[[ Line: 189 ]] --[[ Name: _filteredjoin ]]
    local v44 = {
        ...
    };
    for v45, v46 in ipairs(v44) do
        v44[v45] = v43:normalizeSeparators(v46);
    end;
    local v47 = v43:_filterparts(v44);
    return v43:_rawjoin(v47), v47;
end;
v3.join = function(v48, ...) --[[ Line: 199 ]] --[[ Name: join ]]
    return v48:normalize((v48:_filteredjoin(...)));
end;
v3.resolve = function(v49, ...) --[[ Line: 207 ]] --[[ Name: resolve ]]
    -- upvalues: v2 (copy)
    local v50 = {
        ...
    };
    local v51 = "";
    local v52 = nil;
    local v53 = false;
    for v54 = #v50, 1, -1 do
        local v55 = v50[v54];
        if v55 and v55 ~= "" then
            local v56 = v52 and v49:getRoot(v55);
            if v49:isDriveRelative(v55) then
                v56 = v56 or v49:getRoot(v55);
                v52 = v52 or v56;
                v55 = v55:sub(v56:len() + 1);
            end;
            if not v56 or v52:sub(1, 2) == v56:sub(1, 2) then
                v51 = v49:join(v49:normalize(v55), v51);
                if v49:isAbsolute(v51) then
                    v53 = true;
                    break;
                end;
            end;
        end;
    end;
    if not v53 then
        if v52 then
            local v57 = v2.env["=" .. v52];
            v51 = if v57 and v49:pathsEqual(v57:sub(1, 2), v52) then v49:join(v57, v51) else v49:join(v52, v51);
        else
            v51 = v49:join(v2.cwd(), v51);
        end;
    end;
    local v58 = v51:match("[" .. v49.sep .. "]*$");
    if v58 then
        v51 = v51:sub(1, -v58:len() - 1);
    end;
    return v51;
end;
v3._commonParts = function(v59, ...) --[[ Line: 253 ]] --[[ Name: _commonParts ]]
    local v60 = {};
    local v61 = {
        ...
    };
    local v62 = {};
    for _, v64 in ipairs(v61) do
        table.insert(v62, v59:_splitBySeparators(v64));
    end;
    for v65 = 1, #v62[1] do
        local v66 = v62[1][v65];
        for v67 = 2, #v62 do
            if not v59:pathsEqual(v66, v62[v67][v65]) then
                return v60;
            end;
        end;
        table.insert(v60, v66);
    end;
    return v60;
end;
v3.relative = function(v68, v69, v70) --[[ Line: 275 ]] --[[ Name: relative ]]
    local v71, v72, v73 = v68:_splitPath(v69);
    local v74, v75, v76 = v68:_splitPath(v70);
    if not v68:pathsEqual(v71, v74) then
        return v70;
    else
        local v77 = v72 .. v73;
        local v78 = v75 .. v76;
        local v79 = v68:_commonParts(v77, v78);
        local v80 = v68:_splitBySeparators(v77);
        local v81 = v68:_splitBySeparators(v78);
        local v82 = {};
        if #v79 > 0 then
            for _ = #v79, #v80 - 1 do
                table.insert(v82, "..");
            end;
        end;
        for v84 = #v79 + 1, #v81 do
            table.insert(v82, v81[v84]);
        end;
        return v68:_rawjoin(v82);
    end;
end;
v3.dirname = function(v85, v86) --[[ Line: 301 ]] --[[ Name: dirname ]]
    v86 = v85:normalizeSeparators(v86);
    if v86:sub(v86:len()) == v85.sep then
        v86 = v86:sub(1, -2);
    end;
    local v87, v88 = v85:_splitPath(v86);
    if #v88 > 0 then
        return v87 .. v88:sub(1, #v88 - 1);
    elseif #v87 > 0 then
        return v87;
    else
        return ".";
    end;
end;
v3.basename = function(v89, v90, v91) --[[ Line: 319 ]] --[[ Name: basename ]]
    local _, _, v94 = v89:_splitPath(v90);
    if v91 then
        local v95 = v94:find(v91:gsub(".", ".") .. "$");
        if v95 then
            v94 = v94:sub(1, v95 - 1);
        end;
    end;
    return v94;
end;
v3.extname = function(v96, v97) --[[ Line: 330 ]] --[[ Name: extname ]]
    local v98 = v96:basename(v97);
    if v98 == ".." then
        return "";
    else
        return v98:match(".(%.[^.]*)$") or "";
    end;
end;
v3.isDriveRelative = function(_) --[[ Line: 339 ]] --[[ Name: isDriveRelative ]]
    return false;
end;
v3.isAbsolute = function(v100, v101) --[[ Line: 343 ]] --[[ Name: isAbsolute ]]
    return v101:sub(1, v100.root:len()) == v100.root;
end;
v3.normalizeSeparators = function(_, v103) --[[ Line: 347 ]] --[[ Name: normalizeSeparators ]]
    return v103;
end;
return {
    Path = v3
};