local v0 = game:DefineFastFlag("DevFrameworkUseInternalReact", false);
local l_Parent_0 = script.Parent.Parent;
local l_React_0 = l_Parent_0.Parent.Parent.Parent:FindFirstChild("React");
if l_React_0 and l_React_0:IsA("ModuleScript") then
    return require(l_React_0);
elseif v0 and _G.__DEV_FRAMEWORK_USE_INTERNAL_REACT__ then
    return require(l_Parent_0.Parent.React);
else
    return "";
end;