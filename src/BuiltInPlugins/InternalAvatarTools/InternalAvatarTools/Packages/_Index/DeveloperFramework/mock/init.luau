local l_mock_0 = script.Parent.Parent.jtaylor_mock.mock;
if l_mock_0.ClassName == "ModuleScript" then
    return require(l_mock_0);
else
    return l_mock_0;
end;