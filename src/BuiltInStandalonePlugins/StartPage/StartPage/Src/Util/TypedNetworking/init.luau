local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_Networking_0 = require(l_script_FirstAncestor_0.Packages.Framework).Http.Networking;
local _ = require(l_script_FirstAncestor_0.Src.Util.TypedPromise);
return l_Networking_0;