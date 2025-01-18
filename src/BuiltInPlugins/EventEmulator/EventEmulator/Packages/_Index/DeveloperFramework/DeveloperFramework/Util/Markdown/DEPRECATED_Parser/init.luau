local v0 = {};
local v1 = {
    Text = 0, 
    Ref = 1
};
local v2 = {
    Bold = 0, 
    Italic = 1, 
    Strike = 2, 
    Code = 3
};
local function v4(v3) --[[ Line: 32 ]] --[[ Name: sanitize ]]
    return v3:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub("'", "&apos;");
end;
local function v11(v5) --[[ Line: 38 ]] --[[ Name: parseModifierTokens ]]
    local v6 = 1;
    return function() --[[ Line: 40 ]]
        -- upvalues: v5 (copy), v6 (ref)
        local v7, v8 = v5:match("^([^%*_~`]+)()", v6);
        if v7 and v8 then
            v6 = v8;
            return {
                flag = false, 
                text = v7
            };
        elseif v6 <= v5:len() then
            local v9, v10 = v5:match("^(%" .. v5:sub(v6, v6) .. "+)()", v6);
            v6 = v10;
            return {
                flag = true, 
                text = v9
            };
        else
            return nil;
        end;
    end;
end;
local v12 = {
    ["*"] = v2.Bold, 
    _ = v2.Italic, 
    ["~"] = v2.Strike, 
    ["`"] = v2.Code
};
local function _(v13) --[[ Line: 62 ]] --[[ Name: getRichTextModifierType ]]
    -- upvalues: v12 (copy)
    return v12[v13:sub(1, 1)];
end;
local function v34(v15) --[[ Line: 66 ]] --[[ Name: richText ]]
    -- upvalues: v4 (copy), v2 (copy), v12 (copy)
    v15 = v4(v15);
    local v16 = {
        [v2.Bold] = {
            "<b>", 
            "</b>"
        }, 
        [v2.Italic] = {
            "<i>", 
            "</i>"
        }, 
        [v2.Strike] = {
            "<s>", 
            "</s>"
        }, 
        [v2.Code] = {
            "<font face=\"RobotoMono\">", 
            "</font>"
        }
    };
    local v17 = {};
    local v18 = "";
    local l_v15_0 = v15;
    local v20 = 1;
    local l_l_v15_0_0 = l_v15_0 --[[ copy: 7 -> 11 ]];
    local v22, v23, v24;
    do
        local l_v20_0 = v20;
        v22 = function() --[[ Line: 40 ]]
            -- upvalues: l_l_v15_0_0 (copy), l_v20_0 (ref)
            local v26, v27 = l_l_v15_0_0:match("^([^%*_~`]+)()", l_v20_0);
            if v26 and v27 then
                l_v20_0 = v27;
                return {
                    flag = false, 
                    text = v26
                };
            elseif l_v20_0 <= l_l_v15_0_0:len() then
                local v28, v29 = l_l_v15_0_0:match("^(%" .. l_l_v15_0_0:sub(l_v20_0, l_v20_0) .. "+)()", l_v20_0);
                l_v20_0 = v29;
                return {
                    flag = true, 
                    text = v28
                };
            else
                return nil;
            end;
        end;
        v23 = nil;
        v24 = nil;
    end;
    for v30 in v22, v23, v24 do
        if v30.flag then
            local v31 = v12[v30.text:sub(1, 1)];
            if v17[v2.Code] and v31 ~= v2.Code then
                v18 = v18 .. v30.text;
            else
                local v32 = v17[v31];
                if not v32 then
                    v18 = v18 .. v16[v31][1];
                    v17[v31] = v30.text;
                elseif v30.text == v32 then
                    v18 = v18 .. v16[v31][2];
                    v17[v31] = nil;
                else
                    v18 = v18 .. v30.text;
                end;
            end;
        else
            v18 = v18 .. v30.text;
        end;
    end;
    for v33 in pairs(v17) do
        v18 = v18 .. v16[v33][2];
    end;
    return v18;
end;
local function v43(v35) --[[ Line: 108 ]] --[[ Name: parseLinks ]]
    local v36 = {};
    local v37 = "";
    local v38 = 1;
    while v38 <= v35:len() do
        local v39, v40, v41, v42 = v35:find("%[([^%]]+)%]%(([^%)]+)%)", v38);
        if v39 then
            v37 = v37 .. v35:sub(v38, v39 - 1) .. ("[%*]"):format(v41);
            table.insert(v36, {
                Text = v41, 
                Url = v42
            });
            v38 = v40 + 1;
        else
            v37 = v37 .. v35:sub(v38);
            break;
        end;
    end;
    return v37, v36;
end;
local v44 = {
    None = 0, 
    Paragraph = 1, 
    Heading = 2, 
    Code = 3, 
    List = 4, 
    Ruler = 5, 
    Quote = 6
};
local v45 = {
    [v44.None] = true, 
    [v44.Paragraph] = true, 
    [v44.Code] = true, 
    [v44.List] = true, 
    [v44.Quote] = true
};
local function _(v46) --[[ Line: 149 ]] --[[ Name: cleanup ]]
    return v46:gsub("\t", "    ");
end;
local function _(v48) --[[ Line: 153 ]] --[[ Name: getTextWithIndentation ]]
    local v49, v50 = v48:match("^%s*()(.*)");
    return v50, (math.floor(v49 / 2));
end;
local function _(v52) --[[ Line: 159 ]] --[[ Name: lines ]]
    return (v52 .. "\n"):gmatch("(.-)\n");
end;
local function _(v54) --[[ Line: 165 ]] --[[ Name: blockLines ]]
    -- upvalues: v44 (copy)
    local l_None_0 = v44.None;
    local v56 = (v54 .. "\n"):gmatch("(.-)\n");
    return function() --[[ Line: 168 ]] --[[ Name: it ]]
        -- upvalues: v56 (copy), l_None_0 (ref), v44 (ref)
        local v57 = v56();
        if v57 then
            if l_None_0 == v44.Code then
                if v57:match("^```") then
                    l_None_0 = v44.None;
                end;
                return v44.Code, v57;
            elseif v57:match("^%s*$") then
                return v44.None, "";
            elseif v57:match("^%-%-%-+") or v57:match("^===+") then
                return v44.Ruler, "";
            elseif v57:match("^#") then
                return v44.Heading, v57;
            elseif v57:match("^%s*```") then
                l_None_0 = v44.Code;
                return l_None_0, v57;
            elseif v57:match("^%s*>") then
                return v44.Quote, v57;
            elseif v57:match("^%s*%-%s+") or v57:match("^%s*%*%s+") or v57:match("^%s*[%u%d]+%.%s+") or v57:match("^%s*%+%s+") then
                return v44.List, v57;
            else
                return v44.Paragraph, v57;
            end;
        else
            return nil;
        end;
    end;
end;
local function _(v59) --[[ Line: 218 ]] --[[ Name: textBlocks ]]
    -- upvalues: v44 (copy), v45 (copy)
    local l_None_1 = v44.None;
    local v61 = (v59 .. "\n"):gmatch("(.-)\n");
    local l_v61_0 = v61 --[[ copy: 3 -> 4 ]];
    local v63;
    do
        local l_l_None_1_0 = l_None_1;
        v63 = function() --[[ Line: 168 ]] --[[ Name: it ]]
            -- upvalues: l_v61_0 (copy), l_l_None_1_0 (ref), v44 (ref)
            local v65 = l_v61_0();
            if v65 then
                if l_l_None_1_0 == v44.Code then
                    if v65:match("^```") then
                        l_l_None_1_0 = v44.None;
                    end;
                    return v44.Code, v65;
                elseif v65:match("^%s*$") then
                    return v44.None, "";
                elseif v65:match("^%-%-%-+") or v65:match("^===+") then
                    return v44.Ruler, "";
                elseif v65:match("^#") then
                    return v44.Heading, v65;
                elseif v65:match("^%s*```") then
                    l_l_None_1_0 = v44.Code;
                    return l_l_None_1_0, v65;
                elseif v65:match("^%s*>") then
                    return v44.Quote, v65;
                elseif v65:match("^%s*%-%s+") or v65:match("^%s*%*%s+") or v65:match("^%s*[%u%d]+%.%s+") or v65:match("^%s*%+%s+") then
                    return v44.List, v65;
                else
                    return v44.Paragraph, v65;
                end;
            else
                return nil;
            end;
        end;
    end;
    l_None_1, v61 = v63();
    return function() --[[ Line: 221 ]]
        -- upvalues: v63 (copy), v44 (ref), l_None_1 (ref), v61 (ref), v45 (ref)
        local v66, v67 = v63();
        if v66 == v44.Ruler and l_None_1 == v44.Paragraph then
            local l_v61_1 = v61;
            local v69, v70 = v63();
            l_None_1 = v69;
            v61 = v70;
            if v61 and l_v61_1 then
                return v44.Heading, ("#"):rep(v61:sub(1, 1) == "=" and 2 or 1) .. " " .. l_v61_1;
            else
                error("Reached the end of the md");
            end;
        end;
        local v71 = {
            v61
        };
        if v66 then
            while v45[v66] and v66 == l_None_1 do
                table.insert(v71, v67);
                local v72, v73 = v63();
                v66 = v72;
                v67 = v73;
            end;
        end;
        local l_l_None_1_1 = l_None_1;
        local v75 = table.concat(v71, "\n");
        l_None_1 = v66;
        v61 = v67;
        return l_l_None_1_1, v75;
    end;
end;
local function v77(v78, v79) --[[ Line: 250 ]] --[[ Name: blocks ]]
    -- upvalues: v44 (copy), v45 (copy), v43 (copy), v4 (copy), v77 (copy)
    local l_None_2 = v44.None;
    local v81 = (v78 .. "\n"):gmatch("(.-)\n");
    local l_v81_0 = v81 --[[ copy: 5 -> 6 ]];
    local v83;
    do
        local l_l_None_2_0 = l_None_2;
        v83 = function() --[[ Line: 168 ]] --[[ Name: it ]]
            -- upvalues: l_v81_0 (copy), l_l_None_2_0 (ref), v44 (ref)
            local v85 = l_v81_0();
            if v85 then
                if l_l_None_2_0 == v44.Code then
                    if v85:match("^```") then
                        l_l_None_2_0 = v44.None;
                    end;
                    return v44.Code, v85;
                elseif v85:match("^%s*$") then
                    return v44.None, "";
                elseif v85:match("^%-%-%-+") or v85:match("^===+") then
                    return v44.Ruler, "";
                elseif v85:match("^#") then
                    return v44.Heading, v85;
                elseif v85:match("^%s*```") then
                    l_l_None_2_0 = v44.Code;
                    return l_l_None_2_0, v85;
                elseif v85:match("^%s*>") then
                    return v44.Quote, v85;
                elseif v85:match("^%s*%-%s+") or v85:match("^%s*%*%s+") or v85:match("^%s*[%u%d]+%.%s+") or v85:match("^%s*%+%s+") then
                    return v44.List, v85;
                else
                    return v44.Paragraph, v85;
                end;
            else
                return nil;
            end;
        end;
    end;
    l_None_2, v81 = v83();
    local l_v83_0 = v83 --[[ copy: 3 -> 7 ]];
    local v87;
    do
        local l_l_None_2_1, l_v81_1 = l_None_2, v81;
        v87 = function() --[[ Line: 221 ]]
            -- upvalues: l_v83_0 (copy), v44 (ref), l_l_None_2_1 (ref), l_v81_1 (ref), v45 (ref)
            local v90, v91 = l_v83_0();
            if v90 == v44.Ruler and l_l_None_2_1 == v44.Paragraph then
                local l_l_v81_1_0 = l_v81_1;
                local v93, v94 = l_v83_0();
                l_l_None_2_1 = v93;
                l_v81_1 = v94;
                if l_v81_1 and l_l_v81_1_0 then
                    return v44.Heading, ("#"):rep(l_v81_1:sub(1, 1) == "=" and 2 or 1) .. " " .. l_l_v81_1_0;
                else
                    error("Reached the end of the md");
                end;
            end;
            local v95 = {
                l_v81_1
            };
            if v90 then
                while v45[v90] and v90 == l_l_None_2_1 do
                    table.insert(v95, v91);
                    local v96, v97 = l_v83_0();
                    v90 = v96;
                    v91 = v97;
                end;
            end;
            local l_l_l_None_2_1_0 = l_l_None_2_1;
            local v99 = table.concat(v95, "\n");
            l_l_None_2_1 = v90;
            l_v81_1 = v91;
            return l_l_l_None_2_1_0, v99;
        end;
    end;
    v83 = function() --[[ Line: 252 ]] --[[ Name: it ]]
        -- upvalues: v87 (copy), v44 (ref), v83 (copy), v79 (copy), v43 (ref), v4 (ref), v77 (ref)
        local v100, v101 = v87();
        if v100 == v44.None then
            return v83();
        else
            local v102 = {};
            if v100 then
                local v103, v104 = v101:match("^%s*()(.*)");
                local l_v104_0 = v104;
                v102.Indent = math.floor(v103 / 2);
                if v100 == v44.Paragraph then
                    v102.Text = v79(l_v104_0);
                    v103, v104 = v43(v102.Text);
                    v102.Text = v103;
                    v102.Links = v104;
                elseif v100 == v44.Heading then
                    v103, v104 = v101:match("^#+()%s*(.*)");
                    if v103 and v104 then
                        local v106 = v103 - 1;
                        local v107 = v79(v104);
                        v102.Level = v106;
                        v102.Text = v107;
                    end;
                elseif v100 == v44.Code then
                    v103, v104 = l_v104_0:match("^```(.-)\n(.*)\n```$");
                    if v103 and v104 then
                        local v108 = v103 == "lua" and v104 or v4(v104);
                        v102.Syntax = v103;
                        v102.Code = v108;
                    end;
                elseif v100 == v44.List then
                    v103 = v101:split("\n");
                    v104 = {};
                    for v109, v110 in ipairs(v103) do
                        local v111, v112 = v110:match("^%s*()(.*)");
                        local l_v112_0 = v112;
                        local v114 = math.floor(v111 / 2);
                        v111, v112 = l_v112_0:match("^(.-)%s+(.*)");
                        if v111 and v112 then
                            v104[v109] = {
                                Level = v114, 
                                Text = v79(v112), 
                                Symbol = v111, 
                                Links = {}
                            };
                            local v115 = v104[v109];
                            local v116 = v104[v109];
                            local v117, v118 = v43(v104[v109].Text);
                            v115.Text = v117;
                            v116.Links = v118;
                        end;
                    end;
                    v102.Lines = v104;
                elseif v100 == v44.Quote then
                    v103 = v101:split("\n");
                    for v119 = 1, #v103 do
                        v103[v119] = v103[v119]:match("^%s*>%s*(.*)");
                    end;
                    v104 = table.concat(v103, "\n");
                    local v120 = v77(v104, v79);
                    v102.RawText = v104;
                    v102.Iterator = v120;
                end;
            end;
            return v100, v102;
        end;
    end;
    return v83;
end;
local function v166(v121, v122) --[[ Line: 305 ]] --[[ Name: parseDocument ]]
    -- upvalues: v34 (copy), v44 (copy), v45 (copy), v43 (copy), v4 (copy), v77 (copy)
    local v123 = v121:gsub("\t", "    ");
    local v124 = v122 or v34;
    local l_None_3 = v44.None;
    local v126 = (v123 .. "\n"):gmatch("(.-)\n");
    local l_v126_0 = v126 --[[ copy: 8 -> 9 ]];
    local v128;
    do
        local l_l_None_3_0 = l_None_3;
        v128 = function() --[[ Line: 168 ]] --[[ Name: it ]]
            -- upvalues: l_v126_0 (copy), l_l_None_3_0 (ref), v44 (ref)
            local v130 = l_v126_0();
            if v130 then
                if l_l_None_3_0 == v44.Code then
                    if v130:match("^```") then
                        l_l_None_3_0 = v44.None;
                    end;
                    return v44.Code, v130;
                elseif v130:match("^%s*$") then
                    return v44.None, "";
                elseif v130:match("^%-%-%-+") or v130:match("^===+") then
                    return v44.Ruler, "";
                elseif v130:match("^#") then
                    return v44.Heading, v130;
                elseif v130:match("^%s*```") then
                    l_l_None_3_0 = v44.Code;
                    return l_l_None_3_0, v130;
                elseif v130:match("^%s*>") then
                    return v44.Quote, v130;
                elseif v130:match("^%s*%-%s+") or v130:match("^%s*%*%s+") or v130:match("^%s*[%u%d]+%.%s+") or v130:match("^%s*%+%s+") then
                    return v44.List, v130;
                else
                    return v44.Paragraph, v130;
                end;
            else
                return nil;
            end;
        end;
    end;
    l_None_3, v126 = v128();
    local l_v128_0 = v128 --[[ copy: 6 -> 10 ]];
    local v132;
    do
        local l_l_None_3_1, l_v126_1 = l_None_3, v126;
        v132 = function() --[[ Line: 221 ]]
            -- upvalues: l_v128_0 (copy), v44 (ref), l_l_None_3_1 (ref), l_v126_1 (ref), v45 (ref)
            local v135, v136 = l_v128_0();
            if v135 == v44.Ruler and l_l_None_3_1 == v44.Paragraph then
                local l_l_v126_1_0 = l_v126_1;
                local v138, v139 = l_v128_0();
                l_l_None_3_1 = v138;
                l_v126_1 = v139;
                if l_v126_1 and l_l_v126_1_0 then
                    return v44.Heading, ("#"):rep(l_v126_1:sub(1, 1) == "=" and 2 or 1) .. " " .. l_l_v126_1_0;
                else
                    error("Reached the end of the md");
                end;
            end;
            local v140 = {
                l_v126_1
            };
            if v135 then
                while v45[v135] and v135 == l_l_None_3_1 do
                    table.insert(v140, v136);
                    local v141, v142 = l_v128_0();
                    v135 = v141;
                    v136 = v142;
                end;
            end;
            local l_l_l_None_3_1_0 = l_l_None_3_1;
            local v144 = table.concat(v140, "\n");
            l_l_None_3_1 = v135;
            l_v126_1 = v136;
            return l_l_l_None_3_1_0, v144;
        end;
    end;
    v128 = function() --[[ Line: 252 ]] --[[ Name: it ]]
        -- upvalues: v132 (copy), v44 (ref), v128 (copy), v124 (copy), v43 (ref), v4 (ref), v77 (ref)
        local v145, v146 = v132();
        if v145 == v44.None then
            return v128();
        else
            local v147 = {};
            if v145 then
                local v148, v149 = v146:match("^%s*()(.*)");
                local l_v149_0 = v149;
                v147.Indent = math.floor(v148 / 2);
                if v145 == v44.Paragraph then
                    v147.Text = v124(l_v149_0);
                    v148, v149 = v43(v147.Text);
                    v147.Text = v148;
                    v147.Links = v149;
                elseif v145 == v44.Heading then
                    v148, v149 = v146:match("^#+()%s*(.*)");
                    if v148 and v149 then
                        local v151 = v148 - 1;
                        local v152 = v124(v149);
                        v147.Level = v151;
                        v147.Text = v152;
                    end;
                elseif v145 == v44.Code then
                    v148, v149 = l_v149_0:match("^```(.-)\n(.*)\n```$");
                    if v148 and v149 then
                        local v153 = v148 == "lua" and v149 or v4(v149);
                        v147.Syntax = v148;
                        v147.Code = v153;
                    end;
                elseif v145 == v44.List then
                    v148 = v146:split("\n");
                    v149 = {};
                    for v154, v155 in ipairs(v148) do
                        local v156, v157 = v155:match("^%s*()(.*)");
                        local l_v157_0 = v157;
                        local v159 = math.floor(v156 / 2);
                        v156, v157 = l_v157_0:match("^(.-)%s+(.*)");
                        if v156 and v157 then
                            v149[v154] = {
                                Level = v159, 
                                Text = v124(v157), 
                                Symbol = v156, 
                                Links = {}
                            };
                            local v160 = v149[v154];
                            local v161 = v149[v154];
                            local v162, v163 = v43(v149[v154].Text);
                            v160.Text = v162;
                            v161.Links = v163;
                        end;
                    end;
                    v147.Lines = v149;
                elseif v145 == v44.Quote then
                    v148 = v146:split("\n");
                    for v164 = 1, #v148 do
                        v148[v164] = v148[v164]:match("^%s*>%s*(.*)");
                    end;
                    v149 = table.concat(v148, "\n");
                    local v165 = v77(v149, v124);
                    v147.RawText = v149;
                    v147.Iterator = v165;
                end;
            end;
            return v145, v147;
        end;
    end;
    return v128;
end;
v0.sanitize = v4;
v0.parse = v166;
v0.parseTokens = v11;
v0.BlockType = v44;
v0.InlineType = v1;
v0.ModifierType = v2;
return v0;