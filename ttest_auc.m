function [h,p] = ttest_auc(em2, dynole)

em2_auc=trapz(em2-0.95);
dynole_auc=trapz(dynole-0.95);

% em2_auc=max(em2);
% dynole_auc=max(dynole);

if length(dynole_auc) < length(em2_auc)
    for i=1:(length(em2_auc)-length(dynole_auc))
        dynole_auc = [dynole_auc [NaN]];
    end
elseif length(em2_auc) < length(dynole_auc)
    for i=1:(length(dynole_auc)-length(em2_auc))
        em2_auc = [em2_auc [NaN]];
    end
end

em2_auc = reshape(em2_auc,length(em2_auc),1);
dynole_auc = reshape(dynole_auc,length(dynole_auc),1);

disp(['EM2 auc:' num2str(nanmean(em2_auc)) ' SEM:' num2str(nanstd(em2_auc)/sqrt(length(find(isnan(em2_auc)==0)))) ' n:' num2str(length(find(isnan(em2_auc)==0)))])
disp(['Dyn auc:' num2str(nanmean(dynole_auc)) ' SEM:' num2str(nanstd(dynole_auc)/sqrt(length(find(isnan(dynole_auc)==0)))) ' n:' num2str(length(find(isnan(dynole_auc)==0)))])

[h,p] = ttest2(em2_auc,dynole_auc);
disp(p);