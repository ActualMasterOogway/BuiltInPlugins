local v0 = {};
local l_StudioService_0 = game:GetService("StudioService");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_showContextMenu_0 = require(l_Parent_0.Packages.Framework).UI.showContextMenu;
v0.showRightClickMenu = function(v5, v6, v7, v8, v9) --[[ Line: 10 ]] --[[ Name: showRightClickMenu ]]
    -- upvalues: l_StudioService_0 (copy), l_Selection_0 (copy), l_showContextMenu_0 (copy)
    local v11 = {
        Copy = {
            Text = v7:getText("ContextMenu", "Copy"), 
            Icon = "rbxasset://textures/TextureViewer/copy.png", 
            OnItemClicked = function() --[[ Line: 15 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v5 (copy), l_StudioService_0 (ref), v8 (copy)
                local v10 = v5:filterRowsBySearchTerm();
                l_StudioService_0:CopyToClipboard(v10[v8].Texture);
            end
        }, 
        Select = {
            Text = v7:getText("ContextMenu", "Select"), 
            Icon = "rbxasset://textures/TextureViewer/select.png", 
            OnItemClicked = function() --[[ Line: 23 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_Selection_0 (ref), v9 (copy)
                l_Selection_0:Set(v9);
            end
        }, 
        Replace = {
            Text = v7:getText("ContextMenu", "Replace"), 
            Icon = "rbxasset://textures/TextureViewer/replace.png", 
            OnItemClicked = function() --[[ Line: 30 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v5 (copy), v8 (copy)
                v5:setState({
                    editingCell = v8
                });
            end
        }
    };
    l_showContextMenu_0(v6, v11, {
        "Copy", 
        "Select", 
        "Replace"
    });
end;
return v0;