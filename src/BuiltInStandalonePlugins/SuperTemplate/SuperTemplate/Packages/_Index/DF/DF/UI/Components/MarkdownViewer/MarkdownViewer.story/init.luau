local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.UI.Components.MarkdownViewer);
createMarkdownViewer = function(v3) --[[ Line: 5 ]] --[[ Name: createMarkdownViewer ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2, {
        Markdown = v3
    });
end;
richTextStory = function() --[[ Line: 9 ]] --[[ Name: richTextStory ]]
    return createMarkdownViewer("Normal\n*Bold*\n_Italic_\n~Strike~\n`Monospace`\n");
end;
headingsStory = function() --[[ Line: 19 ]] --[[ Name: headingsStory ]]
    return createMarkdownViewer("# Heading 1\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in quam sodales, iaculis ligula ac, scelerisque leo. Duis facilisis blandit justo, at venenatis purus viverra ut. \n\nSpecial heading\n===============\nText + ruler = heading 1\n\n## Heading 2\nSuspendisse consectetur, dui lacinia posuere pharetra, tellus ante varius erat, et consequat nisl tortor in augue. \n\n### Heading 3\nSed bibendum velit a scelerisque mattis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer sapien mi, lobortis et augue non, congue efficitur neque.\n\n#### Heading 4\nNam ullamcorper velit at sodales malesuada. Morbi gravida arcu a quam euismod venenatis.\n\n##### Heading 5\nPhasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque. \n");
end;
paragraphsStory = function() --[[ Line: 42 ]] --[[ Name: paragraphsStory ]]
    return createMarkdownViewer("This is a short paragraph.\n\nThis is a paragraph with a [link](http://example.com). Or even with [two](http://two-link.example) links. We also can add a [very long link with a verbose description](http://very-long-link.example) to see how it's dislayed.\n\nThis is a resonably long paragraph: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec massa sit amet nisl pretium ultrices vel nec ante. Nam tempor felis vitae egestas bibendum. Maecenas id nisl mauris. Morbi euismod elementum consectetur. Suspendisse feugiat vel nunc cursus condimentum. Vivamus vitae elit sed velit placerat placerat.\n\nParagraph with\na line break is still a valid paragraph.\n");
end;
codeStory = function() --[[ Line: 55 ]] --[[ Name: codeStory ]]
    return createMarkdownViewer("Lua code block:\n\n```lua\n-- factorial function\nfunction fact(n)\n  if n == 0 then\n    return 1\n  else\n    return n * fact(n-1)\n  end\nend\n\nprint(\"enter a number:\")\na = io.read(\"*number\")\nprint(fact(a))\n```\n\nNon-lua code block:\n\n```ruby\nclass Integer\n  def fact\n    (1..self).reduce(:*) || 1\n  end\nend\n```\n");
end;
listStory = function() --[[ Line: 86 ]] --[[ Name: listStory ]]
    return createMarkdownViewer("- List item 1\n- List item 2 to show inline formatting: *Bold*, _Italic_, ~Strike~ and `Monospace` text.\n  - List subitem 2.1\n- List item 3\n  - List subitem 3.1\n  - List subitem 3.2 with a [link](http://example.com)\n    - List subsubitem 3.2.1\n    - List subsubitem 3.2.2\n      - Very deep list subsubsubitem 3.2.2.1\n        * Very-very deep list subsubsubitem 3.2.2.1.1 with a different marker\n        * 3.2.2.1.2 with a different marker\n    - List subsubitem 3.2.3\n    - Very long list subsubitem 3.2.4 - Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque. \n    - List subitem 3.2.5\n  - List subitem 3.3\n- List item 4\n  - List subitem 4.1\n- Very long list item 5 - Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque.\n");
end;
customizationStory = function() --[[ Line: 109 ]] --[[ Name: customizationStory ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {
        BackgroundColor3 = Color3.fromRGB(34, 87, 122), 
        BackgroundTransparency = 0
    };
    return v1.createElement(v2, {
        Markdown = "You can customize or position the MarkdownViewer's container by passing a `WrapperProps` prop. For example, this story uses the following properties:\n```lua\n{\n\tBackgroundColor3 = Color3.fromRGB(34, 87, 122),\n\tBackgroundTransparency = 0\n}\n```\nYou can pass any properties that Frame supports.\n", 
        WrapperProps = v4
    });
end;
return {
    stories = {
        RichText = richTextStory(), 
        Headings = headingsStory(), 
        Paragraphs = paragraphsStory(), 
        Code = codeStory(), 
        List = listStory(), 
        Customization = customizationStory()
    }
};