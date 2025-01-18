local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Components.ViewTypeSelector);
local l_Grid_0 = require(l_Parent_0.Enums.ViewType).Grid;
return {
    controls = {
        isDisabled = false
    }, 
    stories = {
        {
            name = "Default", 
            story = function(v5) --[[ Line: 18 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), l_Grid_0 (copy), v3 (copy)
                local v6, v7 = v2.useState(l_Grid_0);
                local v8, v9 = v2.useState(100);
                local l_isDisabled_0 = v5.controls.isDisabled;
                return v2.createElement(v3, {
                    Disabled = l_isDisabled_0, 
                    GridSize = v8, 
                    OnGridSizeChanged = v9, 
                    OnViewTypeSelected = v7, 
                    ViewType = v6
                });
            end
        }
    }
};