local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Parent.Dash);
local v3 = require(l_Parent_0.UI.Components.IconButton);
local v4 = require(l_Parent_0.UI.Hooks.useDialogDetailsAction);
local v5 = require(l_Parent_0.Util.DialogAction);
local v6 = require(script.Parent);
return {
    story = v1.createElement(function() --[[ Line: 22 ]] --[[ Name: SaveSequenceStory ]]
        -- upvalues: v4 (copy), v6 (copy), v5 (copy), v2 (copy), v1 (copy), v3 (copy)
        local v7, v8 = v4("You'll permanently lose:\n- ServerScriptService.ImportantScript\n- ServerScriptService.MoreImportantScript\n- Workspace.EvenMoreImportantModel");
        local v9 = v6({
            Intent = "Destructive", 
            Heading = "Are you sure?", 
            Body = "You cannot undo this action.", 
            Contents = v8(), 
            ActionPrimary = v5.YES, 
            ActionSecondary = v5.NO, 
            ActionTertiary = v7, 
            Modal = true
        });
        local v10 = v6({
            Intent = "Confirmation", 
            Heading = "Success!", 
            Body = "Experience \"Dialog Simulator\" was saved. You may now exit Roblox Studio.", 
            ActionPrimary = v5.OK, 
            ActionSecondary = v5.CANCEL, 
            Modal = true
        });
        local v11 = v6({
            Intent = "Warning", 
            Heading = "You have unsaved changes.", 
            Body = "Would you like to save before exiting Roblox Studio?", 
            ActionPrimary = v2.join(v5.SAVE, {
                OnActivated = v10
            }), 
            ActionSecondary = v2.join(v5.NO, {
                OnActivated = v9
            }), 
            ActionTertiary = v5.CANCEL, 
            Modal = true
        });
        return v1.createElement(v3, {
            OnClick = v11, 
            Text = "QUIT STUDIO WITHOUT SAVING \240\159\152\177"
        });
    end)
};