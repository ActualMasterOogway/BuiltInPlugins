local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v2 = {
    nilId = "<<<NIL>>>", 
    rootId = "<<<ROOT>>>", 
    explorerRowHeight = 20, 
    indentWidth = 12, 
    iconSize = 16, 
    searchBarHeight = 26, 
    searchBarPadding = 5, 
    searchHeaderBottomBorderWidth = 1
};
v2.minSearchHeaderHeight = v2.searchBarHeight + v2.searchBarPadding * 2 + v2.searchHeaderBottomBorderWidth;
v2.sessionViewScrollBarWidth = 8;
v2.emptyDataModelNode = table.freeze({
    datum = table.freeze({
        id = v2.rootId, 
        name = "DataModel", 
        className = "DataModel", 
        parentId = nil, 
        hasChildren = true, 
        fieldValues = nil
    })
});
return v2;