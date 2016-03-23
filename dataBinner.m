function [binned_average, binned_peak] = dataBinner(dataset, binSize)

    binned_average = [];
    binned_peak = [];

    for i=1:binSize:size(dataset,1)
        binned_average = [binned_average; nanmean(dataset(i:(i+binSize-1),:))];
        binned_peak = [binned_peak; max(dataset(i:(i+binSize-1),:))];
    end
    
end