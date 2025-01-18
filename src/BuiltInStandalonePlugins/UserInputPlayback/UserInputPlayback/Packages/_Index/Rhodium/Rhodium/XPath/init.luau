local v0 = {};
v0.__index = v0;
v0.__type = "XPath";
local v1 = {};
for v2 = 1, 6 do
    v1[("\\.=[],"):sub(v2, v2)] = true;
end;
v0.addSlash = function(v3) --[[ Line: 12 ]] --[[ Name: addSlash ]]
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
v0.removeSlash = function(v7) --[[ Line: 24 ]] --[[ Name: removeSlash ]]
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
local function v19(v12, v13) --[[ Line: 41 ]] --[[ Name: splitByCharWithSlash ]]
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
local function v20(v21) --[[ Line: 65 ]] --[[ Name: deepCopy ]]
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
v0.new = function(v25, v26) --[[ Line: 77 ]] --[[ Name: new ]]
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
        elseif getmetatable(v25).__type == v0.__type then
            return v25:copy();
        else
            error("unknown parameter ", v25);
        end;
        return v27;
    end;
end;
v0.size = function(v30) --[[ Line: 101 ]] --[[ Name: size ]]
    return #v30.data;
end;
v0.mergeFilter = function(v31, v32, v33) --[[ Line: 105 ]] --[[ Name: mergeFilter ]]
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
v0.fromString = function(v43, v44) --[[ Line: 125 ]] --[[ Name: fromString ]]
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
        if v52 ~= nil then
            v47[v51].name = v0.removeSlash(v52);
            local v54 = v19(v53, ",");
            local v55 = {};
            for _, v57 in ipairs(v54) do
                local v58, v59 = v57:match("^%s*(.-[^\\])%s*=%s*(.-)%s*$");
                if v58 then
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
v0.copy = function(v60) --[[ Line: 182 ]] --[[ Name: copy ]]
    -- upvalues: v20 (copy), v0 (copy)
    local v61 = v20(v60);
    setmetatable(v61, v0);
    return v61;
end;
v0.parent = function(v62) --[[ Line: 189 ]] --[[ Name: parent ]]
    local v63 = v62:copy();
    if #v63.data <= 1 then
        return v63;
    else
        table.remove(v63.data, #v63.data);
        return v63;
    end;
end;
v0._itemToString = function(_, v65) --[[ Line: 200 ]] --[[ Name: _itemToString ]]
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
v0.toString = function(v70, v71) --[[ Line: 212 ]] --[[ Name: toString ]]
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
        return;
    end;
end;
v0.hasChild = function(v75, v76) --[[ Line: 228 ]] --[[ Name: hasChild ]]
    return v76:relative(v75) ~= nil;
end;
v0.relative = function(v77, v78) --[[ Line: 232 ]] --[[ Name: relative ]]
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
v0.cat = function(v81, v82) --[[ Line: 246 ]] --[[ Name: cat ]]
    local v83 = v81:copy();
    for _, v85 in ipairs(v82.data) do
        table.insert(v83.data, v85);
    end;
    return v83;
end;
v0.clearFilter = function(v86) --[[ Line: 254 ]] --[[ Name: clearFilter ]]
    for v87 = 1, v86:size() do
        v86.data[v87].filter = nil;
    end;
    return v86;
end;
local function _(v88, v89) --[[ Line: 261 ]] --[[ Name: getProperty ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 262 ]]
        -- upvalues: v88 (copy), v89 (copy)
        return v88[v89];
    end);
    return l_status_0 == true and l_result_0 or nil;
end;
local function _(v93, v94) --[[ Line: 266 ]] --[[ Name: propertyEqual ]]
    return tostring(v93) == tostring(v94);
end;
local function _(v96, v97) --[[ Line: 270 ]] --[[ Name: propertyMatch ]]
    v96 = tostring(v96);
    v97 = tostring(v97);
    local v98 = true;
    if v97 ~= "*" then
        v98 = v96 == v97;
    end;
    return v98;
end;
local function v114(v100, v101) --[[ Line: 276 ]] --[[ Name: findChildrenByName ]]
    local l_v100_Children_0 = v100:GetChildren();
    local v103 = {};
    for _, v105 in ipairs(l_v100_Children_0) do
        local l_pcall_0 = pcall;
        local v107 = "Name";
        local v108;
        l_pcall_0, v108 = l_pcall_0(function() --[[ Line: 262 ]]
            -- upvalues: v105 (copy), v107 (copy)
            return v105[v107];
        end);
        local v109 = l_pcall_0 == true and v108 or nil;
        l_pcall_0 = v101;
        v109 = tostring(v109);
        l_pcall_0 = tostring(l_pcall_0);
        local v110 = true;
        if l_pcall_0 ~= "*" then
            v110 = v109 == l_pcall_0;
        end;
        if v110 then
            table.insert(v103, v105);
        end;
    end;
    if #v103 == 0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 262 ]]
            -- upvalues: v100 (copy), v101 (copy)
            return v100[v101];
        end);
        local v113 = l_status_1 == true and l_result_1 or nil;
        if v113 then
            table.insert(v103, v113);
        end;
    end;
    return v103;
end;
local function v123(v115, v116) --[[ Line: 294 ]] --[[ Name: findChildren ]]
    -- upvalues: v114 (copy)
    local v117 = {};
    for _, v119 in ipairs(v115) do
        local v120 = v114(v119, v116);
        for _, v122 in ipairs(v120) do
            table.insert(v117, v122);
        end;
    end;
    return v117;
end;
local _ = function(v124, v125) --[[ Line: 305 ]] --[[ Name: findCandidates ]]
    -- upvalues: v123 (copy)
    for _, v127 in ipairs(v125) do
        v124 = v123(v124, v127);
    end;
    return v124;
end;
local function v145(v129, v130) --[[ Line: 312 ]] --[[ Name: passFilter ]]
    -- upvalues: v19 (copy), v0 (copy), v123 (copy)
    local l_key_0 = v130.key;
    local v132, v133 = l_key_0:match("^%.?(.*[^\\])%.(%w-)$");
    if v133 == nil then
        v132 = "";
        v133 = l_key_0:match("^%.?(%w-)$");
    end;
    local v134 = v19(v132, ".");
    for v135 = 1, #v134 do
        v134[v135] = v0.removeSlash(v134[v135]);
    end;
    local v136 = {
        v129
    };
    for _, v138 in ipairs(v134) do
        v136 = v123(v136, v138);
    end;
    for _, v140 in ipairs(v136) do
        local l_v133_0 = v133;
        local l_l_v133_0_0 = l_v133_0 --[[ copy: 13 -> 16 ]];
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 262 ]]
            -- upvalues: v140 (copy), l_l_v133_0_0 (copy)
            return v140[l_l_v133_0_0];
        end);
        l_status_2 = l_status_2 == true and l_result_2 or nil;
        l_result_2 = v0.removeSlash(v130.value);
        l_status_2 = tostring(l_status_2);
        l_result_2 = tostring(l_result_2);
        l_v133_0 = true;
        if l_result_2 ~= "*" then
            l_v133_0 = l_status_2 == l_result_2;
        end;
        if l_v133_0 then
            return true;
        end;
    end;
    return false;
end;
local function v150(v146, v147) --[[ Line: 331 ]] --[[ Name: passFilters ]]
    -- upvalues: v145 (copy)
    for _, v149 in ipairs(v147) do
        if not v145(v146, v149) then
            return false;
        end;
    end;
    return true;
end;
local function v156(v151, v152) --[[ Line: 340 ]] --[[ Name: applyFilters ]]
    -- upvalues: v150 (copy)
    if v152 == nil then
        return v151;
    else
        local v153 = {};
        for _, v155 in ipairs(v151) do
            if v150(v155, v152) then
                table.insert(v153, v155);
            end;
        end;
        return v153;
    end;
end;
v0.getFirstInstance = function(v157) --[[ Line: 351 ]] --[[ Name: getFirstInstance ]]
    local v158 = v157:getInstances();
    if #v158 == 0 then
        return nil;
    else
        return v158[1];
    end;
end;
v0.getInstances = function(v159) --[[ Line: 356 ]] --[[ Name: getInstances ]]
    -- upvalues: v123 (copy), v156 (copy)
    if v159:size() < 1 then
        error("instance " .. v159:toString() .. " does not exist");
    end;
    local v160 = nil;
    local l_name_0 = v159.data[1].name;
    if l_name_0 == "game" then
        v160 = game;
    elseif l_name_0 == "PluginGuiService" then
        v160 = game:GetService("PluginGuiService");
    end;
    if v159.root == nil and v160 == nil then
        error("instance " .. v159:toString() .. " does not exist");
    end;
    local v162 = {
        v159.root or v160
    };
    local v163 = v159.root and 1 or 2;
    while true do
        if v163 <= v159:size() then
            local l_name_1 = v159.data[v163].name;
            local l_filter_0 = v159.data[v163].filter;
            local v166 = v123(v162, l_name_1);
            v162 = v156(v166, l_filter_0);
            if #v162 == 0 then
                return v162, v163 - 1;
            else
                v163 = v163 + 1;
            end;
        else
            return v162, v163 - 1;
        end;
    end;
end;
v0.setWait = function(v167, v168, v169) --[[ Line: 385 ]] --[[ Name: setWait ]]
    v167.waitDelay = v169 or v167.waitDelay;
    v167.waitTimeOut = v168 or v167.waitTimeOut;
    return v167;
end;
v0.waitFor = function(v170, v171, v172, v173, v174) --[[ Line: 391 ]] --[[ Name: waitFor ]]
    v173 = v173 or v170.waitDelay;
    local v175 = v174 or v170.waitTimeOut;
    v174 = tick() + v175;
    while true do
        v175 = v171();
        if v172(v175) then
            return v175, true;
        else
            wait(v173);
            if v174 < tick() then
                return v175, false;
            end;
        end;
    end;
end;
v0.waitForFirstInstance = function(v176) --[[ Line: 405 ]] --[[ Name: waitForFirstInstance ]]
    local v177 = v176:waitForNInstances(1);
    if v177 ~= nil and #v177 > 0 then
        return v177[1];
    else
        return nil;
    end;
end;
v0.waitForInstances = function(v178, v179) --[[ Line: 412 ]] --[[ Name: waitForInstances ]]
    if type(v179) ~= "function" then
        error("arg #1 should be a function");
    end;
    return v178:waitFor(function() --[[ Line: 414 ]]
        -- upvalues: v178 (copy)
        return v178:getInstances();
    end, v179);
end;
v0.waitForDisappear = function(v180) --[[ Line: 419 ]] --[[ Name: waitForDisappear ]]
    local _, v183 = v180:waitForInstances(function(v181) --[[ Line: 420 ]]
        return #v181 == 0;
    end);
    return v183 == true;
end;
v0.waitForNInstances = function(v184, v185) --[[ Line: 424 ]] --[[ Name: waitForNInstances ]]
    return v184:waitForInstances(function(v186) --[[ Line: 425 ]]
        -- upvalues: v185 (copy)
        return #v186 >= v185;
    end);
end;
local function v195(v187, v188, v189) --[[ Line: 430 ]] --[[ Name: makeInstance ]]
    local v190 = Instance.new(v187);
    if v189 then
        for _, v192 in ipairs(v189) do
            v192.Parent = v190;
        end;
    end;
    if v188 then
        for v193, v194 in pairs(v188) do
            v190[v193] = v194;
        end;
    end;
    return v190;
end;
local _ = function() --[[ Line: 445 ]] --[[ Name: test ]]
    -- upvalues: v195 (copy), v0 (copy)
    local function _(v196, v197, v198) --[[ Line: 446 ]] --[[ Name: closeTo ]]
        return math.abs(v196 - v197) <= v198;
    end;
    local v200 = nil;
    if game.Workspace:FindFirstChild("root") == nil then
        v200 = v195("Folder", {
            Name = "root", 
            Parent = game.Workspace
        }, {
            v195("Frame", {
                Name = "Frame"
            }, {
                v195("TextButton", {
                    Text = "Button1"
                }), 
                v195("TextLabel", {
                    Text = "Label1"
                }), 
                (v195("ImageButton", {}))
            }), 
            v195("Frame", {
                Name = "Frame"
            }, {
                v195("TextButton", {
                    Text = "Button2"
                }), 
                (v195("TextLabel", {
                    Text = "Label2"
                }))
            }), 
            (v195("Frame", {
                Name = "Frame"
            }, {
                v195("TextLabel", {
                    Text = "Label3"
                }), 
                v195("Frame", {
                    Name = "special chars !\"#$%&'()*+,-./:;<=>?@[]\\^_`{|}~"
                }, {
                    (v195("TextButton", {
                        Name = "TextButton3"
                    }))
                }), 
                (v195("TextLabel", {
                    Name = "SpecialCharLabel", 
                    Text = "special chars !\"#$%&'()*+,-./:;<=>?@[]\\^_`{|}~"
                }))
            }))
        });
    end;
    local v201 = v0.new("game.Workspace.root.Frame");
    local function _(v202) --[[ Line: 491 ]]
        -- upvalues: v0 (ref)
        return {
            textButton = v0.new("TextButton", v202), 
            textLabel = v0.new("TextLabel", v202)
        };
    end;
    local v210 = (function(v204, v205, v206, v207) --[[ Line: 498 ]]
        local v208 = v204:copy();
        local v209 = {
            {
                key = "." .. v205:toString() .. "." .. v206, 
                value = v207
            }
        };
        v208:mergeFilter(v208:size(), v209);
        return v208;
    end)(v201, ({
        textButton = v0.new("TextButton", nil), 
        textLabel = v0.new("TextLabel", nil)
    }).textButton, "Text", "Button2");
    print("createSearch:", v210:toString());
    local v211 = v210:waitForFirstInstance();
    assert(v211);
    assert(({
        textButton = v0.new("TextButton", v211), 
        textLabel = v0.new("TextLabel", v211)
    }).textLabel:waitForFirstInstance().Text == "Label2");
    print("relative path test");
    local v212 = v0.new("game.Workspace.root.Frame[.TextButton.Text = Button2]"):getFirstInstance();
    assert(v212);
    assert(v0.new("TextButton", v212):getFirstInstance().Text == "Button2");
    local v213 = v0.new("game.Workspace.root.Frame[.TextButton.Text = Button2, .ClassName = Frame].TextLabel"):getFirstInstance();
    assert(v213.Text == "Label2");
    assert(v0.new(v213):toString() == "game.Workspace.root.Frame.TextLabel");
    local v214 = "game.Workspace.root.Frame[." .. "special chars !\"#$%&'()*+\\,-\\./:;<\\=>?@\\[\\]\\\\^_`{|}~" .. ".TextButton3.Name = TextButton3].TextLabel";
    local v215 = v0.new(v214);
    assert(v215:toString() == v214);
    assert(v215:getFirstInstance().Text == "Label3");
    local v216 = "game.Workspace.root.Frame[.SpecialCharLabel.Text = " .. "special chars !\"#$%&'()*+\\,-\\./:;<\\=>?@\\[\\]\\\\^_`{|}~" .. "].TextLabel";
    local v217 = v0.new(v216);
    assert(v217:toString() == v216);
    assert(v217:getFirstInstance().Text == "Label3");
    local v218 = "game.Workspace.root.Frame." .. "special chars !\"#$%&'()*+\\,-\\./:;<\\=>?@\\[\\]\\\\^_`{|}~" .. ".TextButton3";
    local v219 = v0.new(v218);
    assert(v219:toString() == v218);
    assert(v219:getFirstInstance().Name == "TextButton3");
    local v220 = v0.new("game.Workspace.root");
    local v221 = v0.new("game.Workspace.root.Frame[.TextButton.Text = Button2, .ClassName = Frame].TextLabel");
    v221:relative(v220):clearFilter();
    print("testing getFirstInstance()");
    print(v221:toString());
    assert(v221:getFirstInstance().Text == "Label2");
    print("testing wildcard *");
    assert(v0.new("game.Workspace.root.*[.TextButton.Text = Button2].TextLabel"):getFirstInstance().Text == "Label2");
    assert(v0.new("game.Workspace.root.*[.ImageButton.Name = *].TextLabel"):getFirstInstance().Text == "Label1");
    local v222 = nil;
    print("testing timeout waitForNInstances() ");
    v221 = v0.new("game.Workspace.root.Frame.TextLabel");
    v222 = tick();
    local _, v224 = v221:setWait(2):waitForNInstances(5);
    assert(math.abs(tick() - v222 - 2) <= 0.5);
    assert(v224 == false);
    print("testing normal waitForNInstances() ");
    v222 = tick();
    spawn(function() --[[ Line: 578 ]]
        -- upvalues: v195 (ref)
        wait(2);
        v195("Frame", {
            Name = "Frame", 
            Parent = game.Workspace.root
        }, {
            v195("TextButton", {
                Text = "Button3"
            }), 
            (v195("TextLabel", {
                Text = "Label3"
            }))
        });
    end);
    local v225 = v221:setWait(5):waitForNInstances(5);
    assert(math.abs(tick() - v222 - 2) <= 0.5);
    assert(#v225 >= 5);
    print("testing  getFirstInstance() ");
    v221 = v0.new("game.Workspace.root.Frame[.TextButton.Text = Button3]");
    local v226 = v221:getFirstInstance();
    assert(v226.TextButton.Text == "Button3");
    print("testing timeout waitForDisappear() ");
    v222 = tick();
    assert(v221:setWait(2):waitForDisappear() == false);
    assert(math.abs(tick() - v222 - 2) <= 0.5);
    print("testing normal waitForDisappear() ");
    v222 = tick();
    spawn(function() --[[ Line: 609 ]]
        -- upvalues: v226 (ref)
        wait(2);
        v226:Destroy();
    end);
    local v227 = v221:setWait(5):waitForDisappear();
    assert(math.abs(tick() - v222 - 2) <= 0.5);
    assert(v227 == true);
    print("test finised");
end;
return v0;