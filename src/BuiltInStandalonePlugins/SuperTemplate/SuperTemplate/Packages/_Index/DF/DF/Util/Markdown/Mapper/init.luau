local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.Markdown.Parser);
return {
    map = function(v3, v4, v5) --[[ Line: 23 ]] --[[ Name: map ]]
        -- upvalues: v2 (copy)
        local v6 = {};
        for v7, v8 in v4 do
            if v7 == v2.BlockType.Heading then
                table.insert(v6, v3.heading(v8.Text, v8.Level));
            elseif v7 == v2.BlockType.Paragraph then
                table.insert(v6, v3.paragraph(v8.Text, v8.Links, v5));
            elseif v7 == v2.BlockType.Code then
                table.insert(v6, v3.code(v8.Code, v8.Syntax));
            elseif v7 == v2.BlockType.List then
                table.insert(v6, v3.list(v8.Lines, v5));
            end;
        end;
        return v6;
    end
};