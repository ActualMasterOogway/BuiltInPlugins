local l_Parent_0 = script.Parent.Parent;
return function(v1, ...) --[[ Line: 3 ]] --[[ Name: runTests ]]
    -- upvalues: l_Parent_0 (copy)
    return v1.TestBootstrap:run(l_Parent_0:GetChildren(), ...);
end;