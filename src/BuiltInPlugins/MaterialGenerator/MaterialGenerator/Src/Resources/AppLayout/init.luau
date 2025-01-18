local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local l_EDITOR_WIDTH_0 = v1.EDITOR_WIDTH;
local l_EDITOR_HEIGHT_0 = v1.EDITOR_HEIGHT;
local l_PROMPT_HEIGHT_0 = v1.PROMPT_HEIGHT;
local v5 = if game:DefineFastFlag("MaterialGeneratorFixUILayout", false) then 2 * l_EDITOR_WIDTH_0 + 50 else 576;
return {
    {
        value = {
            name = "Prompt, Browser, Editor (horizontal)", 
            fillDirection = Enum.FillDirection.Horizontal, 
            mainContentSize = UDim2.new(1, -l_EDITOR_WIDTH_0, 1, 0), 
            editorSize = UDim2.new(0, l_EDITOR_WIDTH_0, 1, 0)
        }
    }, 
    {
        maxWidth = v5, 
        value = {
            name = "Prompt, Browser, Editor (vertical)", 
            fillDirection = Enum.FillDirection.Vertical, 
            mainContentSize = UDim2.new(1, 0, 1, -l_EDITOR_HEIGHT_0), 
            editorSize = UDim2.new(1, 0, 0, l_EDITOR_HEIGHT_0)
        }
    }, 
    {
        maxWidth = v5, 
        maxHeight = l_PROMPT_HEIGHT_0 + l_EDITOR_HEIGHT_0 + 50, 
        value = {
            name = "Prompt, Editor (vertical)", 
            fillDirection = Enum.FillDirection.Vertical, 
            mainContentSize = UDim2.new(1, 0, 0, l_PROMPT_HEIGHT_0), 
            editorSize = UDim2.new(1, 0, 1, -l_PROMPT_HEIGHT_0), 
            browserVisible = false
        }
    }, 
    {
        maxWidth = v5, 
        maxHeight = l_EDITOR_HEIGHT_0 + 50, 
        value = {
            name = "Editor only", 
            mainContentVisible = false, 
            editorSize = UDim2.fromScale(1, 1)
        }
    }
};