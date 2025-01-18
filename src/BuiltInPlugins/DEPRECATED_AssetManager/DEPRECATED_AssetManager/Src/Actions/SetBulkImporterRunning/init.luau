local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "boolean", string.format("SetScreen requires a boolean, not %s", (type(v1))));
    return {
        bulkImporterRunning = v1
    };
end);