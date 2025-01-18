local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.IconButton);
local v3 = require(l_Parent_0.UI.Components.MultiImagePickerWrapper.RejectedThumbnailDialog);
local v4 = require(script.Parent.style);
local v5 = v1.Component:extend("RejectedThumbnailDialogStory");
v5.render = function(v6) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return v1.createFragment({
        Button = v1.createElement(v2, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Text = "Open RejectedThumbnailDialog", 
            OnClick = function() --[[ Line: 17 ]] --[[ Name: OnClick ]]
                -- upvalues: v6 (copy)
                v6:setState({
                    dialogOpen = true
                });
            end
        }), 
        Dialog = v6.state.dialogOpen and v1.createElement(v3, {
            Theme = v4, 
            OnClose = function() --[[ Line: 26 ]] --[[ Name: OnClose ]]
                -- upvalues: v6 (copy)
                v6:setState({
                    dialogOpen = false
                });
            end, 
            Files = {
                "doge.png", 
                "cat.gif"
            }
        })
    });
end;
return v5;