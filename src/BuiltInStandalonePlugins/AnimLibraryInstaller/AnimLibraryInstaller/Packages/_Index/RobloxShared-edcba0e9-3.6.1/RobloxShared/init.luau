local l_script_0 = script;
local v1 = require(l_script_0.nodeUtils);
return {
    dedent = require(l_script_0.dedent).dedent, 
    escapePatternCharacters = require(l_script_0.escapePatternCharacters).escapePatternCharacters, 
    expect = require(l_script_0.expect), 
    getRelativePath = require(l_script_0.getRelativePath), 
    RobloxInstance = require(l_script_0.RobloxInstance), 
    nodeUtils = v1, 
    normalizePromiseError = require(l_script_0.normalizePromiseError), 
    pruneDeps = require(l_script_0.pruneDeps), 
    Writeable = require(l_script_0.Writeable).Writeable
};