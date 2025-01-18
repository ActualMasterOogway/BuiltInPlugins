local _ = require(script.Parent.Types);
local l_insert_0 = table.insert;
local v2 = require(script.Parent.Constants);
local l_CONTAINERS_0 = v2.CONTAINERS;
local l_INLINE_TEXT_0 = v2.INLINE_TEXT;
local l_PLAIN_TEXT_0 = v2.PLAIN_TEXT;
local l_STYLED_TEXT_0 = v2.STYLED_TEXT;
local v7 = {};
v7.postProcessTree = function(v8) --[[ Line: 16 ]] --[[ Name: postProcessTree ]]
    -- upvalues: l_INLINE_TEXT_0 (copy), l_CONTAINERS_0 (copy), v7 (copy), l_insert_0 (copy), l_PLAIN_TEXT_0 (copy)
    local v9 = {};
    local v10 = 1;
    local l_children_0 = v8.children;
    while v10 <= #l_children_0 do
        local v12 = l_children_0[v10];
        if l_INLINE_TEXT_0[v12.name] and l_CONTAINERS_0[v8.name] then
            local v13, v14 = v7.buildParagraph(l_children_0, v10);
            assert(v13 > 0, "Did not find an inline node when expected");
            if #v14.children > 0 then
                l_insert_0(v9, v14);
            end;
            v10 = v10 + v13;
        elseif l_PLAIN_TEXT_0[v12.name] then
            local v15, v16 = v7.mergeTextNodes(l_children_0, v10);
            assert(v15 > 0, "Did not find a text node when expected");
            if v16.text and #v16.text > 0 then
                l_insert_0(v9, v16);
            end;
            v10 = v10 + v15;
        elseif v12.name == "LIST_ITEM" then
            local v17, v18 = v7.buildList(l_children_0, v10);
            l_insert_0(v9, v18);
            assert(v17 > 0, "Did not find a list node when expected");
            v10 = v10 + v17;
        elseif v12.name == "TABLE_ROW" then
            local v19, v20 = v7.buildTable(l_children_0, v10);
            l_insert_0(v9, v20);
            assert(v19 > 0, "Did not find a table row node when expected");
            v10 = v10 + v19;
        elseif v12.name == "LINE_BREAK" then
            v10 = v10 + 1;
        else
            v12.children = v7.postProcessTree(v12);
            l_insert_0(v9, v12);
            v10 = v10 + 1;
        end;
    end;
    if v8.isBlock then
        local v21 = v9[1];
        if v21 and v21.text then
            v21.text = v21.text:gsub("^%s+", "");
        end;
        local v22 = v9[#v9];
        if v22 and v22.text then
            v22.text = v22.text:gsub("%s+$", "");
        end;
    end;
    return v9;
end;
v7.buildParagraph = function(v23, v24) --[[ Line: 76 ]] --[[ Name: buildParagraph ]]
    -- upvalues: l_PLAIN_TEXT_0 (copy), v7 (copy), l_insert_0 (copy), l_INLINE_TEXT_0 (copy)
    local v25 = {};
    local v26 = 0;
    local l_v24_0 = v24;
    while l_v24_0 <= #v23 do
        local v28 = v23[l_v24_0];
        if l_PLAIN_TEXT_0[v28.name] then
            local v29, v30 = v7.mergeTextNodes(v23, l_v24_0);
            if v30.text and #v30.text > 0 then
                l_insert_0(v25, v30);
            end;
            assert(v29 > 0, "Did not find a rich text node when expected");
            v26 = v26 + v29;
            l_v24_0 = l_v24_0 + v29;
        elseif l_INLINE_TEXT_0[v28.name] then
            l_insert_0(v25, v28);
            v26 = v26 + 1;
            l_v24_0 = l_v24_0 + 1;
        else
            break;
        end;
    end;
    return v26, {
        name = "PARAGRAPH", 
        children = v25, 
        offset = v23[v24].offset
    };
end;
v7.outputRichText = function(v31) --[[ Line: 108 ]] --[[ Name: outputRichText ]]
    -- upvalues: l_STYLED_TEXT_0 (copy), v7 (copy)
    local v32 = if v31.attributes then l_STYLED_TEXT_0[v31.attributes.style] else nil;
    if v32 then
        local v33, v34 = v7.mergeTextNodes(v31.children, 1);
        assert(v33 == #v31.children, (("Found non-inline content inside inline element at %*"):format(v31.offset)));
        return (("<%*>%*</%*>"):format(v32, v34.text, v32));
    elseif v31.text then
        return v31.text;
    else
        assert(false, (("No text for node at %*"):format(v31.offset)));
        return;
    end;
end;
v7.buildList = function(v35, v36) --[[ Line: 122 ]] --[[ Name: buildList ]]
    -- upvalues: v7 (copy), l_insert_0 (copy)
    local v37 = 0;
    local l_depth_0 = v35[v36].attributes.depth;
    local v39 = {};
    local l_v36_0 = v36;
    while l_v36_0 <= #v35 do
        local v41 = v35[l_v36_0];
        if v41.name == "LIST_ITEM" then
            if v41.attributes.depth == l_depth_0 then
                v41.children = v7.postProcessTree(v41);
                l_insert_0(v39, v41);
                v37 = v37 + 1;
                l_v36_0 = l_v36_0 + 1;
            elseif l_depth_0 < v41.attributes.depth then
                local v42, v43 = v7.buildList(v35, l_v36_0);
                l_insert_0(v39, v43);
                assert(v42 > 0, "Did not find a list node when expected");
                l_v36_0 = l_v36_0 + v42;
                v37 = v37 + v42;
            else
                break;
            end;
        else
            break;
        end;
    end;
    return v37, {
        name = "LIST", 
        attributes = {
            depth = l_depth_0
        }, 
        children = v39, 
        offset = v35[v36].offset
    };
end;
v7.buildTable = function(v44, v45) --[[ Line: 161 ]] --[[ Name: buildTable ]]
    -- upvalues: v7 (copy), l_insert_0 (copy)
    local v46 = 0;
    local v47 = {};
    for v48 = v45, #v44 do
        local v49 = v44[v48];
        if v49.name == "TABLE_ROW" then
            local v50 = v7.buildTableCells(v49);
            if v50 then
                v49.children = v50;
                l_insert_0(v47, v49);
            elseif #v47 > 0 then
                v47[#v47].name = "TABLE_HEADER";
            end;
            v46 = v46 + 1;
        else
            break;
        end;
    end;
    return v46, {
        name = "TABLE", 
        children = v47, 
        offset = v44[v45].offset
    };
end;
v7.buildTableCells = function(v51) --[[ Line: 189 ]] --[[ Name: buildTableCells ]]
    -- upvalues: v7 (copy), l_insert_0 (copy)
    local v52 = {};
    local v53 = {};
    local v54 = true;
    local v55 = v51.children[1];
    for v56 = 1, #v51.children do
        local v57 = v51.children[v56];
        if v57.name == "TABLE_DIVIDER" then
            local v58 = {
                name = "TABLE_CELL", 
                isBlock = true, 
                children = v53, 
                offset = if v53[1] then v53[1].offset else v51.offset
            };
            v58.children = v7.postProcessTree(v58);
            l_insert_0(v52, v58);
            local v59 = v55.text and v55.text:match("^[ \t-=]+$") ~= nil;
            v54 = v54 and v59 or false;
            v53 = {};
        else
            l_insert_0(v53, v57);
        end;
    end;
    if v54 then
        return nil;
    else
        return v52;
    end;
end;
v7.mergeTextNodes = function(v60, v61) --[[ Line: 222 ]] --[[ Name: mergeTextNodes ]]
    -- upvalues: l_PLAIN_TEXT_0 (copy)
    local v62 = "";
    local v63 = 0;
    for v64 = v61, #v60 do
        local v65 = v60[v64];
        if l_PLAIN_TEXT_0[v65.name] then
            v62 = v62 .. v65.text;
            v63 = v63 + 1;
        else
            break;
        end;
    end;
    v62 = v62:gsub("^\n*(.-)\n*$", "%1");
    return v63, {
        name = "TEXT", 
        text = v62, 
        children = {}, 
        offset = v60[v61].offset
    };
end;
return v7.postProcessTree;