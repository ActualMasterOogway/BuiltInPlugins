local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local l_Components_0 = l_Parent_0.UI.Components;
local v3 = require(l_Components_0.IconButton);
local v4 = require(l_Parent_0.UI.Hooks.useDialogDetailsAction);
local v5 = require(l_Parent_0.Util.DialogAction);
local v6 = require(script.Parent);
local v7 = {
    "Confirmation", 
    "Destructive", 
    "Error", 
    "Information", 
    "Question", 
    "Warning"
};
local function v12(v8) --[[ Line: 24 ]] --[[ Name: IntentStory ]]
    -- upvalues: v4 (copy), v6 (copy), v5 (copy), v1 (copy), v3 (copy)
    local v9, v10 = v4("Here are the details:\n- This is a detail\n- You rock!\n- Have a nice day!");
    local v11 = v6({
        Intent = v8.Intent, 
        Heading = "Are you sure you want to quit Roblox Studio?", 
        Body = "The details will be shown here. The details will be shown here.", 
        Contents = v10(), 
        ActionPrimary = v5.OK, 
        ActionSecondary = v5.CANCEL, 
        ActionTertiary = v9, 
        Title = v8.Intent
    });
    return v1.createElement(v3, {
        OnClick = v11, 
        Text = "Show Dialog"
    });
end;
local v13 = {};
for _, v15 in v7 do
    table.insert(v13, {
        name = v15, 
        story = v1.createElement(v12, {
            Intent = v15
        })
    });
end;
return {
    stories = v13
};