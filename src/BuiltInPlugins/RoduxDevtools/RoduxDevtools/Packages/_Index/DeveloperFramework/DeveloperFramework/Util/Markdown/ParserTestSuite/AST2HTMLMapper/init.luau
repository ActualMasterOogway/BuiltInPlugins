local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Util.Markdown.Types);
local v2 = {};
local v3 = {};
local function v6(v4) --[[ Line: 7 ]] --[[ Name: map ]]
    -- upvalues: v3 (ref)
    local v5 = v3[v4.name];
    if v5 then
        return v5(v4);
    else
        error((("No handler found for node %*"):format(v4.name)));
        return;
    end;
end;
local _ = function(v7) --[[ Line: 16 ]] --[[ Name: processChildren ]]
    -- upvalues: v3 (ref)
    if not v7 then
        return "";
    else
        local v8 = "";
        for _, v10 in v7 do
            local l_v8_0 = v8;
            local v12 = v3[v10.name];
            local v13;
            if v12 then
                v13 = v12(v10);
            else
                error((("No handler found for node %*"):format(v10.name)));
                v13 = nil;
            end;
            v8 = l_v8_0 .. v13;
        end;
        return v8;
    end;
end;
local function v23(v15) --[[ Line: 28 ]] --[[ Name: handleRoot ]]
    -- upvalues: v3 (ref)
    local l_children_0 = v15.children;
    if not l_children_0 then
        return "";
    else
        local v17 = "";
        for _, v19 in l_children_0 do
            local l_v17_0 = v17;
            local v21 = v3[v19.name];
            local v22;
            if v21 then
                v22 = v21(v19);
            else
                error((("No handler found for node %*"):format(v19.name)));
                v22 = nil;
            end;
            v17 = l_v17_0 .. v22;
        end;
        return v17;
    end;
end;
local function v36(v24) --[[ Line: 32 ]] --[[ Name: handleHeading ]]
    -- upvalues: v3 (ref)
    local v25 = if v24.attributes then v24.attributes.depth else 1;
    local v26 = "<h%*>%*</h%*>\n";
    local l_v25_0 = v25;
    local l_children_1 = v24.children;
    local v29;
    if not l_children_1 then
        v29 = "";
    else
        local v30 = "";
        for _, v32 in l_children_1 do
            local l_v30_0 = v30;
            local v34 = v3[v32.name];
            local v35;
            if v34 then
                v35 = v34(v32);
            else
                error((("No handler found for node %*"):format(v32.name)));
                v35 = nil;
            end;
            v30 = l_v30_0 .. v35;
        end;
        v29 = v30;
    end;
    return (v26:format(l_v25_0, v29, v25));
end;
local function v47(v37) --[[ Line: 37 ]] --[[ Name: handleParagraph ]]
    -- upvalues: v3 (ref)
    local v38 = "<p>%*</p>\n";
    local l_children_2 = v37.children;
    local v40;
    if not l_children_2 then
        v40 = "";
    else
        local v41 = "";
        for _, v43 in l_children_2 do
            local l_v41_0 = v41;
            local v45 = v3[v43.name];
            local v46;
            if v45 then
                v46 = v45(v43);
            else
                error((("No handler found for node %*"):format(v43.name)));
                v46 = nil;
            end;
            v41 = l_v41_0 .. v46;
        end;
        v40 = v41;
    end;
    return (v38:format(v40));
end;
local function v48() --[[ Line: 41 ]] --[[ Name: handleThematicBreak ]]
    return "<hr />\n";
end;
local function v59(v49) --[[ Line: 45 ]] --[[ Name: handleBlockquote ]]
    -- upvalues: v3 (ref)
    local v50 = "<blockquote>\n%*</blockquote>\n";
    local l_children_3 = v49.children;
    local v52;
    if not l_children_3 then
        v52 = "";
    else
        local v53 = "";
        for _, v55 in l_children_3 do
            local l_v53_0 = v53;
            local v57 = v3[v55.name];
            local v58;
            if v57 then
                v58 = v57(v55);
            else
                error((("No handler found for node %*"):format(v55.name)));
                v58 = nil;
            end;
            v53 = l_v53_0 .. v58;
        end;
        v52 = v53;
    end;
    return (v50:format(v52));
end;
local function v61(v60) --[[ Line: 49 ]] --[[ Name: handleCodeBlock ]]
    return (("<pre><code>%*</code></pre>\n"):format(v60.text));
end;
local function v74(v62) --[[ Line: 53 ]] --[[ Name: handleList ]]
    -- upvalues: v3 (ref)
    local v63 = if v62.attributes then v62.attributes.ordered and "ol" or "ul" else "ul";
    local v64 = "<%*>\n%*</%*>\n";
    local l_v63_0 = v63;
    local l_children_4 = v62.children;
    local v67;
    if not l_children_4 then
        v67 = "";
    else
        local v68 = "";
        for _, v70 in l_children_4 do
            local l_v68_0 = v68;
            local v72 = v3[v70.name];
            local v73;
            if v72 then
                v73 = v72(v70);
            else
                error((("No handler found for node %*"):format(v70.name)));
                v73 = nil;
            end;
            v68 = l_v68_0 .. v73;
        end;
        v67 = v68;
    end;
    return (v64:format(l_v63_0, v67, v63));
end;
local function v85(v75) --[[ Line: 58 ]] --[[ Name: handleListItem ]]
    -- upvalues: v3 (ref)
    local v76 = "<li>%*</li>\n";
    local l_children_5 = v75.children;
    local v78;
    if not l_children_5 then
        v78 = "";
    else
        local v79 = "";
        for _, v81 in l_children_5 do
            local l_v79_0 = v79;
            local v83 = v3[v81.name];
            local v84;
            if v83 then
                v84 = v83(v81);
            else
                error((("No handler found for node %*"):format(v81.name)));
                v84 = nil;
            end;
            v79 = l_v79_0 .. v84;
        end;
        v78 = v79;
    end;
    return (v76:format(v78));
end;
local function v122(v86) --[[ Line: 62 ]] --[[ Name: handleStyledText ]]
    -- upvalues: v3 (ref)
    local v87 = if v86.attributes then v86.attributes.style else nil;
    if v87 == "BOLD" or v87 == "ITALIC" then
        local v88 = "<em>%*</em>";
        local l_children_6 = v86.children;
        local v90;
        if not l_children_6 then
            v90 = "";
        else
            local v91 = "";
            for _, v93 in l_children_6 do
                local l_v91_0 = v91;
                local v95 = v3[v93.name];
                local v96;
                if v95 then
                    v96 = v95(v93);
                else
                    error((("No handler found for node %*"):format(v93.name)));
                    v96 = nil;
                end;
                v91 = l_v91_0 .. v96;
            end;
            v90 = v91;
        end;
        return (v88:format(v90));
    elseif v87 == "BOLD_2" or v87 == "ITALIC_2" then
        local v97 = "<strong>%*</strong>";
        local l_children_7 = v86.children;
        local v99;
        if not l_children_7 then
            v99 = "";
        else
            local v100 = "";
            for _, v102 in l_children_7 do
                local l_v100_0 = v100;
                local v104 = v3[v102.name];
                local v105;
                if v104 then
                    v105 = v104(v102);
                else
                    error((("No handler found for node %*"):format(v102.name)));
                    v105 = nil;
                end;
                v100 = l_v100_0 .. v105;
            end;
            v99 = v100;
        end;
        return (v97:format(v99));
    elseif v87 == "STRIKE" then
        local v106 = "<u>%*</u>";
        local l_children_8 = v86.children;
        local v108;
        if not l_children_8 then
            v108 = "";
        else
            local v109 = "";
            for _, v111 in l_children_8 do
                local l_v109_0 = v109;
                local v113 = v3[v111.name];
                local v114;
                if v113 then
                    v114 = v113(v111);
                else
                    error((("No handler found for node %*"):format(v111.name)));
                    v114 = nil;
                end;
                v109 = l_v109_0 .. v114;
            end;
            v108 = v109;
        end;
        return (v106:format(v108));
    elseif v87 == nil then
        local l_children_9 = v86.children;
        if not l_children_9 then
            return "";
        else
            local v116 = "";
            for _, v118 in l_children_9 do
                local l_v116_0 = v116;
                local v120 = v3[v118.name];
                local v121;
                if v120 then
                    v121 = v120(v118);
                else
                    error((("No handler found for node %*"):format(v118.name)));
                    v121 = nil;
                end;
                v116 = l_v116_0 .. v121;
            end;
            return v116;
        end;
    else
        error((("Unknown text style %*"):format(v87)));
        return;
    end;
end;
local function v124(v123) --[[ Line: 77 ]] --[[ Name: handleText ]]
    return v123.text or "";
end;
local function v126(v125) --[[ Line: 81 ]] --[[ Name: handleCodeSpan ]]
    return (("<code>%*</code>"):format(v125.text));
end;
local function v139(v127) --[[ Line: 85 ]] --[[ Name: handleLink ]]
    -- upvalues: v3 (ref)
    local v128 = if v127.attributes then v127.attributes.link else "";
    local v129 = "<a href=\"%*\">%*</a>";
    local l_v128_0 = v128;
    local l_children_10 = v127.children;
    local v132;
    if not l_children_10 then
        v132 = "";
    else
        local v133 = "";
        for _, v135 in l_children_10 do
            local l_v133_0 = v133;
            local v137 = v3[v135.name];
            local v138;
            if v137 then
                v138 = v137(v135);
            else
                error((("No handler found for node %*"):format(v135.name)));
                v138 = nil;
            end;
            v133 = l_v133_0 .. v138;
        end;
        v132 = v133;
    end;
    return (v129:format(l_v128_0, v132));
end;
local function v156(v140) --[[ Line: 90 ]] --[[ Name: handleTag ]]
    -- upvalues: v3 (ref)
    local l_text_0 = v140.text;
    if not l_text_0 or l_text_0 == "" then
        error("TAG node must have a text value");
    end;
    local v142 = "";
    if v140.attributes then
        for v143, v144 in v140.attributes do
            v142 = ("%* %*=\"%*\""):format(v142, v143, v144);
        end;
    end;
    if v140.children then
        local v145 = "<%*%*>%*</%*>";
        local l_l_text_0_0 = l_text_0;
        local l_v142_0 = v142;
        local l_children_11 = v140.children;
        local v149;
        if not l_children_11 then
            v149 = "";
        else
            local v150 = "";
            for _, v152 in l_children_11 do
                local l_v150_0 = v150;
                local v154 = v3[v152.name];
                local v155;
                if v154 then
                    v155 = v154(v152);
                else
                    error((("No handler found for node %*"):format(v152.name)));
                    v155 = nil;
                end;
                v150 = l_v150_0 .. v155;
            end;
            v149 = v150;
        end;
        return (v145:format(l_l_text_0_0, l_v142_0, v149, l_text_0));
    else
        return (("<%*%*/>"):format(l_text_0, v142));
    end;
end;
local function v157() --[[ Line: 108 ]] --[[ Name: handleLineBreak ]]
    return "<br />";
end;
local function v159(v158) --[[ Line: 112 ]] --[[ Name: handleImage ]]
    return (("<img src=\"%*\" alt=\"%*\"/>"):format(v158.url or "", v158.text or ""));
end;
local function v168(v160) --[[ Line: 118 ]] --[[ Name: emptyHandler ]]
    -- upvalues: v3 (ref)
    local l_children_12 = v160.children;
    if not l_children_12 then
        return "";
    else
        local v162 = "";
        for _, v164 in l_children_12 do
            local l_v162_0 = v162;
            local v166 = v3[v164.name];
            local v167;
            if v166 then
                v167 = v166(v164);
            else
                error((("No handler found for node %*"):format(v164.name)));
                v167 = nil;
            end;
            v162 = l_v162_0 .. v167;
        end;
        return v162;
    end;
end;
v3 = {
    ROOT = v23, 
    HEADING = v36, 
    PARAGRAPH = v47, 
    TEXT = v124, 
    STYLED_TEXT = v122, 
    INLINE_CODE = v126, 
    DIVIDER = v48, 
    DIVIDER_2 = v48, 
    QUOTE = v59, 
    CODE_BLOCK = v61, 
    LIST = v74, 
    LIST_ITEM = v85, 
    LINK = v139, 
    TAG = v156, 
    LINE_BREAK = v157, 
    IMAGE = v159, 
    TABLE_HEADER = v168, 
    TABLE_ROW = v168, 
    ACTION = v168
};
v2.map = function(v169) --[[ Line: 145 ]] --[[ Name: map ]]
    -- upvalues: v6 (copy)
    return v6(v169);
end;
return v2;