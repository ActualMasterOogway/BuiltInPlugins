local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
local MarkdownViewer = require(Framework.UI.Components.MarkdownViewer)
local useStudioThemeColors = require(Framework.Util.Highlighter.useStudioThemeColors)
local HighlighterTypes = require(Framework.Util.Highlighter.Types)

local function createMarkdownViewer(text: string): React.ReactElement
	return React.createElement(MarkdownViewer, { Markdown = text })
end

local function richTextStory()
	return createMarkdownViewer([[
Normal
*Bold*
_Italic_
~Strike~
`Monospace`
]])
end

local function headingsStory()
	return createMarkdownViewer([[
# Heading 1
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in quam sodales, iaculis ligula ac, scelerisque leo. Duis facilisis blandit justo, at venenatis purus viverra ut. 

Special heading
===============
Text + ruler = heading 1

## Heading 2
Suspendisse consectetur, dui lacinia posuere pharetra, tellus ante varius erat, et consequat nisl tortor in augue. 

### Heading 3
Sed bibendum velit a scelerisque mattis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer sapien mi, lobortis et augue non, congue efficitur neque.

#### Heading 4
Nam ullamcorper velit at sodales malesuada. Morbi gravida arcu a quam euismod venenatis.

##### Heading 5
Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque. 
]])
end

local function paragraphsStory()
	return createMarkdownViewer([[
This is a short paragraph.

This is a paragraph with a [link](http://example.com). Or even with [two](http://two-link.example) links. We also can add a [very long link with a verbose description](http://very-long-link.example) to see how it's dislayed.

This is a resonably long paragraph: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec massa sit amet nisl pretium ultrices vel nec ante. Nam tempor felis vitae egestas bibendum. Maecenas id nisl mauris. Morbi euismod elementum consectetur. Suspendisse feugiat vel nunc cursus condimentum. Vivamus vitae elit sed velit placerat placerat.

Paragraph with
a line break is still a valid paragraph.
]])
end

local function codeStory()
	local colors = useStudioThemeColors()
	local md = [[
Lua code block:

```lua
-- factorial function
function fact(n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end

print("enter a number:")
a = io.read("*number")
print(fact(a))
```

Non-lua code block:

```ruby
class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end
```
]]

	return React.createElement(MarkdownViewer, { Markdown = md, CodeColorScheme = colors })
end

local function listStory()
	return createMarkdownViewer([[
- List item 1
- List item 2 to show inline formatting: *Bold*, _Italic_, ~Strike~ and `Monospace` text.
  - List subitem 2.1
- List item 3
  - List subitem 3.1
  - List subitem 3.2 with a [link](http://example.com)
    - List subsubitem 3.2.1
    - List subsubitem 3.2.2
      - Very deep list subsubsubitem 3.2.2.1
        * Very-very deep list subsubsubitem 3.2.2.1.1 with a different marker
        * 3.2.2.1.2 with a different marker
    - List subsubitem 3.2.3
    - Very long list subsubitem 3.2.4 - Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque. 
    - List subitem 3.2.5
  - List subitem 3.3
- List item 4
  - List subitem 4.1
- Very long list item 5 - Phasellus at risus id lectus faucibus accumsan. Donec a feugiat purus. Sed luctus elit ac tellus sodales pellentesque.
]])
end

local function customizationStory()
	local md = [[
You can customize or position the MarkdownViewer's container by passing a `WrapperProps` prop. For example, this story uses the following properties:
```lua
{
	BackgroundColor3 = Color3.fromRGB(34, 87, 122),
	BackgroundTransparency = 0
}
```
You can pass any properties that Frame supports.
]]

	local wrapperProps = {
		BackgroundColor3 = Color3.fromRGB(34, 87, 122),
		BackgroundTransparency = 0,
	}
	return React.createElement(MarkdownViewer, { Markdown = md, WrapperProps = wrapperProps })
end

function rulerStory()
	return createMarkdownViewer([[
A ruler below is created with the === syntax.

===

A ruler below is created with a --- syntax.

---

]])
end

function withTextPropsStory()
	local md = [[
You can customize the text style by passing a `TextProps` prop. For example, this story uses the following properties:

```lua
{
	TextSize = 14,
	Font = Enum.Font.Garamond,
}
```
]]

	local textProps = {
		TextSize = 14,
		Font = Enum.Font.Garamond,
	}
	return React.createElement(MarkdownViewer, { Markdown = md, TextProps = textProps })
end

function customCodeColorsStory()
	local md = [[
Lua code block with custom colors (black background, green keywords, orange strings and numbers, gray comments, everything else is white)

```lua
-- factorial function
function fact(n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end
print("enter a number:")
a = io.read("*number")
print(fact(a))
```
]]

	local colorScheme: HighlighterTypes.TokenColors = {
		background = Color3.fromRGB(0, 0, 0), -- black
		iden = Color3.fromRGB(255, 255, 255), -- white
		keyword = Color3.fromRGB(0, 255, 0), -- green
		builtin = Color3.fromRGB(255, 255, 255), -- white
		string = Color3.fromRGB(255, 140, 0), -- orange
		number = Color3.fromRGB(255, 140, 0), -- orange
		comment = Color3.fromRGB(100, 100, 100), -- grey
		operator = Color3.fromRGB(255, 255, 255), -- white
		custom = Color3.fromRGB(255, 255, 255), -- white
	}

	return React.createElement(MarkdownViewer, { Markdown = md, CodeColorScheme = colorScheme })
end

return {
	stories = {
		{
			name = "Rich text",
			story = richTextStory,
		},
		{
			name = "Headings",
			story = headingsStory,
		},
		{
			name = "Paragraphs",
			story = paragraphsStory,
		},
		{
			name = "Code",
			story = codeStory,
		},
		{
			name = "List",
			story = listStory,
		},
		{
			name = "Customization",
			story = customizationStory,
		},
		{
			name = "Ruler",
			story = rulerStory,
		},
		{
			name = "With TextProps",
			story = withTextPropsStory,
		},
		{
			name = "With a custom codeblock color scheme",
			story = customCodeColorsStory,
		},
	},
}
