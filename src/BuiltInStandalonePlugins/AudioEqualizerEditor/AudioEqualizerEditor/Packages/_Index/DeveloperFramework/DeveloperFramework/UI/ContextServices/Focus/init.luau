local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.UI.ContextServices.ContextItem):createSimple("Focus", {
    verifyNewItem = function(v1) --[[ Line: 17 ]]
        assert(v1 and v1:IsA("LayerCollector"), "Focus.new: Expected a LayerCollector as the target.");
    end
});