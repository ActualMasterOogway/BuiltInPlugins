local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
if require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor)() then
    return;
else
    require(script.Parent.main)(plugin);
    return;
end;