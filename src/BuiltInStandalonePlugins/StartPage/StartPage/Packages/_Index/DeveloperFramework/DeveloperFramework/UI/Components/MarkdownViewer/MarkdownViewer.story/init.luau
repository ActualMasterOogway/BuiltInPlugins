local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.UI.Components.MarkdownViewer);
local v3 = require(l_Parent_0.Util.Highlighter.useStudioThemeColors);
local _ = require(l_Parent_0.Util.Highlighter.Types);
local function v6(v5) --[[ Line: 7 ]] --[[ Name: createMarkdownViewer ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2, {
        Markdown = v5
    });
end;
local function v7() --[[ Line: 11 ]] --[[ Name: richTextStory ]]
    -- upvalues: v6 (copy)
    return v6("Normal\n*Bold*\n_Italic_\n~Strike~\n`Monospace`\n");
end;
local function v8() --[[ Line: 21 ]] --[[ Name: headingsStory ]]
    -- upvalues: v6 (copy)
    return v6("# Heading 1\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in quam sodales, iaculis ligula ac, scelerisque leo. Duis facilisis blandit justo, at venenatis purus viverra ut. \n\nSpecial heading\n===============\nText + ruler = heading 1\n\n## Heading 2\nSuspendisse consectetur, dui lacinia posuere pharetra, tellus ante varius erat, et consequat nisl tortor in augue. \n\n### Heading 3\nSed bibendum velit a scelerisque mattis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer sapien mi, lobortis et augue non, congue efficitur neque.\n\n#### Heading 4\nNam ullamcorper velit at sodales malesuada. Morbi gravida arcu a quam euismod venenatis.\n\n##### Heading 5\nPhasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque. \n");
end;
local function v9() --[[ Line: 44 ]] --[[ Name: paragraphsStory ]]
    -- upvalues: v6 (copy)
    return v6("This is a short paragraph.\n\nThis is a paragraph with a [link](http://example.com). Or even with [two](http://two-link.example) links. We also can add a [very long link with a verbose description](http://very-long-link.example) to see how it's dislayed.\n\nThis is a resonably long paragraph: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec massa sit amet nisl pretium ultrices vel nec ante. Nam tempor felis vitae egestas bibendum. Maecenas id nisl mauris. Morbi euismod elementum consectetur. Suspendisse feugiat vel nunc cursus condimentum. Vivamus vitae elit sed velit placerat placerat.\n\nParagraph with\na line break is still a valid paragraph.\n");
end;
local function v11() --[[ Line: 57 ]] --[[ Name: codeStory ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v10 = v3();
    return v1.createElement(v2, {
        Markdown = "Lua code block:\n\n```lua\n-- factorial function\nfunction fact(n)\n  if n == 0 then\n    return 1\n  else\n    return n * fact(n-1)\n  end\nend\n\nprint(\"enter a number:\")\na = io.read(\"*number\")\nprint(fact(a))\n```\n\nNon-lua code block:\n\n```ruby\nclass Integer\n  def fact\n    (1..self).reduce(:*) || 1\n  end\nend\n```\n", 
        CodeColorScheme = v10
    });
end;
local function v12() --[[ Line: 91 ]] --[[ Name: listStory ]]
    -- upvalues: v6 (copy)
    return v6("- List item 1\n- List item 2 to show inline formatting: *Bold*, _Italic_, ~Strike~ and `Monospace` text.\n  - List subitem 2.1\n- List item 3\n  - List subitem 3.1\n  - List subitem 3.2 with a [link](http://example.com)\n    - List subsubitem 3.2.1\n    - List subsubitem 3.2.2\n      - Very deep list subsubsubitem 3.2.2.1\n        * Very-very deep list subsubsubitem 3.2.2.1.1 with a different marker\n        * 3.2.2.1.2 with a different marker\n    - List subsubitem 3.2.3\n    - Very long list subsubitem 3.2.4 - Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque. \n    - List subitem 3.2.5\n  - List subitem 3.3\n- List item 4\n  - List subitem 4.1\n- Very long list item 5 - Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque.\n");
end;
local function v14() --[[ Line: 114 ]] --[[ Name: customizationStory ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v13 = {
        BackgroundColor3 = Color3.fromRGB(34, 87, 122), 
        BackgroundTransparency = 0
    };
    return v1.createElement(v2, {
        Markdown = "You can customize or position the MarkdownViewer's container by passing a `WrapperProps` prop. For example, this story uses the following properties:\n```lua\n{\n\tBackgroundColor3 = Color3.fromRGB(34, 87, 122),\n\tBackgroundTransparency = 0\n}\n```\nYou can pass any properties that Frame supports.\n", 
        WrapperProps = v13
    });
end;
rulerStory = function() --[[ Line: 133 ]] --[[ Name: rulerStory ]]
    -- upvalues: v6 (copy)
    return v6("A ruler below is created with the === syntax.\n\n===\n\nA ruler below is created with a --- syntax.\n\n---\n\n");
end;
withTextPropsStory = function() --[[ Line: 146 ]] --[[ Name: withTextPropsStory ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v15 = {
        TextSize = 14, 
        Font = Enum.Font.Garamond
    };
    return v1.createElement(v2, {
        Markdown = "You can customize the text style by passing a `TextProps` prop. For example, this story uses the following properties:\n\n```lua\n{\n\tTextSize = 14,\n\tFont = Enum.Font.Garamond,\n}\n```\n", 
        TextProps = v15
    });
end;
customCodeColorsStory = function() --[[ Line: 165 ]] --[[ Name: customCodeColorsStory ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v16 = {
        background = Color3.fromRGB(0, 0, 0), 
        iden = Color3.fromRGB(255, 255, 255), 
        keyword = Color3.fromRGB(0, 255, 0), 
        builtin = Color3.fromRGB(255, 255, 255), 
        string = Color3.fromRGB(255, 140, 0), 
        number = Color3.fromRGB(255, 140, 0), 
        comment = Color3.fromRGB(100, 100, 100), 
        operator = Color3.fromRGB(255, 255, 255), 
        custom = Color3.fromRGB(255, 255, 255)
    };
    return v1.createElement(v2, {
        Markdown = "Lua code block with custom colors (black background, green keywords, orange strings and numbers, gray comments, everything else is white)\n\n```lua\n-- factorial function\nfunction fact(n)\n  if n == 0 then\n    return 1\n  else\n    return n * fact(n-1)\n  end\nend\nprint(\"enter a number:\")\na = io.read(\"*number\")\nprint(fact(a))\n```\n", 
        CodeColorScheme = v16
    });
end;
return {
    stories = {
        {
            name = "Rich text", 
            story = v7
        }, 
        {
            name = "Headings", 
            story = v8
        }, 
        {
            name = "Paragraphs", 
            story = v9
        }, 
        {
            name = "Code", 
            story = v11
        }, 
        {
            name = "List", 
            story = v12
        }, 
        {
            name = "Customization", 
            story = v14
        }, 
        {
            name = "Ruler", 
            story = rulerStory
        }, 
        {
            name = "With TextProps", 
            story = withTextPropsStory
        }, 
        {
            name = "With a custom codeblock color scheme", 
            story = customCodeColorsStory
        }
    }
};