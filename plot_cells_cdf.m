function [edf_res] = plot_cells_cdf(resStruct)
%PLOT_CCP_CDF Summary of this function goes here
%   Detailed explanation goes here

numCells = size(resStruct.lftRes.lftHist_total,1);
theHist = resStruct.lftRes.lftHist_total;
totals = sum(theHist,2);

t_res = resStruct.lftRes.t;

figure;
hold all;
title(inputname(1));

for i=1:numCells
    normalizedHist = theHist(i,:)/totals(i);
    edf_res = cumsum(normalizedHist);
    plot(t_res,edf_res);
end

