function [newtraining] = FirstCleaning(training)
newtraining = training;

% Removing Missing Values
[newtraining,] = rmmissing(newtraining);

% Dublicate Observations
[B,ix] = sortrows(newtraining);
f = find(diff([false;all(diff(B,1,1)==0,2);false])~=0);
s = ones(length(f)/2,1);
f1 = f(1:2:end-1); f2 = f(2:2:end);
t = cumsum(accumarray([f1;f2+1],[s;-s],[size(B,1)+1,1]));
newtraining(ix(t(1:end-1)>0),:) = [];

% Dublicate Feature Cleaning
newtraining=unique(newtraining.','rows').';

% Zero Variance Filter
newtraining(:,var(newtraining)==0)=[];

end
