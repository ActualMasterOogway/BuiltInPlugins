local _ = require(script.Parent.Types);
local v1 = require(script.Parent.Constants);
local l_LISTS_0 = v1.LISTS;
local l_STYLED_TEXT_0 = v1.STYLED_TEXT;
local l_DIVIDERS_0 = v1.DIVIDERS;
local l_insert_0 = table.insert;
local v6 = {};
v6.buildTree = function(v7) --[[ Line: 16 ]] --[[ Name: buildTree ]]
    -- upvalues: l_insert_0 (copy), l_STYLED_TEXT_0 (copy), v6 (copy), l_LISTS_0 (copy), l_DIVIDERS_0 (copy)
    local v8 = {
        name = "ROOT", 
        children = {}, 
        offset = 1
    };
    local v9 = {
        v8
    };
    local v10 = 1;
    while v10 <= #v7 do
        local v11 = v7[v10];
        local v12 = v9[#v9];
        local v13 = true;
        if v12.name ~= "CODE_BLOCK" then
            v13 = v12.name == "INLINE_CODE";
        end;
        if v13 then
            if v11.name == v12.name then
                table.remove(v9);
                v12.text = v12.text:gsub("^%s*(.-)%s*$", "%1");
                local v14 = v9[#v9];
                if v14 and v14.children then
                    l_insert_0(v14.children, v12);
                end;
            else
                v12.text = (v12.text or "") .. v11.text;
            end;
        elseif v11.name == "CODE_BLOCK" or v11.name == "INLINE_CODE" then
            l_insert_0(v9, {
                name = v11.name, 
                text = "", 
                children = {}, 
                attributes = {
                    language = if v11.capture then v11.capture[1] else nil
                }, 
                offset = v11.offset
            });
        elseif l_STYLED_TEXT_0[v11.name] then
            if not v6.closeNode(v9, function(v15) --[[ Line: 59 ]]
                -- upvalues: v11 (copy)
                if v15.name == "STYLED_TEXT" and v15.attributes and v15.attributes.style then
                    assert(v15.attributes.style == v11.name, (("Can't put %* at %* inside %* at %*"):format(v11.name, v11.offset, v15.attributes.style, v15.offset)));
                    return true;
                else
                    return false;
                end;
            end) then
                l_insert_0(v9, {
                    name = "STYLED_TEXT", 
                    attributes = {
                        style = v11.name
                    }, 
                    children = {}, 
                    offset = v11.offset
                });
            end;
        elseif l_LISTS_0[v11.name] and v11.capture then
            v6.closeNode(v9, function(v16) --[[ Line: 82 ]]
                return v16.isBlock == true;
            end);
            l_insert_0(v9, {
                name = "LIST_ITEM", 
                isBlock = true, 
                children = {}, 
                attributes = {
                    depth = #v11.capture[1], 
                    prefix = v11.capture[2]
                }, 
                offset = v11.offset
            });
        elseif v11.isBlock then
            v6.closeNode(v9, function(v17) --[[ Line: 97 ]]
                return v17.isBlock == true;
            end);
            local v18 = {};
            if v11.name == "HEADING" and v11.capture then
                v18.depth = #v11.capture[1];
            end;
            l_insert_0(if l_DIVIDERS_0[v11.name] then v9[#v9].children else v9, {
                name = v11.name, 
                children = {}, 
                isBlock = true, 
                attributes = v18, 
                offset = v11.offset
            });
        elseif v11.name == "ESCAPE" and v11.capture then
            l_insert_0(v12.children, {
                name = "TEXT", 
                text = v11.capture[1], 
                offset = v11.offset, 
                children = {}
            });
        elseif (v11.name == "LINK" or v11.name == "IMAGE") and v11.capture then
            l_insert_0(v12.children, {
                name = v11.name, 
                text = v11.capture[1], 
                url = v11.capture[2], 
                offset = v11.offset, 
                children = {}
            });
        elseif v11.name == "OPEN_CLOSE" and v11.capture then
            local v19 = v11.capture[1];
            local v20 = v11.capture[2];
            l_insert_0(v12.children, {
                name = "TAG", 
                text = v19, 
                attributes = if v20 then v6.parseXmlAttributes(v20) else {}, 
                children = {}, 
                offset = v11.offset
            });
        elseif v11.name == "OPEN" and v11.capture then
            local v21 = v11.capture[1];
            local v22 = v11.capture[2];
            if v11.capture and v21 == "br" then
                l_insert_0(v12.children, {
                    name = "TEXT", 
                    text = "\n", 
                    children = {}, 
                    offset = v11.offset
                });
            else
                l_insert_0(v9, {
                    name = "TAG", 
                    text = v21, 
                    attributes = if v22 then v6.parseXmlAttributes(v22) else {}, 
                    children = {}, 
                    offset = v11.offset
                });
            end;
        elseif v11.name == "CLOSE" and v11.capture then
            local v23 = v11.capture[1];
            assert(v6.closeNode(v9, function(v24) --[[ Line: 163 ]]
                -- upvalues: v23 (copy), v11 (copy)
                if v24.name == "TAG" then
                    assert(v24.text == v23, (("Found <%*> at %* when trying to close </%*> at %*"):format(v24.text, v24.offset, v23, v11.offset)));
                    return true;
                else
                    return false;
                end;
            end), (("No open tag exists trying to close </%*> at %*"):format(v23, v11.offset)));
        else
            l_insert_0(v12.children, {
                name = v11.name, 
                text = v11.text, 
                children = {}, 
                offset = v11.offset
            });
        end;
        v10 = v10 + 1;
    end;
    v6.closeNode(v9, function(v25) --[[ Line: 187 ]]
        return v25.isBlock == true;
    end);
    v6.closeNode(v9, function(v26) --[[ Line: 191 ]]
        return v26.name == "ROOT";
    end);
    return v8;
end;
v6.closeNode = function(v27, v28) --[[ Line: 198 ]] --[[ Name: closeNode ]]
    -- upvalues: v6 (copy), l_insert_0 (copy)
    local v29 = v6.findLastNodeIndex(v27, v28);
    if v29 then
        local v30 = v27[v29];
        for v31 = v29 + 1, #v27 do
            l_insert_0(v30.children, v27[v31]);
        end;
        for _ = v29 + 1, #v27 do
            table.remove(v27);
        end;
        local v33 = v27[v29 - 1];
        if v33 then
            table.remove(v27);
            l_insert_0(v33.children, v30);
        end;
        return v30;
    else
        return nil;
    end;
end;
v6.findLastNodeIndex = function(v34, v35) --[[ Line: 225 ]] --[[ Name: findLastNodeIndex ]]
    for v36 = #v34, 1, -1 do
        local v37 = v34[v36];
        if if typeof(v35) == "string" then v37.name == v35 else v35(v37) then
            return v36;
        end;
    end;
    return nil;
end;
v6.parseXmlAttributes = function(v38) --[[ Line: 237 ]] --[[ Name: parseXmlAttributes ]]
    local v39 = v38:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*");
    local v40 = {};
    for v41, v42 in v39 do
        v40[v41] = v42;
    end;
    return v40;
end;
return v6.buildTree;