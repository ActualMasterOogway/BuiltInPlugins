local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Signal);
local l_createElement_0 = v1.createElement;
local v4 = {
    startSelectionDrag = function() --[[ Line: 15 ]] --[[ Name: startSelectionDrag ]]

    end, 
    selectionDragInProgress = false, 
    selectionDragDropped = v2.new()
};
local v5 = v1.createContext(v4);
return {
    Context = v5, 
    Provider = function(v6) --[[ Line: 22 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v5 (copy)
        local v7 = {
            startSelectionDrag = v6.startSelectionDrag, 
            selectionDragInProgress = v6.selectionDragInProgress, 
            selectionDragDropped = v6.selectionDragDropped
        };
        return l_createElement_0(v5.Provider, {
            value = v7
        }, v6.children);
    end
};