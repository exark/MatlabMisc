function [edf_res, t_res] = plot_ccp_cdf(resStruct,color)
%PLOT_CCP_CDF Summary of this function goes here
%   Detailed explanation goes here

summedHist = sum(resStruct.lftRes.lftHist_total);
summedHist = summedHist/sum(summedHist);
edf_res = cumsum(summedHist);
t_res = resStruct.lftRes.t;
plot(t_res,edf_res,'color',color);

end

