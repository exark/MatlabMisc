function [h, p] = ttest_peak(em2, dynole)

em2_peak=max(em2);
dynole_peak=max(dynole);

if length(dynole_peak) < length(em2_peak)
    for i=1:(length(em2_peak)-length(dynole_peak))
        dynole_peak = [dynole_peak [NaN]];
    end
elseif length(em2_peak) < length(dynole_peak)
    for i=1:(length(dynole_peak)-length(em2_peak))
        em2_peak = [em2_peak [NaN]];
    end
end

em2_peak = reshape(em2_peak,length(em2_peak),1);
dynole_peak = reshape(dynole_peak,length(dynole_peak),1);

disp(['EM2 mean:' num2str(nanmean(em2_peak)) ' SEM:' num2str(nanstd(em2_peak)/sqrt(length(find(isnan(em2_peak)==0)))) ' n:' num2str(length(find(isnan(em2_peak)==0)))]);
disp(['Dyn mean:' num2str(nanmean(dynole_peak)) ' SEM:' num2str(nanstd(dynole_peak)/sqrt(length(find(isnan(dynole_peak)==0)))) ' n:' num2str(length(find(isnan(dynole_peak)==0)))]);

[h, p] = ttest2(em2_peak,dynole_peak);