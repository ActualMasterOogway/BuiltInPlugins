local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
local v3 = {
    rememberedFields = {}, 
    addField = function() --[[ Line: 37 ]] --[[ Name: addField ]]

    end, 
    removeField = function() --[[ Line: 38 ]] --[[ Name: removeField ]]

    end, 
    getSearchHistory = function() --[[ Line: 40 ]] --[[ Name: getSearchHistory ]]
        return {};
    end, 
    saveSearchHistory = function() --[[ Line: 43 ]] --[[ Name: saveSearchHistory ]]

    end, 
    getSelectOnInsertionAsync = function() --[[ Line: 45 ]] --[[ Name: getSelectOnInsertionAsync ]]
        return false;
    end, 
    setSelectOnInsertion = function() --[[ Line: 48 ]] --[[ Name: setSelectOnInsertion ]]

    end, 
    getIncrementNamesAsync = function() --[[ Line: 50 ]] --[[ Name: getIncrementNamesAsync ]]
        return false;
    end, 
    setIncrementNames = function() --[[ Line: 53 ]] --[[ Name: setIncrementNames ]]

    end, 
    getExpandHierarchy = function() --[[ Line: 55 ]] --[[ Name: getExpandHierarchy ]]
        return false;
    end, 
    setExpandHierarchy = function() --[[ Line: 58 ]] --[[ Name: setExpandHierarchy ]]

    end, 
    getShowSelectionHierarchyHighlights = function() --[[ Line: 60 ]] --[[ Name: getShowSelectionHierarchyHighlights ]]
        return false;
    end, 
    setShowSelectionHierarchyHighlights = function() --[[ Line: 63 ]] --[[ Name: setShowSelectionHierarchyHighlights ]]

    end
};
local v4 = v1.createContext(v3);
return {
    Context = v4, 
    Provider = function(v5) --[[ Line: 68 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v4 (copy)
        local v6 = {
            rememberedFields = v5.rememberedFields, 
            addField = v5.addField, 
            removeField = v5.removeField, 
            getSearchHistory = v5.getSearchHistory, 
            saveSearchHistory = v5.saveSearchHistory, 
            getSelectOnInsertionAsync = v5.getSelectOnInsertionAsync, 
            setSelectOnInsertion = v5.setSelectOnInsertion, 
            getIncrementNamesAsync = v5.getIncrementNamesAsync, 
            setIncrementNames = v5.setIncrementNames, 
            getExpandHierarchy = v5.getExpandHierarchy, 
            setExpandHierarchy = v5.setExpandHierarchy, 
            getShowSelectionHierarchyHighlights = v5.getShowSelectionHierarchyHighlights, 
            setShowSelectionHierarchyHighlights = v5.setShowSelectionHierarchyHighlights
        };
        return l_createElement_0(v4.Provider, {
            value = v6
        }, v5.children);
    end
};