local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.Markdown.DEPRECATED_Parser);
local _ = require(l_Parent_0.Util.Highlighter.Types);
return {
    map = function(v4, v5, v6, v7, v8) --[[ Line: 39 ]] --[[ Name: map ]]
        -- upvalues: v2 (copy)
        local v9 = {};
        for v10, v11 in v5 do
            if v10 == v2.BlockType.Heading then
                table.insert(v9, v4.heading(v11.Text, v11.Level, v8));
            elseif v10 == v2.BlockType.Paragraph then
                table.insert(v9, v4.paragraph(v11.Text, v11.Links, v6, v8));
            elseif v10 == v2.BlockType.Code then
                table.insert(v9, v4.code(v11.Code, v11.Syntax, v7, v8));
            elseif v10 == v2.BlockType.List then
                table.insert(v9, v4.list(v11.Lines, v6, v8));
            elseif v10 == v2.BlockType.Ruler then
                table.insert(v9, v4.ruler());
            end;
        end;
        return v9;
    end
};