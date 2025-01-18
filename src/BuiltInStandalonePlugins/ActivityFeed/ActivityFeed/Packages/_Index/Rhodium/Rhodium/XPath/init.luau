local v0 = {
    __type = "XPath"
};
v0.__index = v0;
local v1 = {};
for v2 = 1, 6 do
    v1[("\\.=[],"):sub(v2, v2)] = true;
end;
v0.addSlash = function(v3) --[[ Line: 98 ]] --[[ Name: addSlash ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for v5 = 1, v3:len() do
        local v6 = v3:sub(v5, v5);
        if v1[v6] then
            table.insert(v4, "\\");
        end;
        table.insert(v4, v6);
    end;
    return table.concat(v4);
end;
v0.removeSlash = function(v7) --[[ Line: 110 ]] --[[ Name: removeSlash ]]
    local v8 = {};
    local v9 = false;
    for v10 = 1, v7:len() do
        local v11 = v7:sub(v10, v10);
        if v11 == "\\" and v9 == false then
            v9 = true;
        else
            if v9 == true then
                v9 = false;
            end;
            table.insert(v8, v11);
        end;
    end;
    return table.concat(v8);
end;
local function v19(v12, v13) --[[ Line: 127 ]] --[[ Name: splitByCharWithSlash ]]
    local v14 = {};
    if v12 == nil or v12 == "" then
        return v14;
    else
        local v15 = false;
        local v16 = 1;
        for v17 = 1, v12:len() do
            local v18 = v12:sub(v17, v17);
            if v18 == "\\" and v15 == false then
                v15 = true;
            elseif v15 == true then
                v15 = false;
            elseif v18 == v13 then
                table.insert(v14, (v12:sub(v16, v17 - 1)));
                v16 = v17 + 1;
            end;
        end;
        table.insert(v14, (v12:sub(v16, v12:len())));
        return v14;
    end;
end;
local function v20(v21) --[[ Line: 153 ]] --[[ Name: deepCopy ]]
    -- upvalues: v20 (copy)
    local v22 = {};
    for v23, v24 in pairs(v21) do
        if type(v24) == "table" then
            v22[v23] = v20(v24);
        else
            v22[v23] = v24;
        end;
    end;
    return v22;
end;
v0.new = function(v25, v26) --[[ Line: 165 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v27 = {
        data = {}, 
        root = v26, 
        waitDelay = 0.2, 
        waitTimeOut = 2
    };
    setmetatable(v27, v0);
    if type(v25) == "string" then
        v27:fromString(v25);
        return v27;
    else
        if type(v25) == "userdata" then
            local l_v25_0 = v25;
            while l_v25_0 do
                local l_Name_0 = l_v25_0.Name;
                if l_v25_0.ClassName == "DataModel" then
                    l_Name_0 = "game";
                end;
                table.insert(v27.data, 1, {
                    name = l_Name_0
                });
                l_v25_0 = l_v25_0.Parent;
            end;
        elseif type(v25) == "table" and v25.__type == v0.__type then
            return v25:copy();
        else
            error(string.format("unknown parameter %s", (tostring(v25))));
        end;
        return v27;
    end;
end;
v0.size = function(v30) --[[ Line: 197 ]] --[[ Name: size ]]
    return #v30.data;
end;
v0.mergeFilter = function(v31, v32, v33) --[[ Line: 201 ]] --[[ Name: mergeFilter ]]
    if v31:size() < v32 then
        error("bad index");
    end;
    local v34 = v31.data[v32].filter or {};
    local v35 = {};
    for _, v37 in ipairs(v34) do
        v35[v37.key] = v37.value;
    end;
    if v33 then
        for _, v39 in ipairs(v33) do
            v35[v39.key] = tostring(v39.value);
        end;
    end;
    local v40 = {};
    for v41, v42 in pairs(v35) do
        table.insert(v40, {
            key = v41, 
            value = v42
        });
    end;
    v31.data[v32].filter = v40;
    return v31;
end;
v0.fromString = function(v43, v44) --[[ Line: 223 ]] --[[ Name: fromString ]]
    -- upvalues: v0 (copy), v19 (copy)
    local v45 = false;
    local v46 = false;
    local v47 = {};
    local v48 = 1;
    v44 = v44 .. ".";
    for v49 = 1, v44:len() do
        local v50 = v44:sub(v49, v49);
        if v50 == "\\" and v46 == false then
            v46 = true;
        elseif v46 == true then
            v46 = false;
        elseif v50 == "." then
            if not v45 then
                table.insert(v47, {
                    name = v44:sub(v48, v49 - 1)
                });
                v48 = v49 + 1;
            end;
        elseif v50 == "[" then
            if v45 == true then
                error("no nested bracket allowed: " .. v44);
            end;
            v45 = true;
        elseif v50 == "]" then
            if not v45 then
                error("unbalanced brackets: " .. v44);
            end;
            v45 = false;
        end;
    end;
    if v45 == true then
        error("unbalanced brackets: " .. v44);
    end;
    for v51 = 1, #v47 do
        local v52, v53 = v47[v51].name:match("%s*(.*[^\\])%[(.*[^\\])%]%s*");
        if v52 == nil then
            v53 = "";
            v52 = v47[v51].name;
        end;
        if v52 ~= nil and v53 ~= nil then
            v47[v51].name = v0.removeSlash(v52);
            local v54 = v19(v53, ",");
            local v55 = {};
            for _, v57 in ipairs(v54) do
                local v58, v59 = v57:match("^%s*(.-[^\\])%s*=%s*(.-)%s*$");
                if v58 and v59 then
                    table.insert(v55, {
                        key = v58, 
                        value = v59
                    });
                end;
            end;
            v47[v51].filter = v55;
        end;
    end;
    v43.data = v47;
end;
v0.copy = function(v60) --[[ Line: 286 ]] --[[ Name: copy ]]
    -- upvalues: v20 (copy), v0 (copy)
    local v61 = v20(v60);
    setmetatable(v61, v0);
    return v61;
end;
v0.parent = function(v62) --[[ Line: 292 ]] --[[ Name: parent ]]
    local v63 = v62:copy();
    if #v63.data <= 1 then
        return v63;
    else
        table.remove(v63.data, #v63.data);
        return v63;
    end;
end;
v0._itemToString = function(_, v65) --[[ Line: 303 ]] --[[ Name: _itemToString ]]
    -- upvalues: v0 (copy)
    local v66 = v0.addSlash(v65.name);
    if v65.filter and #v65.filter > 0 then
        local v67 = {};
        for _, v69 in ipairs(v65.filter) do
            table.insert(v67, v69.key .. " = " .. v69.value);
        end;
        v66 = v66 .. "[" .. table.concat(v67, ", ") .. "]";
    end;
    return v66;
end;
v0.toString = function(v70, v71) --[[ Line: 315 ]] --[[ Name: toString ]]
    if v71 == nil then
        local v72 = {};
        for _, v74 in ipairs(v70.data) do
            table.insert(v72, v70:_itemToString(v74));
        end;
        return table.concat(v72, ".");
    elseif type(v71) == "number" then
        if v71 < 0 then
            v71 = v70:size() + v71 + 1;
        end;
        if v70:size() < v71 or v71 < 1 then
            error("invalid index");
        end;
        return v70:_itemToString(v70.data[v71]);
    elseif type(v71) == "table" then
        return v70:_itemToString(v71);
    else
        error("Unsupported argument to `XPath:toString()`");
        return;
    end;
end;
v0.hasChild = function(v75, v76) --[[ Line: 338 ]] --[[ Name: hasChild ]]
    return v76:relative(v75) ~= nil;
end;
v0.relative = function(v77, v78) --[[ Line: 342 ]] --[[ Name: relative ]]
    if v77:size() < #v78.data then
        return nil;
    else
        local v79 = v78:copy();
        local v80 = v77:copy();
        while true do
            if #v79.data > 0 then
                if v79.data[1].name ~= v80.data[1].name then
                    return nil;
                else
                    table.remove(v79.data, 1);
                    table.remove(v80.data, 1);
                end;
            else
                return v80;
            end;
        end;
    end;
end;
v0.cat = function(v81, v82) --[[ Line: 359 ]] --[[ Name: cat ]]
    -- upvalues: v0 (copy)
    if typeof(v82) == "string" then
        v82 = v0.new(v82);
    end;
    local v83 = v81:copy();
    for _, v85 in ipairs(v82.data) do
        table.insert(v83.data, v85);
    end;
    return v83;
end;
v0.clearFilter = function(v86) --[[ Line: 371 ]] --[[ Name: clearFilter ]]
    for v87 = 1, v86:size() do
        v86.data[v87].filter = nil;
    end;
    return v86;
end;
local function _(v88, v89) --[[ Line: 378 ]] --[[ Name: getProperty ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 379 ]]
        -- upvalues: v88 (copy), v89 (copy)
        return v88[v89];
    end);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;
local function _(v93, v94) --[[ Line: 385 ]] --[[ Name: propertyMatch ]]
    v93 = tostring(v93);
    v94 = tostring(v94);
    local v95 = true;
    if v94 ~= "*" then
        v95 = v93 == v94;
    end;
    return v95;
end;
local function v111(v97, v98) --[[ Line: 391 ]] --[[ Name: findChildrenByName ]]
    local l_v97_Children_0 = v97:GetChildren();
    local v100 = {};
    for _, v102 in ipairs(l_v97_Children_0) do
        local l_pcall_0 = pcall;
        local v104 = "Name";
        local v105;
        l_pcall_0, v105 = l_pcall_0(function() --[[ Line: 379 ]]
            -- upvalues: v102 (copy), v104 (copy)
            return v102[v104];
        end);
        local v106 = if l_pcall_0 then v105 else nil;
        l_pcall_0 = v98;
        v106 = tostring(v106);
        l_pcall_0 = tostring(l_pcall_0);
        local v107 = true;
        if l_pcall_0 ~= "*" then
            v107 = v106 == l_pcall_0;
        end;
        if v107 then
            table.insert(v100, v102);
        end;
    end;
    if #v100 == 0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 379 ]]
            -- upvalues: v97 (copy), v98 (copy)
            return v97[v98];
        end);
        local v110 = if l_status_1 then l_result_1 else nil;
        if v110 then
            table.insert(v100, v110);
        end;
    end;
    return v100;
end;
local function v120(v112, v113) --[[ Line: 409 ]] --[[ Name: findChildren ]]
    -- upvalues: v111 (copy)
    local v114 = {};
    for _, v116 in ipairs(v112) do
        local v117 = v111(v116, v113);
        for _, v119 in ipairs(v117) do
            table.insert(v114, v119);
        end;
    end;
    return v114;
end;
local _ = function(v121, v122) --[[ Line: 420 ]] --[[ Name: findCandidates ]]
    -- upvalues: v120 (copy)
    for _, v124 in ipairs(v122) do
        v121 = v120(v121, v124);
    end;
    return v121;
end;
local function v142(v126, v127) --[[ Line: 427 ]] --[[ Name: passFilter ]]
    -- upvalues: v19 (copy), v0 (copy), v120 (copy)
    local l_key_0 = v127.key;
    local v129, v130 = l_key_0:match("^%.?(.*[^\\])%.(%w-)$");
    if v130 == nil then
        v129 = "";
        v130 = l_key_0:match("^%.?(%w-)$");
    end;
    if v130 ~= nil then
        local v131 = v19(v129, ".");
        for v132 = 1, #v131 do
            v131[v132] = v0.removeSlash(v131[v132]);
        end;
        local v133 = {
            v126
        };
        for _, v135 in ipairs(v131) do
            v133 = v120(v133, v135);
        end;
        for _, v137 in ipairs(v133) do
            local l_v130_0 = v130;
            local l_l_v130_0_0 = l_v130_0 --[[ copy: 13 -> 16 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 379 ]]
                -- upvalues: v137 (copy), l_l_v130_0_0 (copy)
                return v137[l_l_v130_0_0];
            end);
            l_status_2 = if l_status_2 then l_result_2 else nil;
            l_result_2 = v0.removeSlash(v127.value);
            l_status_2 = tostring(l_status_2);
            l_result_2 = tostring(l_result_2);
            l_v130_0 = true;
            if l_result_2 ~= "*" then
                l_v130_0 = l_status_2 == l_result_2;
            end;
            if l_v130_0 then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v147(v143, v144) --[[ Line: 456 ]] --[[ Name: passFilters ]]
    -- upvalues: v142 (copy)
    for _, v146 in ipairs(v144) do
        if not v142(v143, v146) then
            return false;
        end;
    end;
    return true;
end;
local function v153(v148, v149) --[[ Line: 465 ]] --[[ Name: applyFilters ]]
    -- upvalues: v147 (copy)
    if v149 == nil then
        return v148;
    else
        local v150 = {};
        for _, v152 in ipairs(v148) do
            if v147(v152, v149) then
                table.insert(v150, v152);
            end;
        end;
        return v150;
    end;
end;
v0.getFirstInstance = function(v154) --[[ Line: 478 ]] --[[ Name: getFirstInstance ]]
    local v155 = v154:getInstances();
    if #v155 == 0 then
        return nil;
    else
        return v155[1];
    end;
end;
v0.getInstances = function(v156) --[[ Line: 487 ]] --[[ Name: getInstances ]]
    -- upvalues: v120 (copy), v153 (copy)
    if v156:size() < 1 then
        error("instance " .. v156:toString() .. " does not exist");
    end;
    local v157 = nil;
    local l_name_0 = v156.data[1].name;
    if l_name_0 == "game" then
        v157 = game;
    elseif l_name_0 == "PluginGuiService" then
        v157 = game:GetService("PluginGuiService");
    end;
    if v156.root == nil and v157 == nil then
        error("instance " .. v156:toString() .. " does not exist");
    end;
    local v159 = {
        if v156.root then v156.root else v157
    };
    local v160 = v156.root and 1 or 2;
    while true do
        if v160 <= v156:size() then
            local l_name_1 = v156.data[v160].name;
            local l_filter_0 = v156.data[v160].filter;
            local v163 = v120(v159, l_name_1);
            v159 = v153(v163, l_filter_0);
            if #v159 == 0 then
                return v159, v160 - 1;
            else
                v160 = v160 + 1;
            end;
        else
            return v159, v160 - 1;
        end;
    end;
end;
v0.setWait = function(v164, v165, v166) --[[ Line: 520 ]] --[[ Name: setWait ]]
    v164.waitDelay = v166 or v164.waitDelay;
    v164.waitTimeOut = v165 or v164.waitTimeOut;
    return v164;
end;
v0.waitFor = function(v167, v168, v169, v170, v171) --[[ Line: 526 ]] --[[ Name: waitFor ]]
    v170 = v170 or v167.waitDelay;
    v171 = v171 or v167.waitTimeOut;
    assert(v171);
    v171 = os.clock() + v171;
    while true do
        local v172 = v168();
        if v169(v172) then
            return v172, true;
        else
            task.wait(v170);
            if v171 < os.clock() then
                return v172, false;
            end;
        end;
    end;
end;
v0.waitForFirstInstance = function(v173) --[[ Line: 546 ]] --[[ Name: waitForFirstInstance ]]
    local v174 = v173:waitForNInstances(1);
    if v174 ~= nil and #v174 > 0 then
        return v174[1];
    else
        return nil;
    end;
end;
v0.waitForInstances = function(v175, v176) --[[ Line: 554 ]] --[[ Name: waitForInstances ]]
    if type(v176) ~= "function" then
        error("arg #1 should be a function");
    end;
    return v175:waitFor(function() --[[ Line: 558 ]]
        -- upvalues: v175 (copy)
        return v175:getInstances();
    end, v176);
end;
v0.waitForDisappear = function(v177) --[[ Line: 563 ]] --[[ Name: waitForDisappear ]]
    local _, v180 = v177:waitForInstances(function(v178) --[[ Line: 564 ]]
        return #v178 == 0;
    end);
    return v180 == true;
end;
v0.waitForNInstances = function(v181, v182) --[[ Line: 570 ]] --[[ Name: waitForNInstances ]]
    local v184, v185 = v181:waitForInstances(function(v183) --[[ Line: 571 ]]
        -- upvalues: v182 (copy)
        return #v183 >= v182;
    end);
    return v184 or {}, v185;
end;
return v0;