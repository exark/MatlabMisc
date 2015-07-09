function [results, data]=runCME(dataSource)
tic
data = loadConditionData(dataSource, {'Ch2'}, {'egfp'}, 'Parameters', [1.49 60 16e-6]);
[results, data] = cmeAnalysis(data,'Overwrite',true);
toc