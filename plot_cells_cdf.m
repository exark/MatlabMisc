function [edf_res] = plot_cells_cdf(resStruct)
%PLOT_CCP_CDF Summary of this function goes here
%   Detailed explanation goes here

numCells = size(resStruct.lftRes.lftHist_Ia,1);

t_res = resStruct.lftRes.t;

figure;
hold all;
title(inputname(1));

for i=1:numCells
    %edf_res = cumsum(resStruct.lftRes.lftHist_Ia(i,:))*(3);
    edf_res = cumsum(resStruct.lftRes.lftHist_IIa(i,:)*(3/2)+resStruct.lftRes.lftHist_Ia(i,:)*(3/2));
    plot(t_res,edf_res);
end

