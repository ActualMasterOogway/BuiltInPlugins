local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.UI.ContextServices.ContextItem):createSimple("Design", {
    verifyNewItem = function(v1) --[[ Line: 17 ]] --[[ Name: verifyNewItem ]]
        local v2 = false;
        if typeof(v1) == "Instance" then
            v2 = v1:IsA("StyleSheet");
        end;
        assert(v2, "Design.new: Expected a StyleSheet as the target.");
    end
});